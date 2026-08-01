/**
 * transitions.js
 * Gunakan navigateTo(url) sebagai pengganti window.location.href = url
 * agar efek fade-out berjalan sebelum perpindahan halaman.
 */
(function () {
  'use strict';

  window.navigateTo = function (url) {
    if (document.body.classList.contains('page-out')) return;
    document.body.classList.add('page-out');
    setTimeout(function () { window.location.href = url; }, 220);
  };
})();
