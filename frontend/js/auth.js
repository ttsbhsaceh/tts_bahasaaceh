document.addEventListener("DOMContentLoaded", () => {

  // ── Custom tab switcher (menggantikan Bootstrap Pills) ──────
  const tabBtns  = document.querySelectorAll(".auth-tab-btn");
  const tabPanes = document.querySelectorAll(".tab-pane");

  function switchTab(targetId) {
    tabBtns.forEach((b) => b.classList.remove("active"));
    tabPanes.forEach((p) => p.classList.remove("active"));
    document.querySelector(`[data-target="${targetId}"]`).classList.add("active");
    document.getElementById(targetId).classList.add("active");
  }

  tabBtns.forEach((btn) => {
    btn.addEventListener("click", () => switchTab(btn.dataset.target));
  });

  // ── Login ────────────────────────────────────────────────────
  document.getElementById("form-login").addEventListener("submit", async (e) => {
    e.preventDefault();
    const email    = document.getElementById("login-email").value.trim();
    const password = document.getElementById("login-password").value;

    const res = await apiCall("/auth/login.php", { method: "POST", body: { email, password } });
    if (res.success) {
      navigateTo("pages/dashboard.html");
    } else {
      tampilkanError(res.message || "Login gagal.");
    }
  });

  // ── Register ─────────────────────────────────────────────────
  document.getElementById("form-register").addEventListener("submit", async (e) => {
    e.preventDefault();
    const username = document.getElementById("register-username").value.trim();
    const email    = document.getElementById("register-email").value.trim();
    const password = document.getElementById("register-password").value;

    const res = await apiCall("/auth/register.php", { method: "POST", body: { username, email, password } });
    if (res.success) {
      await Swal.fire({
        icon: "success",
        title: "Akun berhasil dibuat",
        text: "Silakan masuk dengan akun barumu.",
        confirmButtonColor: "#1B6B4A",
      });
      document.getElementById("form-register").reset();
      switchTab("tab-login");
    } else {
      tampilkanError(res.message || "Registrasi gagal.");
    }
  });

  // ── Tamu ─────────────────────────────────────────────────────
  document.getElementById("btn-guest").addEventListener("click", async () => {
    const res = await apiCall("/auth/guest.php", { method: "POST" });
    if (res.success) {
      navigateTo("pages/dashboard.html");
    } else {
      tampilkanError(res.message || "Gagal masuk sebagai tamu.");
    }
  });

});
