# Bioinformatics-Research-Starter-Program
Repository ini berisi catatan perjalanan dan tugas saya selama mengikuti Bioinformatics Research Starter Program (BRSP) oleh OmicsLite (Batch Feb-Mar 2026). Program ini berfokus pada Transcriptomics &amp; Differential Gene Expression (DEG) Analysis.

📝 Week 1: Dasar Bioinformatika & Studi Kasus Kanker Kolorektal
Pada minggu pertama, saya mempelajari dasar-dasar bioinformatika sebagai ilmu interdisipliner (Biologi, Ilmu Komputer, Statistika) serta melakukan bedah jurnal (journal review) sebagai studi kasus penerapan Transkriptomik.

🔍 Rangkuman Studi Kasus

Judul Paper: Exploring Core Genes by Comparative Transcriptomics Analysis for Early Diagnosis, Prognosis, and Therapies of Colorectal Cancer 
+1

1. Latar Belakang Masalah

Kanker Kolorektal (CRC) adalah penyebab kematian akibat kanker kedua terbanyak di dunia.

Diagnosis sering terlambat (stadium lanjut), sehingga opsi terapi terbatas.

Dibutuhkan biomarker genetik yang akurat untuk deteksi dini.

2. Metodologi (Pipeline Bioinformatika) 

Penelitian ini menggunakan pendekatan in silico dengan tahapan:


Akuisisi Data: Mengambil 3 dataset microarray (GSE106582, GSE110223, GSE74602) dari NCBI GEO.


Identifikasi DEGs: Menggunakan GEO2R (R package LIMMA) untuk mencari gen yang terekspresi berbeda secara signifikan.


Analisis Jaringan (PPI): Membangun jaringan interaksi protein menggunakan STRING db & Cytoscape.


Seleksi Gen Inti (Core Genes): Menggunakan algoritma MCC (Maximal Clique Centrality) untuk menemukan gen hub.


Validasi Klinis: Mengecek relevansi klinis menggunakan data TCGA (COAD & READ).


Penemuan Obat (Drug Repurposing): Molecular docking (AutoDock Vina) & Simulasi Dinamika Molekuler (YASARA).
+1

3. Hasil Utama

252 Common DEGs: Ditemukan 252 gen yang konsisten muncul di ketiga dataset.


10 Gen Inti (Hub Genes): Teridentifikasi 10 gen kunci yang mengalami upregulation (naik ekspresinya) pada kanker CRC, yaitu: AURKA, TOP2A, CDK1, PTTG1, CDKN3, CDC20, MAD2L1, CKS2, MELK, TPX2 .


Kandidat Obat: Senyawa Manzamine A (alkaloid laut) diprediksi potensial menjadi inhibitor gen target (TPX2) berdasarkan simulasi molekuler .

4. Kesimpulan
Studi ini berhasil mengidentifikasi panel 10 gen inti sebagai biomarker potensial untuk diagnosis dini Kanker Kolorektal dan mengusulkan kandidat obat baru melalui pendekatan bioinformatika komprehensif .

🛠️ Tools & Tech Stack
Bahasa Pemrograman: R (Limma Package)

Database: NCBI GEO, STRING db, TCGA, DisGeNET

Software/Tools: GEO2R, Cytoscape, Enrichr, AutoDock Vina, YASARA


Author: Muhammad Fakhri Aldiansyah
