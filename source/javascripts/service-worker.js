const data_list = [
    'index.html',
    'about.html',
    'privacy-policy.html',
    'manifest.json',
    '/',
    '/stylesheets/all.css',
    '/javascripts/google-analytics.js',
    '/javascripts/fontawesome.min.js',
    '/javascripts/highlight.pack.js',
    '/javascripts/main.js'
];

self.addEventListener('install', function(e) {
    e.waitUntil(
        caches.open('cache_v1').then(function(cache) {
            return cache.addAll(data_list);
        })
    );
});

self.addEventListener('fetch', function(event) {
    console.log(event.request.url);
    event.respondWith(
        caches.match(event.request).then(function(response) {
            return response || fetch(event.request);
        })
    );
});