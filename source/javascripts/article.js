function google_analytics() {
    'use strict';
    const analyticsID = 'UA-67916094-6';
    const targetProp = 'ga-disable-' + analyticsID;
    let cookieOptin = localStorage.getItem('ga_cookie_opt_in');

    if(cookieOptin == 'yes') {
        window[targetProp] = false;
    } else {
        window[targetProp] = true;

        if(cookieOptin !== 'no') {
            let accept = document.createElement('aside');
            accept.setAttribute('id', 'name-ga-cookie-accept-bar');
            accept.innerHTML = '<i class="fas fa-exclamation-triangle" aria-hidden="true"></i><detail><a href="/privacy-policy">プライバシーポリシー</a>を遵守しGoogleアナリティクスにより、ユーザーのWebサイト閲覧データを記録しています。</detail><button id="ga-cookie-accept-btn"><i class="fas fa-check" aria-hidden="true"></i>プライバシーポリシーに同意する(Cookieを受け入れる)</button><button id="ga-cookie-deny-btn"><i class="fas fa-ban" aria-hidden="true"></i>プライバシーポリシーに同意しない(Cookieを受け入れない)</button>';
            document.body.appendChild(accept);
        }
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



window.addEventListener('load', function() {
    hljs.initHighlightingOnLoad();

    google_analytics();
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', "#{google_analytics}");

    if('serviceWorker' in navigator) {
        navigator.serviceWorker.register('/javascripts/service-worker.js')
        .then(function() { console.log('Service Worker Registered'); })
        .catch(function(err) { console.log('Service Worker Not Registered', err); });
    }

    const shareBtn = document.getElementById('nativeShare');
});

if(shareBtn){
    shareBtn.onclick = function(){
        const title = document.title;
        const text = document.getElementsByName('description').item(0).content;
        const url = window.location.href;
        navigator.share(
            {
                title: title,
                text: text,
                url: url
            }
        ).catch(
            function(err){
                console.error('Error sharing: ' + err);
            }
        );
    };
}