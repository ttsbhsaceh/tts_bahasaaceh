document.addEventListener("DOMContentLoaded", async () => {

  const me = await apiCall("/auth/me.php");
  if (!me.logged_in) {
    navigateTo("../index.html");
    return;
  }

  document.getElementById("welcome-name").textContent  = me.user.username;
  document.getElementById("username-label").textContent = me.user.username;

  if (me.user.is_guest) {
    document.getElementById("guest-banner").classList.remove("d-none");
  }

  // Tombol "Mulai Bermain" — pakai navigateTo agar ada transisi
  document.getElementById("btn-mulai").addEventListener("click", (e) => {
    e.preventDefault();
    navigateTo("paket.html");
  });

  document.getElementById("btn-logout").addEventListener("click", async () => {
    await apiCall("/auth/logout.php", { method: "POST" });
    navigateTo("../index.html");
  });

  // Muat ringkasan progres
  const ringkasanRes = await apiCall("/progress/get.php");
  if (ringkasanRes.success) {
    const r = ringkasanRes.ringkasan;
    document.getElementById("stat-total").textContent   = r.total_paket;
    document.getElementById("stat-selesai").textContent = r.selesai;
    document.getElementById("stat-sedang").textContent  = r.sedang;
    document.getElementById("stat-belum").textContent   = r.belum;
  }

});
