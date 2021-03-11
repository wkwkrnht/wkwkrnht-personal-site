---
title: ESP32からSwitchbot APIへ継続的にGETリクエストする方法
date: 2021-03-11T15:24:36.079Z
description: ESP32からSwitchbot APIへ、継続的にGETリクエストする方法を、Arduino
  IDEを用いて構築しました。今回は温湿度計の情報取得を主題にしています。
author: wkwkrnht
tags:
  - IoT
  - Arduino
  - ESP32
  - C++
  - SwitchbotAPI
  - Switchbot
---
たまたま、Arduinoと温湿度気圧センサーのセットを触る機会があったので、それの応用としてSwitchbot側と連動させようとしたことがきっかけです。いくつかハマったポイントがあったので、サンプルコードをベースに記しておきたいと思います。コードは、loop関数あるいは元関数から叩く部分、さらにAPIを実際に叩く部分の2つに分かれます。

```
float GET_SW_data(String data_type) {
    StaticJsonDocument<1090> device_data, meeter_data;
    static String meeter_id;
    static float temperature, humidity, Last_access_Time;
    if(Last_access_Time == 0){ // 初回アクセスのみURL同定のためデバイスリスト取得
        device_data = switchbot_API_ACCESS("https://api.switch-bot.com/v1.0/devices");
        meeter_id = device_data["body"]["deviceList"][0]["deviceId"].as<String>();
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
```

ここが

```
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
        str1 += F(" HTTP/1.1\r\nHost: api.switch-bot.com\r\nAuthorization: ==AuthorizationSecret==\r\nConnection: close\r\n\r\n\0"); //closeを使うと、サーバーの応答後に切断される。最後に空行必要
        client.print(str1); //client.println にしないこと。最後に改行コードをプラスして送ってしまう為
        client.flush(); //client出力が終わるまで待つ
        // ヘッダの受信
        Serial.println(F("GET Request Send--------------------\n"));
        while(1){
            String line = client.readStringUntil(PSTR('\n'));
            if(line == F("\r")){ break; } // ヘッダの末尾は\r\nだから終了
            Serial.println(line);
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
```

\==AuthorizationSecret==は各自のものに読みかえてください。また、JSONを展開するところための、中間変数がメモリを静的に確保しているので、そこも環境に応じてです。 シリアルモニターを見ながら、オーバーフローしないだけの場所を確保してください。

まず、他のAPI連携例と違うところは、https接続が必須であるのに、インセキュアで 接続していることです。本来、公開証明書をセットして、コネクションを確立するところです。実挙動ではそれがコネクションエラー、 セットせずにインセキュアとすると、コネクション確立となります。これは、ヘッダー情報も使って認証をかけているためだと思われます。