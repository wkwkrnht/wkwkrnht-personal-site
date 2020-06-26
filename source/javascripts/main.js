const shareBtn = document.getElementById('nativeShare');

function google_analytics() {
    'use strict';
    const analyticsID = 'UA-67916094-6';
    let targetProp = 'ga-disable-' + analyticsID;
    let cookieOptin = localStorage.getItem('ga_cookie_opt_in');
    if(cookieOptin == 'no') {
        console.log('ga_cookie_opt_in = no');
        console.log('ga-disable = true');
        window[targetProp] = true;
    } else if(cookieOptin == 'yes') {
        console.log('ga_cookie_opt_in = yes');
        window[targetProp] = false;
    } else {
        console.log('ga_cookie_opt_in = null');
        window[targetProp] = true;
        let accept = document.createElement('aside');
        accept.setAttribute('id', 'name-ga-cookie-accept-bar');
        accept.innerHTML = '<i class="fas fa-exclamation-triangle" aria-hidden="true"></i><detail>このサイトではGoogleアナリティクスのCookie（クッキー）を使用して、ユーザーのWebサイト閲覧データを記録しています。</detail><a href="/privacy-policy">プライバシーポリシーを確認→</a><button id="ga-cookie-accept-btn"><i class="fas fa-check" aria-hidden="true"></i>同意する(Cookieを受け入れる)</button><button id="ga-cookie-deny-btn"><i class="fas fa-ban" aria-hidden="true"></i>同意しない(Cookieを受け入れない)</button>';
        document.body.appendChild(accept);
    }
    let cookieBar = document.getElementById('name-ga-cookie-accept-bar')
    let acceptBtn = document.getElementById('ga-cookie-accept-btn');
    let denyBtn   = document.getElementById('ga-cookie-deny-btn');
    let resetBtn  = document.getElementById('ga-cookie-reset-btn');
    if(acceptBtn) {
        acceptBtn.onclick = function() {
            localStorage.setItem('ga_cookie_opt_in','yes');
            cookieBar.classList.add('state-remove');
            window.setTimeout('window.location.reload(false)', 500);
        };
    }
    if(denyBtn) {
        denyBtn.onclick = function() {
            localStorage.setItem('ga_cookie_opt_in','no');
            cookieBar.classList.add('state-remove');
            window.setTimeout('window.location.reload(false)', 500);
        };
    }
    if(resetBtn) {
        resetBtn.onclick = function() {
            localStorage.removeItem('ga_cookie_opt_in');
            location.reload(false);
            window.setTimeout('window.location.reload(false)', 500);
        };
    }
}

window.addEventListener('DOMContentLoaded', google_analytics());

if(shareBtn){
    shareBtn.onclick = function(){
        let title = document.title;
        let text = document.getElementsByName('description').item(0).content;
        let url = window.location.href;
        navigator.share({title: title, text: text, url: url}).catch(function(error){console.error('Error sharing: ' + error)});
    };
}

if('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/javascripts/service-worker.js')
    .then(function() { console.log('Service Worker Registered'); })
    .catch(function() { console.log('Service Worker Not Registered'); });
}