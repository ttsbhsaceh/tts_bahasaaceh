let PAKET    = null;
let CELL_MAP = {};  // "r-c" -> { soalRefs: [{soal, index}], inputEl }
let SAVE_TIMER = null;

function getParam(name) {
  return new URLSearchParams(window.location.search).get(name);
}

function keyRC(r, c) {
  return `${r}-${c}`;
}

async function init() {
  const me = await apiCall("/auth/me.php");
  if (!me.logged_in) {
    navigateTo("../index.html");
    return;
  }
  if (me.user.is_guest) {
    document.getElementById("guest-banner").classList.remove("d-none");
  }

  document.getElementById("btn-logout").addEventListener("click", async () => {
    await simpanProgresSementara();
    await apiCall("/auth/logout.php", { method: "POST" });
    navigateTo("../index.html");
  });

  document.querySelector('a[href="paket.html"]').addEventListener("click", async (e) => {
    e.preventDefault();
    await simpanProgresSementara();
    navigateTo("paket.html");
  });

  const paketId = getParam("id");
  if (!paketId) {
    navigateTo("paket.html");
    return;
  }

  const res = await apiCall(`/paket/detail.php?id=${encodeURIComponent(paketId)}`);
  if (!res.success) {
    tampilkanError(res.message || "Gagal memuat paket.");
    return;
  }

  PAKET = res.paket;
  document.getElementById("nomor-paket").textContent = PAKET.nomor_paket;

  renderGrid();
  renderClueList();
  lucide.createIcons();

  document.getElementById("btn-cek").addEventListener("click", periksaJawaban);
}

function renderGrid() {
  const gridEl = document.getElementById("tts-grid");
  const rows   = PAKET.grid_baris;
  const cols   = PAKET.grid_kolom;

  const cellSize = getComputedStyle(document.documentElement)
    .getPropertyValue("--tts-cell-size").trim() || "38px";
  gridEl.style.gridTemplateColumns = `repeat(${cols}, ${cellSize})`;
  gridEl.style.gridTemplateRows    = `repeat(${rows}, ${cellSize})`;
  gridEl.innerHTML = "";
  CELL_MAP = {};

  for (const soal of PAKET.soal) {
    for (let i = 0; i < soal.panjang; i++) {
      const r = soal.baris_mulai  + (soal.arah === "menurun"  ? i : 0);
      const c = soal.kolom_mulai  + (soal.arah === "mendatar" ? i : 0);
      const k = keyRC(r, c);
      if (!CELL_MAP[k]) CELL_MAP[k] = { soalRefs: [], inputEl: null };
      CELL_MAP[k].soalRefs.push({ soal, index: i });
    }
  }

  for (let r = 1; r <= rows; r++) {
    for (let c = 1; c <= cols; c++) {
      const k        = keyRC(r, c);
      const cellData = CELL_MAP[k];
      const cellDiv  = document.createElement("div");

      if (!cellData) {
        cellDiv.className = "tts-cell empty";
      } else {
        cellDiv.className = "tts-cell";
        const isStart = cellData.soalRefs.find((ref) => ref.index === 0);
        if (isStart) {
          const label      = document.createElement("span");
          label.className  = "nomor-label";
          label.textContent = isStart.soal.nomor;
          cellDiv.appendChild(label);
        }
        const input      = document.createElement("input");
        input.maxLength  = 1;
        input.dataset.r  = r;
        input.dataset.c  = c;
        input.addEventListener("input", (e) => {
          e.target.value = e.target.value.toUpperCase().replace(/[^A-Z]/g, "");
          cellDiv.classList.remove("correct", "wrong");
          jadwalkanSimpanOtomatis();
          if (e.target.value) fokusSelBerikutnya(r, c);
        });
        input.addEventListener("keydown", (e) => {
          if (e.key === "Backspace" && !e.target.value) fokusSelSebelumnya(r, c);
        });
        cellDiv.appendChild(input);
        cellData.inputEl = input;
      }

      gridEl.appendChild(cellDiv);
    }
  }

  // Prefill jawaban tersimpan
  for (const soal of PAKET.soal) {
    if (!soal.jawaban_tersimpan) continue;
    for (let i = 0; i < soal.jawaban_tersimpan.length && i < soal.panjang; i++) {
      const r        = soal.baris_mulai + (soal.arah === "menurun"  ? i : 0);
      const c        = soal.kolom_mulai + (soal.arah === "mendatar" ? i : 0);
      const cellData = CELL_MAP[keyRC(r, c)];
      if (cellData && cellData.inputEl) {
        cellData.inputEl.value = soal.jawaban_tersimpan[i].toUpperCase();
      }
    }
  }
}

function fokusSelBerikutnya(r, c) {
  const kanan = CELL_MAP[keyRC(r, c + 1)];
  if (kanan && kanan.inputEl) { kanan.inputEl.focus(); return; }
  const bawah = CELL_MAP[keyRC(r + 1, c)];
  if (bawah && bawah.inputEl)   bawah.inputEl.focus();
}

