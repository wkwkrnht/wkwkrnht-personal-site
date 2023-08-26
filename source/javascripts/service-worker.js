const data_list = [
    '/',
    '/index.html',
    '/about.html',
    '/404.html',
    '/privacy-policy.html',
    '/manifest.json',
    '/images/logo.png',
    '/stylesheets/all.css',
    '/javascripts/fontawesome.min.js',
    '/javascripts/highlight.pack.js',
    '/javascripts/main.js',
    '/blog/',
    '/blog/index.html'
];

self.addEventListener('install', function(e) {
    e.waitUntil(
        caches.open('cache_v1').then(function(cache) {
            return cache.addAll(data_list.map(url => new Request(url, {credentials: 'same-origin'})));
        })
    );
});

self.addEventListener('activate', (event) => {
    event.waitUntil(self.registration?.navigationPreload.enable());
});

self.addEventListener('fetch', function(event) {
    console.log(event.request.url);
    event.respondWith(
        caches.match(event.request).then(function(response) {
            return response || fetch(event.request);
        })
    );
});

addEventListener('message', (event) => {
    importScripts('/javascripts/highlight.pack.js');
    const result = self.hljs.highlightAuto(event.data);
    postMessage(result.value);
});