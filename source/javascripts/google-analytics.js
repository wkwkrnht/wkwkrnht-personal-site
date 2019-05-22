window.addEventListener('DOMContentLoaded', function() {
    'use strict';
    var analyticsID = 'UA-67916094-6'; //UA-XXXX-Y の部分は正しいものに書き換えてください
    var targetProp = 'ga-disable-' + analyticsID;
    var cookieOptin = localStorage.getItem('ga_cookie_opt_in'); //localStorage から ga_cookie_opt_in の値を取得
    if(cookieOptin == 'no') { //ga_cookie_opt_in = no なら Google Analytics を無効に
        console.log('ga_cookie_opt_in = no / ga-disable = true');
        window[targetProp] = true; //Disable Google Analytics
    } else if(cookieOptin == 'yes') { //ga_cookie_opt_in = yes なら Google Analytics トラッキングコードを発行
        console.log('ga_cookie_opt_in = yes');
        window[targetProp] = false; //Enable Google Analytics
    } else { //ga_cookie_opt_in に値がない場合は一旦 Google Analytics を無効にして通知を表示
        console.log('ga_cookie_opt_in = null');
        window[targetProp] = true; //Disable Google Analytics（UA-XXXX-Y の部分は正しいものに書き換えてください）

        // ↓Google Web Fonts から Material Icons を読み込み（すでに別で読み込んでいる場合は削除可）↓
        var iconcss = document.createElement('link');
        iconcss.href = 'https://fonts.googleapis.com/icon?family=Material+Icons';
        iconcss.setAttribute('rel', 'stylesheet');
        document.head.appendChild(iconcss);
        // ↑Google Web Fonts から Material Icons を読み込み（すでに別で読み込んでいる場合は削除可）↑

        //通知の表示（テキストの内容やプライバシーポリシーへのリンクは必要に応じて変更してください）
        var accept = document.createElement('div');
        accept.setAttribute('id', 'name-ga-cookie-accept-bar');
        accept.innerHTML = '<p><i aria-hidden="true"></i>このサイトではGoogleアナリティクスのCookie（クッキー）を使用して、ユーザーのWebサイト閲覧データを記録しています。<a href="/privacy-policy"><i aria-hidden="true"></i>プライバシーポリシーを確認</a></p><p><button id="ga-cookie-accept-btn"<i aria-hidden="true"></i>同意して Cookie を受け入れる</button><button id="ga-cookie-deny-btn"><i aria-hidden="true"></i>同意しない</button></p>';
        document.body.appendChild(accept);
    }

    //各ボタンの取得
    var acceptBtn = document.getElementById('ga-cookie-accept-btn');
    var denyBtn   = document.getElementById('ga-cookie-deny-btn');
    var resetBtn  = document.getElementById('ga-cookie-reset-btn');
    if(acceptBtn) { //「同意する」ボタンのクリックでオプトイン（ga_cookie_opt_in = yes）
        acceptBtn.onclick = function() {
            localStorage.setItem('ga_cookie_opt_in','yes');
            document.getElementById('name-ga-cookie-accept-bar').classList.add('state-remove');
            //CSS Animation が完了するまで待機するための力技……
            window.setTimeout('window.location.reload(false)', 500);
        };
    }
    if(denyBtn) { //「同意しない」ボタンのクリックでオプトアウト（ga_cookie_opt_in = no）
        denyBtn.onclick = function() {
            localStorage.setItem('ga_cookie_opt_in','no');
            document.getElementById('name-ga-cookie-accept-bar').classList.add('state-remove');
            window.setTimeout('window.location.reload(false)', 500);
        };
    }
    if(resetBtn) { //「設定をリセット」ボタンのクリックで ga_cookie_opt_in の値を削除
        resetBtn.onclick = function() {
            localStorage.removeItem('ga_cookie_opt_in');
            location.reload(false);
        };
    }
});