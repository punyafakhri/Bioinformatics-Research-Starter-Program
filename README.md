# Bioinformatics Research Starter Program (BRSP) - Portfolio 🧬💻

Repository ini berisi dokumentasi perjalanan pembelajaran dan proyek analisis data saya selama mengikuti **Bioinformatics Research Starter Program (BRSP)** oleh OmicsLite (Batch Feb-Mar 2026). Program ini berfokus pada **Transcriptomics & Differential Gene Expression (DEG) Analysis**.

---

## 📌 Program Overview
- **Tema:** Transcriptomics & Differential Gene Expression Analysis
- **Durasi:** 5 Minggu (2 Feb - 8 Mar 2026)
- **Tech Stack:** R (Limma, ggplot2, pheatmap, enrichR), NCBI GEO, GEO2R, Cytoscape, Enrichr.
- **Fokus Pembelajaran:**
  - Memahami dasar Transkriptomik & Pipeline RNA-Seq.
  - Eksplorasi data publik (NCBI GEO).
  - Analisis DEG secara komputasional.
  - Interpretasi biologis (Gene Ontology & KEGG Pathways).

---

## 📝 Week 1: Dasar Bioinformatika & Studi Kasus

Pada minggu pertama, fokus pembelajaran adalah memahami konsep dasar bioinformatika dan melakukan bedah jurnal (*journal review*) terkait penerapan Transkriptomik pada penyakit.

### 🔍 Review Jurnal: Kanker Kolorektal (CRC)
> **Judul Paper:** *Exploring Core Genes by Comparative Transcriptomics Analysis for Early Diagnosis, Prognosis, and Therapies of Colorectal Cancer*

**Rangkuman Analisis:**
- **Metode:** Menggunakan 3 dataset microarray dari NCBI GEO, dianalisis dengan GEO2R (Limma), konstruksi jaringan PPI (STRING db), dan validasi survival (TCGA).
- **Hasil Utama:** Teridentifikasi **10 Gen Inti (Hub Genes)** yang mengalami *up-regulation* (seperti *AURKA, TOP2A, CDK1*), dan studi *Drug Repurposing* mengidentifikasi senyawa **Manzamine A** sebagai kandidat obat potensial.

---

## 💻 Week 2: Eksplorasi Data dengan GEO2R (Web-based)

Melakukan analisis praktik langsung menggunakan *web-based tool* **GEO2R** untuk mengidentifikasi ekspresi gen diferensial pada dataset Kanker Kolorektal nyata.

- **Dataset:** GSE106582 (ColoCare Project).
- **Sampel:** 77 Tumor vs 117 Mucosa (Normal).
- **Hasil:** Analisis mengidentifikasi disregulasi masif (17.962 gen), dengan penemuan **CLDN1** sebagai gen yang mengalami peningkatan ekstrem, dan kelompok **GUCA2A/B** yang mengalami penurunan drastis. Visualisasi UMAP mengonfirmasi pemisahan klaster yang tegas antara jaringan kanker dan normal.

---

## 🚀 Week 3: End-to-End Transcriptomics Analysis using R

[cite_start]Pada minggu ketiga, analisis ditingkatkan ( *scale-up* ) dengan membangun *pipeline* analisis data mandiri menggunakan bahasa pemrograman **R**, memproses dataset GSE106582 dari tahap akuisisi mentah hingga interpretasi biologis tingkat lanjut[cite: 794].

### ⚙️ Metodologi Analisis
- **Data Ingestion:** Akuisisi matriks ekspresi menggunakan `GEOquery`.
- **Pre-processing:** Normalisasi distribusi menggunakan transformasi Log2.
- **Statistical Modeling:** Pendekatan model linear dan *Empirical Bayes* (`eBayes`) menggunakan *package* `limma` untuk menemukan DEGs (Adj.P-Val < 0.01 & |LogFC| > 1).
- **Functional Enrichment:** Analisis jalur biologis (*Pathways*) menggunakan `enrichR`.

### 📊 Hasil Analisis (Key Findings)

#### 1. Profil Ekspresi Gen Diferensial (DEGs)
Visualisasi *Volcano Plot* mengonfirmasi pergeseran transkriptomik masif antara jaringan tumor dan mukosa normal. 
*Heatmap hierarchical clustering* dari Top 50 DEGs menunjukkan pemisahan yang sempurna. 
- **Up-regulated:** Gen struktural seperti *CLDN1* dan *FOXQ1* terekspresi sangat kuat (blok merah) pada sampel tumor.
- **Down-regulated:** Gen fungsional homeostasis usus, *GUCA2A* dan *GUCA2B*, mengalami represi ekstrem (blok biru).

(<img width="903" height="616" alt="Visualisasi Plot DEG Kanker Kolorektal (GSE106582)" src="https://github.com/user-attachments/assets/48400ef1-6239-4a2c-98a8-83d28a9ff801" />)
*(Gambar: Volcano plot memperlihatkan sebaran gen signifikan up-regulated dan down-regulated pada CRC)*

![Heatmap Top 50](<img width="773" height="616" alt="Top 50 Differentially Expressed Genes (GSE106582)" src="https://github.com/user-attachments/assets/bf46787f-e0a9-427a-a03f-fd6399d675e0" />)
*(Gambar: Heatmap hierarchical clustering memisahkan profil genetik jaringan tumor dan normal dengan sempurna)*

#### 2. Pathway & Functional Enrichment (GO & KEGG)
Analisis pengayaan fungsional memberikan wawasan mekanistik mengenai invasi tumor:
- **Gene Ontology (GO):** Gen-gen DEGs sangat diperkaya pada proses **Extracellular Matrix (ECM) Organization** dan *Extracellular Structure Organization*. [cite_start]Hal ini secara langsung merefleksikan aktivitas remodeling jaringan dan degradasi matriks yang merupakan ciri utama invasivitas sel kanker.
- **KEGG Pathways:** Pemetaan jalur metabolisme menyoroti disregulasi kuat pada jalur **Drug metabolism**, **Retinol metabolism**, dan **IL-17 signaling pathway**. Keterlibatan IL-17 mengindikasikan respons inflamasi kronis yang mendukung lingkungan mikro tumor (TME) pada kolon.

![GO and KEGG Plots](path/to/your/go_kegg_plots.png)
*(Gambar: Hasil pemetaan Gene Ontology dan KEGG Pathways)*

### 💡 Kesimpulan Week 3
Analisis komputasional berbantuan *script* R memvalidasi pergeseran molekuler pada Kanker Kolorektal dengan sangat presisi. Perubahan drastis pada gen pengatur struktur (*CLDN1*) yang berujung pada perombakan masif matriks ekstraseluler (ECM) menunjukkan potensi besar gen-gen ini sebagai target terapeutik dan biomarker diagnostik.

---
*Author: Muhammad Fakhri Aldiansyah*
