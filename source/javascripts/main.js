const analyticsID = 'UA-67916094-6';
const shareBtn = document.getElementById('nativeShare');

async function google_analytics_GDPR(analyticsID) {
    'use strict';
    const targetProp = 'ga-disable-' + analyticsID;
    let cookieOptin = localStorage.getItem('ga_cookie_opt_in');

    if(cookieOptin == 'yes') {
        window[targetProp] = false;
    } else {
        window[targetProp] = true;

        if(cookieOptin !== 'no') {
            let accept = document.createElement('aside');
            accept.setAttribute('id', 'name-ga-cookie-accept-bar');
            accept.innerHTML = '<i class="fas fa-exclamation-triangle" aria-hidden="true"></i><detail>当サイトは<a href="/privacy-policy">プライバシーポリシー</a>を遵守しGoogleアナリティクスにより、ユーザーのWebサイト閲覧データを記録しています。あなたはプライバシーポリシーをよく読んだ上で同意しますか？</detail><button id="ga-cookie-accept-btn"><i class="fas fa-check" aria-hidden="true"></i>同意する(Allowed Cookie)</button><button id="ga-cookie-deny-btn"><i class="fas fa-ban" aria-hidden="true"></i>同意しない(Denied Cookie)</button>';
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

async function google_analytics (analyticsID) {
    window.dataLayer = window.dataLayer || [];
    function gtag(){
        dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', analyticsID);
}

window.addEventListener('load', function(analyticsID) {
    google_analytics_GDPR(analyticsID);

    if('serviceWorker' in navigator) {
        navigator.serviceWorker.register('/javascripts/service-worker.js')
        .then(function(workerPath) {
            //
         })
        .catch(function(err) {
            console.log('Service Worker Not Registered', err);
        });

        const codes = document.querySelectorAll('pre code');

        codes.forEach((code) => {
            if (code.classList.contains('nohighlight')) {
                return; // nohighlight クラスが指定された要素は対象外とする
            }

            code.classList.add('hljs'); // これがないと背景色がつかない！！

            const worker = new Worker('/javascripts/service-worker.js');
            worker.onmessage = (event) => {
                code.innerHTML = event.data;
            }
            worker.postMessage(code.textContent);
        });
    } else {
        hljs.highlightAll();
    }

    google_analytics(analyticsID);
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
                console.error('Error while sharing', err);
            }
        );
    };
}
