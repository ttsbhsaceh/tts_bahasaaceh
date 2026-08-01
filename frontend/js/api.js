// Helper untuk memanggil endpoint backend PHP.
// Path relatif karena frontend & backend satu origin (lihat catatan Deployment).

(function (global) {
  function resolveApiBase(currentUrl = global.location?.href || "") {
    try {
      const locationUrl = new URL(currentUrl, global.location?.href || "http://localhost/");
      const pathname = locationUrl.pathname || "/";
      const frontendIndex = pathname.indexOf("/frontend/");

      if (frontendIndex !== -1) {
        return `${pathname.slice(0, frontendIndex)}/backend/api`;
      }

      return "/backend/api";
    } catch (e) {
      return "/backend/api";
    }
  }

  const API_BASE = resolveApiBase();

  function getApiUrl(path) {
    return `${API_BASE}${path}`;
  }

  async function apiCall(path, { method = "GET", body = null } = {}) {
    const options = {
      method,
      headers: { "Content-Type": "application/json" },
      credentials: "same-origin", // pastikan cookie session PHP ikut terkirim
    };
    if (body !== null) {
      options.body = JSON.stringify(body);
    }

    const res = await fetch(getApiUrl(path), options);
    let data;
    try {
      data = await res.json();
    } catch (e) {
      data = { success: false, message: "Respons server tidak valid." };
    }

    if (!res.ok && data.success === undefined) {
      data.success = false;
    }
    return data;
  }

  function tampilkanError(pesan) {
    Swal.fire({
      icon: "error",
      title: "Terjadi kesalahan",
      text: pesan,
      confirmButtonColor: "#2563eb",
    });
  }

  function tampilkanSukses(pesan) {
    Swal.fire({
      icon: "success",
      title: pesan,
      confirmButtonColor: "#2563eb",
      timer: 1400,
      showConfirmButton: false,
    });
  }

  global.API_BASE = API_BASE;
  global.getApiUrl = getApiUrl;
  global.apiCall = apiCall;
  global.tampilkanError = tampilkanError;
  global.tampilkanSukses = tampilkanSukses;
  global.resolveApiBase = resolveApiBase;

  if (typeof module !== "undefined" && module.exports) {
    module.exports = { resolveApiBase, getApiUrl, apiCall, tampilkanError, tampilkanSukses };
  }
})(typeof window !== "undefined" ? window : globalThis);
