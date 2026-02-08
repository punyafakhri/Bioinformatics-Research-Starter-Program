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
- [cite_start]Kanker Kolorektal (CRC) merupakan keganasan ketiga paling umum dan penyebab kematian akibat kanker kedua terbanyak secara global[cite: 230].
- [cite_start]Sebagian besar kasus didiagnosis pada tahap lanjut, yang mengurangi opsi terapi dan tingkat kelangsungan hidup[cite: 233].
- [cite_start]Profiling transkriptomik diperlukan untuk menemukan *biomarker* genetik (gen yang diekspresikan secara diferensial) yang akurat guna deteksi dini[cite: 237, 238].

#### 2. Metodologi (Pipeline Bioinformatika)
Penelitian ini menggunakan pendekatan *in silico* dengan tahapan berikut:
1. [cite_start]**Akuisisi Data:** Menggunakan 3 dataset *microarray* (GSE106582, GSE110223, GSE74602) dari *database* NCBI GEO[cite: 250].
2. [cite_start]**Identifikasi DEGs:** Menganalisis *Differentially Expressed Genes* menggunakan alat GEO2R dengan paket R LIMMA[cite: 251].
3. [cite_start]**Analisis Jaringan (PPI):** Membangun jaringan interaksi protein dari gen yang berbeda menggunakan *database* STRING dan divisualisasikan dengan Cytoscape[cite: 253].
4. [cite_start]**Seleksi Gen Inti (Core Genes):** Menerapkan algoritma MCC (*Maximal Clique Centrality*) untuk menemukan protein esensial bagi sel kanker[cite: 254].
5. [cite_start]**Validasi Klinis:** Memvalidasi utilitas prognostik gen inti pada kohort independen menggunakan data TCGA (dataset COAD dan READ)[cite: 256].
6. [cite_start]**Penemuan Obat (Drug Repurposing):** Melakukan *molecular docking* (AutoDock Vina) dan Simulasi Dinamika Molekuler selama 100 ns (YASARA) untuk menilai stabilitas interaksi obat-target[cite: 262, 264, 265].

#### 3. Hasil Utama
- [cite_start]**252 cDEGs:** Analisis mengungkapkan 252 gen (cDEGs) umum yang merupakan irisan dari ketiga dataset, menyaring ribuan gen menjadi sinyal biologis yang konsisten[cite: 270].
- [cite_start]**10 Gen Inti (Hub Genes):** Melalui analisis topologi MCC, teridentifikasi 10 gen kunci yang mengalami *upregulation* pada jaringan CRC: *AURKA, TOP2A, CDK1, PTTG1, CDKN3, CDC20, MAD2L1, CKS2, MELK,* dan *TPX2*[cite: 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283].
- [cite_start]**Kandidat Obat:** Studi mengidentifikasi Manzamine A (alkaloid laut) yang menunjukkan pengikatan afinitas tinggi terhadap TPX2 dan stabilitas kompleks yang baik dalam simulasi MD, menjadikannya kandidat kuat untuk inhibitor CRC[cite: 288, 289, 290, 291].

#### 4. Kesimpulan
[cite_start]Studi ini berhasil merumuskan panel *biomarker* yang terdiri dari 10 Gen Inti sebagai pendorong siklus sel yang tidak teratur untuk diagnosis Kanker Kolorektal[cite: 293, 294, 295]. [cite_start]Penelitian ini juga mengusulkan tujuh kandidat obat, dengan Manzamine A sebagai inhibitor potensial[cite: 296].

---

## 🛠️ Tools & Tech Stack
- **Bahasa Pemrograman:** R (Limma Package)
- **Database:** NCBI GEO, STRING db, TCGA, DisGeNET, DSigDB
- **Software/Platform:** GEO2R, Cytoscape, Enrichr, AutoDock Vina, Discovery Studio Visualizer, YASARA

---
*Author: Muhammad Fakhri Aldiansyah*
