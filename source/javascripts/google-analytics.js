window.addEventListener('DOMContentLoaded', function() {
    'use strict';
    let analyticsID = 'UA-67916094-6'; //UA-XXXX-Y の部分は正しいものに書き換えてください
    let targetProp = 'ga-disable-' + analyticsID;
    let cookieOptin = localStorage.getItem('ga_cookie_opt_in'); //localStorage から ga_cookie_opt_in の値を取得
    if(cookieOptin == 'no') { //ga_cookie_opt_in = no なら Google Analytics を無効に
        console.log('ga_cookie_opt_in = no / ga-disable = true');
        window[targetProp] = true; //Disable Google Analytics
    } else if(cookieOptin == 'yes') { //ga_cookie_opt_in = yes なら Google Analytics トラッキングコードを発行
        console.log('ga_cookie_opt_in = yes');
        window[targetProp] = false; //Enable Google Analytics
    } else { //ga_cookie_opt_in に値がない場合は一旦 Google Analytics を無効にして通知を表示
        console.log('ga_cookie_opt_in = null');
        window[targetProp] = true; //Disable Google Analytics（

        //通知の表示（テキストの内容やプライバシーポリシーへのリンクは必要に応じて変更してください）
        var accept = document.createElement('aside');
        accept.setAttribute('id', 'name-ga-cookie-accept-bar');
        accept.innerHTML = '<i aria-hidden="true"></i><detail>このサイトではGoogleアナリティクスのCookie（クッキー）を使用して、ユーザーのWebサイト閲覧データを記録しています。</detail><a href="/privacy-policy">プライバシーポリシーを確認→</a><button id="ga-cookie-accept-btn"<i aria-hidden="true"></i>同意する(Cookieを受け入れる)</button><button id="ga-cookie-deny-btn"><i aria-hidden="true"></i>同意しない(Cookieを受け入れない)</button>';
        document.body.appendChild(accept);
    }

    //各ボタンの取得
    let cookieBar = document.getElementById('name-ga-cookie-accept-bar')
    let acceptBtn = document.getElementById('ga-cookie-accept-btn');
    let denyBtn   = document.getElementById('ga-cookie-deny-btn');
    let resetBtn  = document.getElementById('ga-cookie-reset-btn');
    if(acceptBtn) { //「同意する」ボタンのクリックでオプトイン（ga_cookie_opt_in = yes）
        acceptBtn.onclick = function() {
            localStorage.setItem('ga_cookie_opt_in','yes');
            cookieBar.classList.add('state-remove');
            //CSS Animation が完了するまで待機するための力技……
            window.setTimeout('window.location.reload(false)', 500);
        };
    }
    if(denyBtn) { //「同意しない」ボタンのクリックでオプトアウト（ga_cookie_opt_in = no）
        denyBtn.onclick = function() {
            localStorage.setItem('ga_cookie_opt_in','no');
            cookieBar.classList.add('state-remove');
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