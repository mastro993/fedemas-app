'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets\AssetManifest.json": "801125fca546f506babac9af4ec061ba",
"/assets\docs\cv.pdf": "eae10530663df6d3c83a35d3ed6a2399",
"/assets\docs\thesis.pdf": "3a0e04bf4a91f8f5f737bf1fc0df7d62",
"/assets\FontManifest.json": "8969064ed05f4a6c823b4865a90993e7",
"/assets\fonts\MaterialIcons-Regular.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"/assets\fonts\SF-Pro-Display-Black.otf": "11e421ee3f03e231763aeb70962badd8",
"/assets\fonts\SF-Pro-Display-BlackItalic.otf": "647ad7b734271f858d61a94283fd0502",
"/assets\fonts\SF-Pro-Display-Bold.otf": "644563f48ab5fe8e9082b64b2729b068",
"/assets\fonts\SF-Pro-Display-BoldItalic.otf": "9d7f6005cb34acd97c4a5f0a454bc7a5",
"/assets\fonts\SF-Pro-Display-Heavy.otf": "a545fc03ce079844a5ff898a25fe589b",
"/assets\fonts\SF-Pro-Display-HeavyItalic.otf": "d70a8b7adbe065dd69b16459ffab4231",
"/assets\fonts\SF-Pro-Display-Light.otf": "ac5237052941a94686167d278e1c1c9d",
"/assets\fonts\SF-Pro-Display-LightItalic.otf": "bee8986f3bf3e269e81e7b64996e423c",
"/assets\fonts\SF-Pro-Display-Medium.otf": "51fd7406327f2b1dbc8e708e6a9da9a5",
"/assets\fonts\SF-Pro-Display-MediumItalic.otf": "33d39d7c5573584d97fbb77ead48a296",
"/assets\fonts\SF-Pro-Display-Regular.otf": "aaeac71d99a345145a126a8c9dd2615f",
"/assets\fonts\SF-Pro-Display-RegularItalic.otf": "87d7573445a739a1a8210207d1b346a3",
"/assets\fonts\SF-Pro-Display-Semibold.otf": "e6ef4ea3cf5b1b533a85a5591534e3e4",
"/assets\fonts\SF-Pro-Display-SemiboldItalic.otf": "fce0a93d0980a16d75a2f71173c80838",
"/assets\fonts\SF-Pro-Display-Thin.otf": "f35e961114e962e90cf926bf979a8abc",
"/assets\fonts\SF-Pro-Display-ThinItalic.otf": "9d5ed420ac3a432eb716c670ce00b662",
"/assets\fonts\SF-Pro-Display-Ultralight.otf": "bc55c63e7841855767b283b78bbd8d3a",
"/assets\fonts\SF-Pro-Display-UltralightItalic.otf": "fa570fc4ded697c72608eae4e3675959",
"/assets\icons\github.png": "59073708471c3b377e1912501d777a10",
"/assets\icons\hackerrank.png": "a5d453398240505e7ee8ddfb4b42e1c7",
"/assets\icons\linkedin.png": "d7065253b70f1c6808748653b96181f2",
"/assets\icons\stackoverflow.png": "bd4c2830b2d7b474415e6c4c24ddcc4d",
"/assets\images\bg.png": "0bfaa3a1d48d57181fb05c5129e954e9",
"/assets\images\projects\home2work_cover.jpg": "32cebc6af85c3c6e9c180d57ac45c159",
"/assets\images\project_placeholder.png": "7a3c764f4541dcb6f33a501af9b37f50",
"/assets\LICENSE": "eb159c926964e794131ad0cdd6076c96",
"/assets\packages\cupertino_icons\assets\CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets\packages\font_awesome_flutter\lib\fonts\fa-brands-400.ttf": "3ca122272cfac33efb09d0717efde2fa",
"/assets\packages\font_awesome_flutter\lib\fonts\fa-regular-400.ttf": "bdd8d75eb9e6832ccd3117e06c51f0d3",
"/assets\packages\font_awesome_flutter\lib\fonts\fa-solid-900.ttf": "d21f791b837673851dd14f7c132ef32e",
"/icons\Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons\Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/index.html": "a6a103438ad0233d845dd56973977a3d",
"/main.dart.js": "224fd2f1464f0615cf4113bef2c5c922",
"/manifest.json": "951754a203b58537dacdeee05d59b75e"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
