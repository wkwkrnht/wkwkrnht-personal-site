let shareBtn = document.getElementById('nativeShare');
if(shareBtn){
    shareBtn.onclick = function(){
        let title = document.title;
        let text = document.getElementsByName('description').item(0).content;
        let url = window.location.href;
        navigator.share({title: title, text: text, url: url}).catch(function(error){console.error('Error sharing: ' + error)});
    };
}

if('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/service-worker.js')
    .then(function() { console.log("Service Worker Registered"); })
    .catch(function() { console.log("Service Worker Not Registered"); });
}