/**
 * transitions.js
 * Gunakan navigateTo(url) sebagai pengganti window.location.href = url
 * agar efek fade-out berjalan sebelum perpindahan halaman.
 */
(function () {
  'use strict';

  function resolveDestination(url) {
    if (!url) return url;
    if (url.startsWith('/') || /^[a-z]+:\/\//i.test(url)) {
      return url;
    }

    try {
      return new URL(url, window.location.href).toString();
    } catch (e) {
      return url;
    }
  }

  window.navigateTo = function (url) {
    if (document.body.classList.contains('page-out')) return;
    const target = resolveDestination(url);
    document.body.classList.add('page-out');
    setTimeout(function () { window.location.assign(target); }, 220);
  };
})();
