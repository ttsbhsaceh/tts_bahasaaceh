const STATUS_LABEL = {
  belum:   "Belum",
  sedang:  "Sedang",
  selesai: "Selesai",
};

const STATUS_BADGE_CLASS = {
  belum:   "badge-belum",
  sedang:  "badge-sedang",
  selesai: "badge-selesai",
};

const STATUS_ITEM_CLASS = {
  belum:   "",
  sedang:  "status-sedang",
  selesai: "status-selesai",
};

document.addEventListener("DOMContentLoaded", async () => {

  const me = await apiCall("/auth/me.php");
  if (!me.logged_in) {
    navigateTo("../index.html");
    return;
  }

  document.getElementById("btn-logout").addEventListener("click", async () => {
    await apiCall("/auth/logout.php", { method: "POST" });
    navigateTo("../index.html");
  });

  const res       = await apiCall("/paket/list.php");
  const container = document.getElementById("paket-grid");

  if (!res.success) {
    container.innerHTML = `<p style="color:var(--salah)">Gagal memuat daftar paket.</p>`;
    return;
  }

  container.innerHTML = res.paket.map((p) => `
    <div class="paket-item ${STATUS_ITEM_CLASS[p.status]}" data-id="${p.id}">
      <div class="paket-nomor">${String(p.nomor_paket).padStart(2, "0")}</div>
      <span class="paket-badge ${STATUS_BADGE_CLASS[p.status]}">${STATUS_LABEL[p.status]}</span>
    </div>
  `).join("");

  // Animasi stagger untuk tiap kartu paket
  container.querySelectorAll(".paket-item").forEach((el, i) => {
    el.style.animationDelay = `${i * 0.03}s`;
    el.classList.add("fade-up");

    el.addEventListener("click", () => {
      navigateTo(`permainan.html?id=${el.dataset.id}`);
    });
  });

});
