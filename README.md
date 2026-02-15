# Bioinformatics Research Starter Program (BRSP) - Portfolio 🧬💻

Repository ini berisi dokumentasi perjalanan pembelajaran dan proyek analisis data saya selama mengikuti **Bioinformatics Research Starter Program (BRSP)** oleh OmicsLite (Batch Feb-Mar 2026). Program ini berfokus pada **Transcriptomics & Differential Gene Expression (DEG) Analysis**.

---

## 📌 Program Overview
- **Tema:** Transcriptomics & Differential Gene Expression Analysis
- **Durasi:** 5 Minggu (2 Feb - 8 Mar 2026)
- **Tech Stack:** R (Limma), NCBI GEO, GEO2R, Cytoscape, Enrichr.
- **Fokus Pembelajaran:**
  - Memahami dasar Transkriptomik & Pipeline RNA-Seq.
  - Eksplorasi data publik (NCBI GEO).
  - Analisis DEG (Differentially Expressed Genes).
  - Interpretasi biologis dan penemuan biomarker.

---

## 📝 Week 1: Dasar Bioinformatika & Studi Kasus

Pada minggu pertama, fokus pembelajaran adalah memahami konsep dasar bioinformatika dan melakukan bedah jurnal (*journal review*) terkait penerapan Transkriptomik pada penyakit.

### 🔍 Review Jurnal: Kanker Kolorektal (CRC)
> **Judul Paper:** *Exploring Core Genes by Comparative Transcriptomics Analysis for Early Diagnosis, Prognosis, and Therapies of Colorectal Cancer*

**Rangkuman Analisis:**
- **Masalah:** Kanker Kolorektal sering didiagnosis terlambat. Diperlukan biomarker genetik untuk deteksi dini.
- **Metode:** Menggunakan 3 dataset microarray dari NCBI GEO, dianalisis dengan GEO2R (Limma), konstruksi jaringan PPI (STRING db), dan validasi survival (TCGA).
- **Hasil Utama:**
  - Teridentifikasi **10 Gen Inti (Hub Genes)** yang mengalami *up-regulation*: *AURKA, TOP2A, CDK1, PTTG1, CDKN3, CDC20, MAD2L1, CKS2, MELK,* dan *TPX2*.
  - Studi *Drug Repurposing* mengidentifikasi senyawa **Manzamine A** sebagai kandidat obat potensial.

---

## 💻 Week 2: Hands-on Differential Expression Analysis

Pada minggu kedua, saya melakukan analisis praktik langsung menggunakan *web-based tool* **GEO2R** untuk mengidentifikasi ekspresi gen diferensial pada dataset Kanker Kolorektal nyata.

### ⚙️ Metodologi Analisis
- **Dataset:** [GSE106582](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE106582) (ColoCare Project).
- **Sampel:** Total 194 sampel (*Homo sapiens*), terbagi menjadi:
  - **Kasus (Tumor):** 77 sampel.
  - **Kontrol (Mucosa):** 117 sampel.
- **Tools & Parameter:**
  - Algoritma: **limma** (Linear Models for Microarray Data).
  - Koreksi P-value: **Benjamini & Hochberg** (FDR).
  - Cut-off Signifikansi: **Adj. P-value < 0.05** & **|logFC| > 1**.
- **Validasi:** Analisis dilakukan dengan 3 kali replikasi teknis untuk memastikan konsistensi hasil.

### 📊 Hasil Analisis (Key Findings)
Berdasarkan analisis statistik, ditemukan **17.962 gen** yang terdisregulasi secara signifikan antara jaringan tumor dan mukosa normal.

#### 1. Quality Control & Clustering
- **Boxplot:** Menunjukkan distribusi data yang sejajar, mengindikasikan proses normalisasi data (quantile normalization) berjalan baik.
- **UMAP Plot:** Terdapat pemisahan klaster yang sangat tegas antara grup **Tumor** dan **Mucosa**, membuktikan adanya perbedaan profil transkriptomik yang nyata (biologis) dan bukan sekadar *noise*.

<img width="440" height="360" alt="umap" src="https://github.com/user-attachments/assets/c19e1fd3-9957-4a53-9b33-412c833e9f70" />

*(Gambar: Visualisasi UMAP menunjukkan pemisahan jelas antara sampel Tumor (hijau) dan Mucosa (ungu))*

#### 2. Identifikasi Biomarker (Top DEGs)
Analisis Volcano Plot dan tabel statistik mengungkapkan gen dengan perubahan ekspresi paling ekstrem:

| Gene Symbol | Status | LogFC | Adj. P-Value | Interpretasi Biologis |
| :--- | :--- | :--- | :--- | :--- |
| **CLDN1** | 🔼 Up-regulated | 2.898 | 1.01e-60 | Protein *tight junction*. Peningkatan ekspresinya pada CRC dikaitkan dengan hilangnya polaritas sel dan metastasis. |
| **GUCA2A** | 🔽 Down-regulated | -4.023 | 9.58e-53 | Berperan dalam homeostasis cairan usus. Hilangnya gen ini adalah penanda dediferensiasi sel usus menjadi ganas. |
| **GUCA2B** | 🔽 Down-regulated | -3.383 | 4.26e-54 | (Sama dengan GUCA2A), penurunan drastis menandakan hilangnya fungsi normal epitel usus. |

![Volcano Plot](path/to/your/volcano_plot.png)
*(Gambar: Volcano plot memperlihatkan sebaran gen signifikan up-regulated (merah) dan down-regulated (biru))*

### 💡 Kesimpulan Week 2
Analisis dataset GSE106582 berhasil mengonfirmasi profil molekuler Kanker Kolorektal yang agresif. Penemuan **CLDN1** (naik) dan **GUCA2A** (turun) sejalan dengan patogenesis molekuler CRC, menunjukkan bahwa metode GEO2R efektif untuk eksplorasi awal biomarker diagnostik.

---

## 🛠️ Tools & Resources
- **R / Bioconductor (Limma Package)**
- **NCBI Gene Expression Omnibus (GEO)**
- **GEO2R**

---
*Author: Muhammad Fakhri Aldiansyah*
