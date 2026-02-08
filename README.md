# Bioinformatics Research Starter Program (BRSP) - Portfolio 🧬💻

Repository ini berisi dokumentasi pembelajaran, tugas, dan portofolio analisis data selama mengikuti **Bioinformatics Research Starter Program (BRSP)** oleh OmicsLite (Batch Feb-Mar 2026). Program ini berfokus pada **Transcriptomics & Differential Gene Expression (DEG) Analysis**.

---

## 📌 Program Overview
- **Tema:** Transcriptomics & Differential Gene Expression Analysis
- **Durasi:** 5 Minggu (2 Feb - 8 Mar 2026)
- **Fokus Pembelajaran:**
  - Memahami dasar Transkriptomik & Analisis DEG.
  - Menggunakan data publik dari NCBI GEO.
  - Melakukan analisis DEG menggunakan R & *tools* berbasis web.
  - Mereplikasi analisis dari artikel ilmiah.

---

## 📝 Week 1: Dasar Bioinformatika & Studi Kasus Transkriptomik

Pada minggu pertama, materi mencakup pemahaman dasar bioinformatika sebagai ilmu interdisipliner dan bedah jurnal (*journal review*) terkait penerapan Transkriptomik pada kasus Kanker Kolorektal.

### 🔍 Review Jurnal: Kanker Kolorektal (CRC)
**Judul Paper:** *Exploring Core Genes by Comparative Transcriptomics Analysis for Early Diagnosis, Prognosis, and Therapies of Colorectal Cancer* 

#### 1. Latar Belakang Masalah
- Kanker Kolorektal (CRC) merupakan keganasan ketiga paling umum dan penyebab kematian akibat kanker kedua terbanyak secara global.
- Sebagian besar kasus didiagnosis pada tahap lanjut, yang mengurangi opsi terapi dan tingkat kelangsungan hidup.
- Profiling transkriptomik diperlukan untuk menemukan *biomarker* genetik (gen yang diekspresikan secara diferensial) yang akurat guna deteksi dini.

#### 2. Metodologi (Pipeline Bioinformatika)
Penelitian ini menggunakan pendekatan *in silico* dengan tahapan berikut:
1. **Akuisisi Data:** Menggunakan 3 dataset *microarray* (GSE106582, GSE110223, GSE74602) dari *database* NCBI GEO.
2. **Identifikasi DEGs:** Menganalisis *Differentially Expressed Genes* menggunakan alat GEO2R dengan paket R LIMMA.
3. **Analisis Jaringan (PPI):** Membangun jaringan interaksi protein dari gen yang berbeda menggunakan *database* STRING dan divisualisasikan dengan Cytoscape.
4. **Seleksi Gen Inti (Core Genes):** Menerapkan algoritma MCC (*Maximal Clique Centrality*) untuk menemukan protein esensial bagi sel kanker.
5. **Validasi Klinis:** Memvalidasi utilitas prognostik gen inti pada kohort independen menggunakan data TCGA (dataset COAD dan READ).
6. **Penemuan Obat (Drug Repurposing):** Melakukan *molecular docking* (AutoDock Vina) dan Simulasi Dinamika Molekuler selama 100 ns (YASARA) untuk menilai stabilitas interaksi obat-target.

#### 3. Hasil Utama
- **252 cDEGs:** Analisis mengungkapkan 252 gen (cDEGs) umum yang merupakan irisan dari ketiga dataset, menyaring ribuan gen menjadi sinyal biologis yang konsisten.
- **10 Gen Inti (Hub Genes):** Melalui analisis topologi MCC, teridentifikasi 10 gen kunci yang mengalami *upregulation* pada jaringan CRC: *AURKA, TOP2A, CDK1, PTTG1, CDKN3, CDC20, MAD2L1, CKS2, MELK,* dan *TPX2*.
- **Kandidat Obat:** Studi mengidentifikasi Manzamine A (alkaloid laut) yang menunjukkan pengikatan afinitas tinggi terhadap TPX2 dan stabilitas kompleks yang baik dalam simulasi MD, menjadikannya kandidat kuat untuk inhibitor CRC.

#### 4. Kesimpulan
Studi ini berhasil merumuskan panel *biomarker* yang terdiri dari 10 Gen Inti sebagai pendorong siklus sel yang tidak teratur untuk diagnosis Kanker Kolorektal. Penelitian ini juga mengusulkan tujuh kandidat obat, dengan Manzamine A sebagai inhibitor potensial.

---

## 🛠️ Tools & Tech Stack
- **Bahasa Pemrograman:** R (Limma Package)
- **Database:** NCBI GEO, STRING db, TCGA, DisGeNET, DSigDB
- **Software/Platform:** GEO2R, Cytoscape, Enrichr, AutoDock Vina, Discovery Studio Visualizer, YASARA

---
*Author: Muhammad Fakhri Aldiansyah*