function fokusSelSebelumnya(r, c) {
  const kiri = CELL_MAP[keyRC(r, c - 1)];
  if (kiri && kiri.inputEl) { kiri.inputEl.focus(); return; }
  const atas = CELL_MAP[keyRC(r - 1, c)];
  if (atas  && atas.inputEl)  atas.inputEl.focus();
}

function renderClueList() {
  const mendatarEl = document.getElementById("clue-mendatar");
  const menurunEl  = document.getElementById("clue-menurun");
  mendatarEl.innerHTML = "";
  menurunEl.innerHTML  = "";

  for (const soal of PAKET.soal) {
    const target = soal.arah === "mendatar" ? mendatarEl : menurunEl;
    const item   = document.createElement("div");
    item.className      = "clue-item";
    item.dataset.soalId = soal.id;
    item.innerHTML = `
      <strong>${soal.nomor}.</strong>
      <span class="clue-text" data-lang="aceh">${soal.clue_aceh}</span>
      <span class="clue-lang-toggle">Lihat B. Indonesia</span>
    `;
    const textEl   = item.querySelector(".clue-text");
    const toggleEl = item.querySelector(".clue-lang-toggle");
    toggleEl.addEventListener("click", (e) => {
      e.stopPropagation();
      const showingAceh = textEl.dataset.lang === "aceh";
      textEl.textContent   = showingAceh ? soal.clue_indonesia : soal.clue_aceh;
      textEl.dataset.lang  = showingAceh ? "indonesia" : "aceh";
      toggleEl.textContent = showingAceh ? "Lihat B. Aceh" : "Lihat B. Indonesia";
    });
    item.addEventListener("click", () => {
      const r        = soal.baris_mulai;
      const c        = soal.kolom_mulai;
      const cellData = CELL_MAP[keyRC(r, c)];
      if (cellData && cellData.inputEl) cellData.inputEl.focus();
    });
    target.appendChild(item);
  }
}

function kumpulkanJawaban() {
  const jawaban = {};
  for (const soal of PAKET.soal) {
    let kata = "";
    for (let i = 0; i < soal.panjang; i++) {
      const r        = soal.baris_mulai + (soal.arah === "menurun"  ? i : 0);
      const c        = soal.kolom_mulai + (soal.arah === "mendatar" ? i : 0);
      const cellData = CELL_MAP[keyRC(r, c)];
      kata += cellData && cellData.inputEl ? cellData.inputEl.value : "";
    }
    jawaban[soal.id] = kata;
  }
  return jawaban;
}

async function periksaJawaban() {
  const jawaban = kumpulkanJawaban();
  const res     = await apiCall("/soal/check_answer.php", {
    method: "POST",
    body:   { paket_id: PAKET.id, jawaban },
  });

  if (!res.success) {
    tampilkanError(res.message || "Gagal memeriksa jawaban.");
    return;
  }

  document.querySelectorAll(".tts-cell").forEach((el) => el.classList.remove("correct", "wrong"));

  const statusSel = {};
  for (const soal of PAKET.soal) {
    const hasil = res.hasil[soal.id];
    if (hasil === "kosong") continue;
    for (let i = 0; i < soal.panjang; i++) {
      const r = soal.baris_mulai + (soal.arah === "menurun"  ? i : 0);
      const c = soal.kolom_mulai + (soal.arah === "mendatar" ? i : 0);
      const k = keyRC(r, c);
      if (statusSel[k] === "salah") continue;
      statusSel[k] = hasil;
    }
  }

  for (const k in statusSel) {
    const cellData = CELL_MAP[k];
    if (!cellData || !cellData.inputEl) continue;
    cellData.inputEl.parentElement.classList.add(
      statusSel[k] === "benar" ? "correct" : "wrong"
    );
  }

  const info = document.getElementById("skor-info");
  info.textContent = `Benar ${res.total_benar} dari ${res.total_soal} soal.`;

  if (res.status_paket === "selesai") {
    Swal.fire({
      icon: "success",
      title: "Selesai! 🎉",
      text:  "Semua jawaban di paket ini benar.",
      confirmButtonColor: "#1B6B4A",
    });
  }
}

function jadwalkanSimpanOtomatis() {
  clearTimeout(SAVE_TIMER);
  SAVE_TIMER = setTimeout(simpanProgresSementara, 900);
}

async function simpanProgresSementara() {
  if (!PAKET) return;
  const jawaban = kumpulkanJawaban();
  await apiCall("/progress/save.php", {
    method: "POST",
    body:   { paket_id: PAKET.id, jawaban },
  });
}

window.addEventListener("pagehide", () => {
  if (!PAKET) return;
  const jawaban = kumpulkanJawaban();
  navigator.sendBeacon(
    getApiUrl("/progress/save.php"),
    new Blob(
      [JSON.stringify({ paket_id: PAKET.id, jawaban })],
      { type: "application/json" }
    )
  );
});

document.addEventListener("DOMContentLoaded", init);
