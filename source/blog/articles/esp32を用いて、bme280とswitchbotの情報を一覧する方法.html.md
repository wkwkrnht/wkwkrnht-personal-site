---
title: ESP32を用いて、BME280とSwitchbotの情報を一覧する方法
date: 2021-04-03T16:51:27.249Z
author: wkwkrnht
tags:
  - ESP32
  - IoT
  - スマートホーム
  - Switchbot
  - API
  - 温湿度
  - 気圧
  - Arduino
---
先日、[こちら](https://wkwkrnht.netlify.app/2021/03/11/esp32%E3%81%8B%E3%82%89switchbot-api%E3%81%B8%E7%B6%99%E7%B6%9A%E7%9A%84%E3%81%ABget%E3%83%AA%E3%82%AF%E3%82%A8%E3%82%B9%E3%83%88%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95.html)を公開しました。この記事の続きで、I2C接続可能な環境センサーと、統合した表示を構築しました。色々と荒いですが、形になったということで、まとめていきます。

    #include <ArduinoJson.h>
    #include <TimeLib.h>
    #include <Wire.h>
    #include <IPAddress.h>
    #include <WiFi.h>
    #include <WiFiUdp.h>
    #include <WiFiClientSecure.h>
    #include <WiFiServer.h>
    #include "SparkFunBME280.h"

    BME280 sensor;
    volatile boolean SSE_on = false; //Server-Sent Event フラグ
    const int SAMPLE_RATE = 1000;
    const int SAMPLE_MS = (1000 / SAMPLE_RATE);

    WiFiClientSecure client;
    WiFiUDP udp;
    WiFiServer server(80);

    //******************NTPリクエストパケット送信****************************
    const int NTP_PACKET_SIZE = 48; // NTP time stamp is in the first 48 bytes of the message
    IPAddress timeServerIP; // time.nist.gov NTP server address
    byte packetBuffer[NTP_PACKET_SIZE]; //buffer to hold incoming and outgoing packets

    void setupNTPsetting() {
        const char* ntpServerName = PSTR("time.nist.gov"); // time.nist.gov NTP server
        WiFi.hostByName(ntpServerName, timeServerIP);
        setSyncProvider(getNtpTime);
    }
    void sendNTPpacket(IPAddress& address) {
        Serial.println(F("initializing NTP packet..."));
        memset(packetBuffer, 0, NTP_PACKET_SIZE); // set all bytes in the buffer to 0
        // Initialize values needed to form NTP request. (see URL above for details on the packets)
        packetBuffer[0] = 0b11100011; // LI, Version, Mode
        packetBuffer[1] = 0;    // Stratum, or type of clock
        packetBuffer[2] = 6;    // Polling Interval
        packetBuffer[3] = 0xEC; // Peer Clock Precision
        // 8 bytes of zero for Root Delay & Root Dispersion
        packetBuffer[12]  = 49;
        packetBuffer[13]  = 0x4E;
        packetBuffer[14]  = 49;
        packetBuffer[15]  = 52;
        Serial.println(F("sending NTP packet..."));
        // all NTP fields have been given values, now. You can send a packet requesting a timestamp:
        udp.beginPacket(address, 123); //NTP requests are to port 123
        udp.write(packetBuffer, NTP_PACKET_SIZE);
        udp.endPacket();
        Serial.println(F("finish NTP packet sending"));
    }
    time_t getNtpTime() {
        Serial.println(F("GET Time via NTP--------------------"));
        while (udp.parsePacket() > 0) ; // discard any previously received packets
        sendNTPpacket(timeServerIP);
        uint32_t beginWait = millis();
        while(millis() - beginWait < 1500){
            delay(1); //これを入れないと更新できない場合がある。
            int size = udp.parsePacket();
            if (size >= NTP_PACKET_SIZE) {
                udp.read(packetBuffer, NTP_PACKET_SIZE);  // read packet into the buffer
                unsigned long secsSince1900;
                // convert four bytes starting at location 40 to a long integer
                secsSince1900 =  (unsigned long)packetBuffer[40] << 24;
                secsSince1900 |= (unsigned long)packetBuffer[41] << 16;
                secsSince1900 |= (unsigned long)packetBuffer[42] << 8;
                secsSince1900 |= (unsigned long)packetBuffer[43];
                Serial.println(F("Prepared time got"));
                return secsSince1900 - 2208988800UL + 9 * SECS_PER_HOUR; // secsSince1900 - 2208988800UL + timeZone * SECS_PER_HOUR
            }
        }
        Serial.println(F("unable to get the time"));
        return 0;
    }

    String fillZero(int timevariable) {
        if(timevariable < 10){
            return "0" + String(timevariable);
        }else{
            return String(timevariable);
        }
    }

    JsonObject switchbot_API_ACCESS(String base_URI){
        JsonObject doc;
        WiFiClientSecure client;
        client.setInsecure();
        if(!client.connect(PSTR("api.switch-bot.com"), 443)){
            Serial.println(F("connection failed--------------------\n"));
        }else{
            String payload;
            String str1 = F("GET ");
            str1 += String(base_URI);
            str1 += F(" HTTP/1.1\r\nHost: api.switch-bot.com\r\nAuthorization: SECRET\r\nConnection: close\r\n\r\n\0"); //closeを使うと、サーバーの応答後に切断される。最後に空行必要
            client.print(str1); //client.println にしないこと。最後に改行コードをプラスして送ってしまう為
            client.flush(); //client出力が終わるまで待つ
            // ヘッダの受信
            Serial.println(F("GET Request Send--------------------\n"));
            while(1){
                String line = client.readStringUntil(PSTR('\n'));
                if(line == F("\r")){ break; } // ヘッダの末尾は\r\nだから終了
            }
            // ボディの表示
            while(client.available()){ payload += client.readStringUntil('\r'); } //サーバーから送られてきた文字を１文字も余さず受信し切ることが大事
            delay(10);
            client.stop(); //特に重要。コネクションが終わったら必ず stop() しておかないとヒープメモリを食い尽くしてしまう。
            delay(10);
            Serial.println(F("Client Stop--------------------\n"));
            DynamicJsonDocument jsonBuffer(1090);
            DeserializationError error = deserializeJson(jsonBuffer, payload);
            if(error){
                Serial.print(F("deserializeJson() failed: "));
                Serial.println(error.f_str());
            }else{
                doc = jsonBuffer.as<JsonObject>();
            }
        }
        return doc;
    }

    float GET_SW_data(String data_type) {
        StaticJsonDocument<1090> device_data, meeter_data;
        static String meeter_id;
        static float temperature, humidity, Last_access_Time;
        if(Last_access_Time == 0){ // 初回アクセスのみURL同定のためデバイスリスト取得
            device_data = switchbot_API_ACCESS("https://api.switch-bot.com/v1.0/devices");
            meeter_id = device_data[F("body")][F("deviceList")][0][F("deviceId")].as<String>();
            goto GET_meeter_data;
        }else if((millis() - Last_access_Time) > 120000){ // 周期設定 120000[ms] = 120[s] = 2[min]
            goto GET_meeter_data;
        }else{
            Serial.println(F("\nREAD switchbot data from cache--------------------\n"));
            goto RETURN_data;
        }
        GET_meeter_data: {
            setupNTPsetting();
            Last_access_Time = millis();
            Serial.println(F("\nREAD data from switchbot API--------------------\n"));
            meeter_data = switchbot_API_ACCESS("https://api.switch-bot.com/v1.0/devices/" + meeter_id + "/status");
            temperature = meeter_data[F("body")][F("temperature")];
            humidity = meeter_data[F("body")][F("humidity")];
        }
        RETURN_data: {
            if(data_type == F("Temprature")){
                return temperature;
            }else if(data_type == F("Humidity")){
                return humidity;
            }else{
                return 0;
            }
        }
    }

    //**************Server-Sent Events データ送信関数****************************
    void SSE_Responce(void *pvParameters) { //HTTPレスポンス１度目を送信したら、すぐにブラウザから２回目のGETリクエストが来る
        String sse_str, sync_time, str_time, req;
        static float Temprature_SW, Temprature, Humidity, Pressure, Humidity_SW;
        static long Last_send_time = 0;
        while(1){ //無限ループ
            WiFiClient client = server.available(); //クライアント生成は各関数内でしか実行できないので注意
            portTickType xLastWakeTime = xTaskGetTickCount();
            while(client){
                req = client.readStringUntil(PSTR('\r'));
                if(req.indexOf(F("GET")) != -1){//２回目のGETを検知したらServer-Sent Eventsレスポンス送信
                    while(req.indexOf(F("Accept-Language")) == -1){
                        req = client.readStringUntil(PSTR('\r'));
                    }
                    if(SSE_on == true){
                        Serial.println(F("\nsse responce accepted--------------------\r"));
                        client.print(F("HTTP/1.1 200 OK\r\nContent-Type:text/event-stream\r\nCache-Control:no-cache\r\n\r\n")); //ストリーム配信をブラウザが認識するためのレスポンス。最後の空行が必要
                        delay(3000);//ここの秒数はもう少し少なくても問題ない
                        Serial.println(F("sse header send--------------------\n"));
                        Last_send_time = millis();
                        sync_time = F("?:?:?");
                        while(client){//Event Sourceデータの無限ループストリーム送信
                            str_time = fillZero(hour());
                            str_time += F(":");
                            str_time += fillZero(minute());
                            str_time += F(":");
                            str_time += fillZero(second());
                            if((millis() - Last_send_time) > 30000){ //３０秒毎にNTPサーバーから時刻をゲットしてArduinoタイムを修正
                                setupNTPsetting();
                                Last_send_time = millis();
                                sync_time = str_time;
                            }
                            Serial.println(F("\nGET data from GPIO--------------------\n"));
                            Temprature = sensor.readTempC();
                            Humidity = sensor.readFloatHumidity();
                            Pressure = sensor.readFloatPressure() / 100.0;
                            Serial.println(F("\nGET data from switchbot--------------------\n"));
                            Temprature_SW = GET_SW_data(F("Temprature"));
                            Humidity_SW = GET_SW_data(F("Humidity"));
                            Serial.println(F("sse body send--------------------\n"));
                            sse_str = F("event:Time\ndata:"); //ブラウザへ送るeventを発生させて、data:の後に送りたいデータ、末尾は改行コード
                            sse_str += String(year());
                            sse_str += F("/");
                            sse_str += String(month());
                            sse_str += F("/");
                            sse_str += String(day());
                            sse_str += F(" ");
                            sse_str += str_time;
                            sse_str += F("\n\nevent:NTP\ndata:"); //最後にNTPサーバから取得した時刻
                            sse_str += sync_time;
                            sse_str += F("\n\nevent:D_Humidity\ndata:");
                            client.print(sse_str);
                            client.print(Humidity);
                            client.print(F("\n\nevent:D_Temprature\ndata:"));
                            client.print(Temprature);
                            client.print(F("\n\nevent:D_Pressure\ndata:"));
                            client.print(Pressure);
                            client.print(F("\n\nevent:SW_Humidity\ndata:"));
                            client.print(Humidity_SW);
                            client.print(F("\n\nevent:SW_Temprature\ndata:"));
                            client.print(Temprature_SW);
                            client.print(F("\n\n")); //イベントを発生させるためには必ず改行コード２回連続をつける
                            Serial.println(F("sse data send--------------------\n"));
                            sse_str = "";
                            delay(1000);
                        }
                        client.stop();
                        Serial.println(F("Client.Stop-----------------\n"));
                        SSE_on = false;
                        break;
                    }
                }
                req = "";
            }
            vTaskDelayUntil(&xLastWakeTime, SAMPLE_MS / portTICK_PERIOD_MS);
        }
    }

    void HTTP_Responce(void *pvParameters) {
        while(1){ //無限ループ
            WiFiClient client = server.available();//クライアント生成は各関数内でしか実行できないので注意
            portTickType xLastWakeTime = xTaskGetTickCount();
            String response, req;
            while(client){
                req = client.readStringUntil(PSTR('\r'));
                Serial.println(F("new client--------------\n"));
                if(req.indexOf(F("GET /history HTTP")) != -1){ //ブラウザからリクエストを受信したらこの文字列を検知する
                    response = F("HTTP/1.1 200 OK\r\nContent-Type:text/html\r\nConnection:close\r\n\r\n&lt;!DOCTYPE html&gt;&lt;html&gt;&lt;head&gt;&lt;meta name=viewport content=&#39;width=device-width, initial-scale=1&#39;&gt;&lt;style&gt;body{background-color:#222;color:#bbb;text-align:center;text-shadow:#000 -1px -1px 5px;}header{font-size:2.5em;margin:0 0 50px;padding:0;width:100vw;}section{display:grid;grid-template-columns:800px 800px;grid-template-rows:4em 600px;height:700px;padding:0;}.desk{top:150px;}.sw{top:800px;}h2{font-size:2em;grid-row:1;}figure{grid-row:2;margin:0;padding:0;position:relative;width:800px;}.caption{font-size:1.5em;}.outer{left:0;position:absolute;top:0;z-index:0;}.inner{border:1px #fff solid;left:50px;position:absolute;top:50px;z-index:1;}&lt;/style&gt;&lt;/head&gt;&lt;body&gt;&lt;header&gt;&lt;span id=time&gt;Time&lt;/span&gt;&lt;span id=time-sync&gt;(NTP Udate)&lt;/span&gt;&lt;/header&gt;&lt;section class=desk&gt;&lt;h2&gt;Desk&lt;/h2&gt;&lt;figure id=humid-d&gt;&lt;canvas class=outer width=800 height=600&gt;&lt;/canvas&gt;&lt;canvas class=inner width=700 height=500&gt;&lt;/canvas&gt;&lt;h3 class=caption&gt;Humidity&lt;/h3&gt;&lt;/figure&gt;&lt;figure id=temp-d&gt;&lt;canvas class=outer width=800 height=600&gt;&lt;/canvas&gt;&lt;canvas class=inner width=700 height=500&gt;&lt;/canvas&gt;&lt;h3 class=caption&gt;Temperature&lt;/h3&gt;&lt;/figure&gt;&lt;figure id=pressure-d&gt;&lt;canvas class=outer width=800 height=600&gt;&lt;/canvas&gt;&lt;canvas class=inner width=700 height=500&gt;&lt;/canvas&gt;&lt;h3 class=caption&gt;Air Pressure&lt;/h3&gt;&lt;/figure&gt;&lt;/section&gt;&lt;section class=sw&gt;&lt;h2&gt;Switchbot&lt;/h2&gt;&lt;figure id=humid-sw&gt;&lt;canvas class=outer width=800 height=600&gt;&lt;/canvas&gt;&lt;canvas class=inner width=700 height=500&gt;&lt;/canvas&gt;&lt;h3 class=caption&gt;Humidity&lt;/h3&gt;&lt;/figure&gt;&lt;figure id=temp-sw&gt;&lt;canvas class=outer width=800 height=600&gt;&lt;/canvas&gt;&lt;canvas class=inner width=700 height=500&gt;&lt;/canvas&gt;&lt;h3 class=caption&gt;Temperature&lt;/h3&gt;&lt;/figure&gt;&lt;/section&gt;&lt;script&gt;const source = new EventSource(&#39;");
                    response += String(WiFi.localIP());
                    response += F("&#39;);window.addEventListener(&#39;beforeunload&#39;,function(e){source.close();});const canvas_list=[[&#39;humid-d&#39;,&#39;100%&#39;,&#39;80%&#39;,&#39;60%&#39;,&#39;40%&#39;,&#39;20%&#39;,&#39;0%&#39;],[&#39;temp-d&#39;,&#39;50*C&#39;,&#39;40*C&#39;,&#39;30*C&#39;,&#39;20*C&#39;,&#39;10*C&#39;,&#39;0*C&#39;],[&#39;pressure-d&#39;,&#39;2000&#39;,&#39;1600&#39;,&#39;1200&#39;,&#39;800&#39;,&#39;400&#39;,&#39;0&#39;],[&#39;humid-sw&#39;,&#39;100%&#39;,&#39;80%&#39;,&#39;60%&#39;,&#39;40%&#39;,&#39;20%&#39;,&#39;0%&#39;],[&#39;temp-sw&#39;,&#39;50*C&#39;,&#39;40*C&#39;,&#39;30*C&#39;,&#39;20*C&#39;,&#39;10*C&#39;,&#39;0*C&#39;]];function draw_data(graph,id,HTMLdata,varbar){let e = document.querySelector(&#39;#&#39; + id + &#39; .caption&#39;);e.innerHTML = HTMLdata;let p = -(graph * varbar);let c = document.querySelector(&#39;#&#39; + id + &#39; .inner&#39;);let ctx = c.getContext(&#39;2d&#39;);let g = ctx.createLinearGradient(0,0,0,500);ctx.save();ctx.drawImage(c,1,0);ctx.fillStyle = &#39;#222&#39;;ctx.fillRect(0,0,3,500);g.addColorStop(0,&#39;rgba(255,0,0,1)&#39;);g.addColorStop(0.6,&#39;rgba(255,255,0,0.5)&#39;);g.addColorStop(0.8,&#39;rgba(77,255,77,0.5)&#39;);g.addColorStop(1,&#39;rgba(0,0,255,0.5)&#39;);ctx.fillStyle = g;ctx.fillRect(0,500,3,p);ctx.restore();}onload = function(){canvas_list.forEach(function(a_canvas,index){let canvas = document.querySelector(&#39;#&#39; + a_canvas[0] + &#39; .outer&#39;);let ctx = canvas.getContext(&#39;2d&#39;);ctx.save();ctx.fillStyle = &#39;#fff&#39;;ctx.textBaseline = &#39;middle&#39;;ctx.font = &#39;40px&#39;;ctx.fillText(a_canvas[1],0,50,90);ctx.fillText(a_canvas[2],0,150,90);ctx.fillText(a_canvas[3],0,250,90);ctx.fillText(a_canvas[4],0,350,90);ctx.fillText(a_canvas[5],0,450,90);ctx.fillText(a_canvas[6],0,550,90);ctx.restore();});};source.addEventListener(&#39;Time&#39;,function(event){let ms = document.getElementById(&#39;time&#39;);ms.innerHTML = event.data;});source.addEventListener(&#39;NTP&#39;,function(event){let ms=document.getElementById(&#39;time-sync&#39;);ms.innerHTML = &#39; (NTP Update: &#39; + event.data + &#39;)&#39;;});source.addEventListener(&#39;D_Humidity&#39;,function(event){let HTMLdata = &#39;Humidity=&#39; + event.data + &#39; %&#39;;draw_data(event.data,&#39;humid-d&#39;,HTMLdata,5);});source.addEventListener(&#39;D_Temprature&#39;,function(event){let HTMLdata = &#39;Temperature=&#39; + event.data + &#39; *C&#39;;draw_data(event.data,&#39;temp-d&#39;,HTMLdata,10);});source.addEventListener(&#39;D_Pressure&#39;,function(event){let HTMLdata = &#39;Pressure=&#39; + event.data + &#39; hPa&#39;;draw_data(event.data,&#39;pressure-d&#39;,HTMLdata,0.25);});source.addEventListener(&#39;SW_Humidity&#39;,function(event){let HTMLdata = &#39;Humidity=&#39; + event.data + &#39; %&#39;;draw_data(event.data,&#39;humid-sw&#39;,HTMLdata,5);});source.addEventListener(&#39;SW_Temprature&#39;,function(event){let HTMLdata = &#39;Temperature=&#39; + event.data + &#39; *C&#39;;draw_data(event.data,&#39;temp-sw&#39;,HTMLdata,10);});&lt;/script&gt;&lt;/body&gt;&lt;/html&gt;");
                }else if(req.indexOf(F("GET /clock HTTP")) != -1){ //ブラウザからリクエストを受信したらこの文字列を検知する
                    response = F("HTTP/1.1 200 OK\r\nContent-Type:text/html\r\nConnection:close\r\n\r\n&lt;!DOCTYPE html&gt;&lt;html&gt;&lt;head&gt;&lt;meta name=&#39;viewport&#39; content=&#39;height=device-height, width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no&#39;&gt;&lt;style&gt;::-webkit-scrollbar{display:none;}body{height:1080px;margin:0;overflow:none;padding:0;position:relative;width:1920px;}body[data-pressurealart=&#39;on&#39;]{background-color:#f0d43a;}body[data-pressurealart=&#39;off&#39;]{background-color:#444;}.canvas{bottom:0;margin:40px 0;padding:0;position:absolute;width:400px;z-index:1;}.heat{background-color:#ff1d02;}.humid{background-color:#03a9f4;}#heat-d{left:60px;}#humid-d{left:500px;}#heat-sw{right:500px;}#humid-sw{right:60px;}.time{color:#222;font-size:420px;height:360px;letter-spacing:235px;margin:0;padding:0;position:absolute;text-shadow:#111 -1px -1px 5px;top:360px;width:650px;word-break:keep-all;z-index:100;}#hour{left:155px;}#min{left:1110px;}.glass{background-color:#fff;height:1080px;left:0;margin:0;opacity:0.1;padding:0; position:absolute;top:0;width:1920px;z-index:10;}&lt;/style&gt;&lt;/head&gt;&lt;body data-pressurealart=&#39;off&#39;&gt;&lt;div id=heat-d class=&#39;canvas heat&#39;&gt;&lt;/div&gt;&lt;div id=humid-d class=&#39;canvas humid&#39;&gt;&lt;/div&gt;&lt;div id=heat-sw class=&#39;canvas heat&#39;&gt;&lt;/div&gt;&lt;div id=humid-sw class=&#39;canvas humid&#39;&gt;&lt;/div&gt;&lt;div class=glass&gt;&lt;/div&gt;&lt;div id=hour class=time&gt;00&lt;/div&gt;&lt;div id=min class=time&gt;00&lt;/div&gt;&lt;script&gt;const source = new EventSource(&#39;");
                    response += String(WiFi.localIP());
                    response += F("&#39;);window.addEventListener(&#39;beforeunload&#39;,function(e){source.close();});let delta_p = 1013;function draw_temp(e,id){let n = Number(e);if(n &gt; 40){n = 40;}else if(n &lt; -10){n = -10;}let ele = document.getElementById(id);ele.setAttribute(&#39;style&#39;,&#39;height:&#39; + ((n + 10) * 20).toString() + &#39;px;&#39;);}function draw_humid(e,id){let n = Number(e);let ele = document.getElementById(id);ele.setAttribute(&#39;style&#39;,&#39;height:&#39; + (n * 10).toString() + &#39;px;&#39;);}source.addEventListener(&#39;Time&#39;,function(event){let h = document.getElementById(&#39;hour&#39;);let m = document.getElementById(&#39;min&#39;);let s = event.data;h.innerHTML = s.slice(-8,-6);m.innerHTML = s.slice(-5,-3);});source.addEventListener(&#39;D_Pressure&#39;,function(event){let e = document.body;e = e.dataset;let p = event.data;if(Math.abs(p - delta_p) &gt; 10){e.pressurealart = &#39;on&#39;;}else{e.pressurealart = &#39;off&#39;;}delta_p = p;});source.addEventListener(&#39;D_Humidity&#39;,function(event){draw_humid(event.data,&#39;humid-d&#39;);});source.addEventListener(&#39;D_Temprature&#39;,function(event){draw_temp(event.data,&#39;heat-d&#39;);});source.addEventListener(&#39;SW_Humidity&#39;,function(event){draw_humid(event.data,&#39;humid-sw&#39;);});source.addEventListener(&#39;SW_Temprature&#39;,function(event){draw_temp(event.data,&#39;heat-sw&#39;);});&lt;/script&gt;&lt;/body&gt;&lt;/html&gt;");
                }else{
                    response = F("HTTP/1.1 404 Not Found\r\nContent-Type:text/html\r\nConnection:close\r\n\r\n&lt;!DOCTYPE html&gt;&lt;meta name=viewport content=&#39;width=device-width, initial-scale=1&#39;&gt;&lt;style&gt;body{background-color:#222;color:#fff;text-align:center;}h1{font-size:3em;}nav{align-content:space-around;align-items:baseline;display:flex;flex-flow:row wrap;justify-content:space-evenly;}a{border-radius:1em;box-shadow:0 0 3vmin rgba(0,0,0,.4);box-sizing:border-box;color:#fff;display:block;font-size:2em;margin:2em;padding:1em 2em;text-decoration:none;width:10em;}a[href=&#39;/clock&#39;]{background-color:#03ce55;}a[href=&#39;/history&#39;]{background-color:#560787;}&lt;/style&gt;&lt;/head&gt;&lt;body&gt;&lt;h1&gt;404 Not Found&lt;/h1&gt;&lt;nav&gt;&lt;a href=&#39;/clock&#39; target=&#39;_blank&#39;&gt;CLOCK&lt;/a&gt;&lt;a href=&#39;/history&#39; target=&#39;_blank&#39;&gt;HISTORY&lt;/a&gt;&lt;/nav&gt;&lt;/body&gt;&lt;/html&gt;");
                }
                delay(1000); //2秒待ってレスポンスをブラウザに送信
                client.print(response);
                Serial.println(F("SENT HTTP DATA--------------------\n"));
                delay(10); //これが重要！これが無いと切断できないかもしれない
                client.stop();
                Serial.println(F("GET HTTP client stop--------------------\n"));
                SSE_on = true; //Server-Sent Event 設定終了フラグ
                response = "";
                req = "";
                break;
            }
            vTaskDelayUntil(&xLastWakeTime, SAMPLE_MS / portTICK_PERIOD_MS);
        }
    }

    void setupBME280() {
        Wire.begin();
        sensor.setI2CAddress(0x76);
        while(1){
            if(sensor.beginI2C()){
                Serial.println(F("I2C address: 0x76"));
                return;
            }
            sensor.setI2CAddress(0x77);
            if(sensor.beginI2C()){
                Serial.println(F("I2C address: 0x77"));
                return;
            }
            Serial.println(F("Sensor connect failed"));
        }
        return;
    }

    void setup() {
        // ウォッチドッグ停止
        disableCore0WDT();
        disableCore1WDT();

        Serial.begin(115200); //このシリアル通信はモニター用
        delay(10);
        setupBME280();

        WiFi.begin(PSTR("SSID"), PSTR("PASSWORD"));
        while (WiFi.status() != WL_CONNECTED) {
            delay(1000);
            Serial.print(F("."));
        }
        Serial.print(F("Wi-Fi Connected! IP address: "));
        Serial.println(WiFi.localIP());
        server.begin(); // Start the server
        Serial.print(F("Server started! IP address: "));
        Serial.println(WiFi.localIP());

        //NTPサーバーでタイムを取得
        udp.begin(2390); //Set portto listen for UDP packets
        setupNTPsetting();

        //各サイクルを固定
        xTaskCreatePinnedToCore(HTTP_Responce, PSTR("HTTP_Responce"), 2048, (void *)SSE_on, 1, NULL, 0);
        xTaskCreatePinnedToCore(SSE_Responce, PSTR("SSE_Responce"), 8192, (void *)SSE_on, 0, NULL, 1);
    }

    void loop() {
        delay(1000);
    }

clockディレクトリが、時刻表示をメインに、数字の背後に温度あるいは湿度をバー表示し、気圧の変化が急峻なときに背景色で警告するモード。historyディレクトリが、日時表示、NTPサーバーとの通信時刻、温湿度、気圧データを時刻、センサーデバイスでそれぞれグルーピングして、積み上げグラフ表示しています。

実装をかんたんに説明します。いくつか、実装そのものを取ってきている部分がありますけど、それは省きます。cCore0において画面構成用HTML配信、Core1においてその他データ取得から配信まで、それぞれ担当させています。このメリットは複数クライアントからのリクエストに対応できることです。ウォッチドックタイマーはやむなく停止していますが、復活させなければいけないですね。

HTML内に、CSS、JSも纏めて記載しているので、展開してお読みください。JSが一番の肝なので、そこに焦点当てると、SSEの開始、停止処理、SSEとして送られてくるデータの加工に大別できます。加工したデータは、Canvas APIを用いて描画しています。描画処理については、ネタ元そのままなので省きます。ただ、関数化したときに、データへの係数が大きすぎたので、調整しました。

全体負荷が相当に重くなっているはずなので、Fマクロ、PSTRマクロは重用しています。フットプリント縮小のためにも、できる限りの関数化はしていますが、そもそも効率が悪い箇所等あれば、指摘がほしいです。実際、まだまだ改良点はあるので、機を見て修正していきます。

## 参照

EMBEDLY http://www.musashinodenpa.com/arduino/ref/index.php?f=0&pos=1830

EMBEDLY https://qiita.com/nanase/items/f34e03c29410add9c4d0

EMBEDLY https://www.mgo-tec.com/blog-entry-55.html

EMBEDLY https://westgate-lab.hatenablog.com/entry/2020/03/28/113621

EMBEDLY https://github.com/espressif/arduino-esp32/blob/master/libraries/WiFiClientSecure/src/WiFiClientSecure.h

EMBEDLY https://github.com/OpenWonderLabs/SwitchBotAPI