'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"manifest.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "c48176f11eb6b04ca7553ce1e39c0d20",
"/": "c48176f11eb6b04ca7553ce1e39c0d20",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/enif/assets/svg/image_paceholder.svg": "3c1c0a03c66e561cf42a97c13a7e3102",
"assets/packages/enif/assets/svg/back.svg": "3e813c4c9394400ddd4f09cc1092bc2e",
"assets/packages/enif/assets/svg/a.svg": "f5fa61187d40ff6c8bdd8b39e2d5abf2",
"assets/packages/enif/assets/svg/search.svg": "3caf4587edd7f4a6e10d7ce36f522164",
"assets/packages/enif/assets/svg/arrow_right.svg": "32937621856e537f26f296e0e42422ef",
"assets/packages/enif/assets/svg/logo_text.svg": "730e99234194dfb886c9ba0388f6ab56",
"assets/packages/enif/assets/svg/share.svg": "0204895d87715781b0584f444ba6f253",
"assets/packages/enif/assets/svg/edit.svg": "910092aa759e84afbb2c6eb7f326b97f",
"assets/packages/enif/assets/images/chat_user2.png": "feecab80c7f6a8f0105a5d450e26897c",
"assets/packages/enif/assets/images/logo.png": "e0105ad801c194ff867156611b8a7744",
"assets/packages/enif/assets/images/gif.png": "4f150e997d4d175d9eec041f2fdacec8",
"assets/packages/enif/assets/images/image.png": "e1370bd5b39806cdcb78542f672bef0b",
"assets/packages/enif/assets/images/chat_user1.png": "c499d4ae2c51a9907d56e39f7d28d3df",
"assets/packages/enif/assets/images/user.png": "e864fdae5ae59018e508822d56b9c85f",
"assets/packages/enif/assets/images/arrow_right.png": "2a0dd046d65a35f5f36c5a56f869d60d",
"assets/packages/enif/assets/images/hand.png": "0aa8bf06b41797611a332540fd7bbfc8",
"assets/packages/enif/assets/images/damy.png": "fa1ad4fd1b8753da5e0fd43195179282",
"assets/packages/enif/assets/images/arrow.png": "73a0ae9482ab8f3636be0c9d0fbc1a4f",
"assets/packages/enif/assets/images/chat_user3.png": "121f91b96db72e16f42d4f9536ce99d1",
"assets/packages/enif/assets/images/messanger.png": "16d268e5b734a0c3f4ab67a083db8705",
"assets/packages/enif/assets/images/edit.png": "f5901fa3edb86ca315850c303498fa82",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/NOTICES": "d3e6fb471d0f817f83ce761bf1e63be0",
"assets/AssetManifest.json": "ae0e29c5c8438fc3449fae124ab4e6eb",
"assets/AssetManifest.bin.json": "d5051d83bcc4c6112f0321d7cc273602",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "02f82692bd5b770d8265327311533659",
"assets/fonts/MaterialIcons-Regular.otf": "ced4c00a1537df4bd6e37730fb534876",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"main.dart.js": "1a45534736c42cc07397eb9b2181c524"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
