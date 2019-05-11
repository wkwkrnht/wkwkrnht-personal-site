hljs.initHighlightingOnLoad();

document.getElementById('nativeShare').onclick = function(){
    let title = document.title;
    let text = document.getElementsByName('description').item(0).content;
    let url = window.location.href;
    navigator.share({title: title, text: text, url: url}).catch(function(error){console.error('Error sharing: ' + error)});
};