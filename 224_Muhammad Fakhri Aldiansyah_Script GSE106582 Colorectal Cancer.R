# =========================================================================
# SCRIPT FINAL ANALISIS DEG & ENRICHMENT KANKER KOLOREKTAL (GSE106582)
# =========================================================================

# 1. SETUP LIBRARIES 
# Install BiocManager jika belum ada
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Install packages 
pkg_bioc <- c("GEOquery", "limma", "illuminaHumanv4.db", "AnnotationDbi")
for (pkg in pkg_bioc) {
  if (!requireNamespace(pkg, quietly = TRUE)) BiocManager::install(pkg, ask = FALSE, update = FALSE)
}

pkg_cran <- c("pheatmap", "ggplot2", "dplyr", "umap", "enrichR")
for (pkg in pkg_cran) {
  if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
}

# Panggil library
library(GEOquery)
library(limma)
library(pheatmap)
library(ggplot2)
library(dplyr)
library(illuminaHumanv4.db)
library(AnnotationDbi)
library(umap)
library(enrichR)

# 2. PENGAMBILAN DATA (GSE106582) 
message("Mengunduh data GSE106582 dari NCBI GEO...")
gset <- getGEO("GSE106582", GSEMatrix = TRUE, AnnotGPL = TRUE)[[1]]
ex <- exprs(gset)

# 3. PRE-PROCESSING & TRANSFORMASI 
qx <- as.numeric(quantile(ex, c(0, 0.25, 0.5, 0.75, 0.99, 1), na.rm = TRUE))
LogTransform <- (qx[5] > 100 || (qx[6] - qx[1] > 50 && qx[2] > 0))

if (LogTransform) {
  ex[ex <= 0] <- NA
  ex <- log2(ex)
}

# 4. DEFINISI KELOMPOK SAMPEL (TUMOR vs MUCOSA) 
metadata_sumber <- pData(gset)[["source_name_ch1"]]
# Ekstrak kata tumor/mucosa dari metadata 
groups <- ifelse(grepl("tumor", metadata_sumber, ignore.case = TRUE), "tumor", "mucosa")

gset$group <- factor(groups, levels = c("tumor", "mucosa"))
nama_grup <- levels(gset$group)
message("Grup yang ditemukan: ", paste(nama_grup, collapse = ", "))

# 5. DESIGN MATRIX & ANALISIS LIMMA 
design <- model.matrix(~0 + gset$group)
colnames(design) <- nama_grup

# Kontras: Tumor vs Mucosa (Kanker dikurangi Normal)
contrast_formula <- paste(nama_grup[1], "-", nama_grup[2])
contrast_matrix <- makeContrasts(contrasts = contrast_formula, levels = design)

fit <- lmFit(ex, design)
fit2 <- contrasts.fit(fit, contrast_matrix)
fit2 <- eBayes(fit2)

topTableResults <- topTable(fit2, adjust = "fdr", sort.by = "B", number = Inf, p.value = 0.01)

# 6. ANOTASI GEN (MAPPING PROBE KE SYMBOL)
probe_ids <- rownames(topTableResults)
gene_annotation <- AnnotationDbi::select(
  illuminaHumanv4.db,
  keys = probe_ids,
  columns = c("SYMBOL", "GENENAME"),
  keytype = "PROBEID"
)

topTableResults$PROBEID <- rownames(topTableResults)
topTableResults <- merge(topTableResults, gene_annotation, by = "PROBEID", all.x = TRUE)

# 7. VISUALISASI VOLCANO PLOT 
volcano_data <- data.frame(
  logFC = topTableResults$logFC,
  adj.P.Val = topTableResults$adj.P.Val,
  Gene = topTableResults$SYMBOL
)

volcano_data$status <- "NO"
volcano_data$status[volcano_data$logFC > 1 & volcano_data$adj.P.Val < 0.01] <- "UP"
volcano_data$status[volcano_data$logFC < -1 & volcano_data$adj.P.Val < 0.01] <- "DOWN"

plot_volcano <- ggplot(volcano_data, aes(x = logFC, y = -log10(adj.P.Val), color = status)) +
  geom_point(alpha = 0.6) +
  scale_color_manual(values = c("DOWN" = "blue", "NO" = "grey", "UP" = "red")) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  geom_hline(yintercept = -log10(0.1), linetype = "dashed") +
  theme_minimal() +
  ggtitle("Volcano Plot DEG Kanker Kolorektal (GSE106582)")

print(plot_volcano)

# 8. VISUALISASI HEATMAP (TOP 50 DEGs) 
topTableResults <- topTableResults[order(topTableResults$adj.P.Val), ]
top50 <- head(topTableResults, 50)

mat_heatmap <- ex[top50$PROBEID, ]
gene_label <- ifelse(is.na(top50$SYMBOL) | top50$SYMBOL == "", top50$PROBEID, top50$SYMBOL)
rownames(mat_heatmap) <- gene_label

# Pembersihan baris bernilai NA atau varians nol 
mat_heatmap <- mat_heatmap[rowSums(is.na(mat_heatmap)) == 0, ]
gene_variance <- apply(mat_heatmap, 1, var)
mat_heatmap <- mat_heatmap[gene_variance > 0, ]

annotation_col <- data.frame(Group = gset$group)
rownames(annotation_col) <- colnames(mat_heatmap)

pheatmap(
  mat_heatmap,
  scale = "row",
  annotation_col = annotation_col,
  show_colnames = FALSE,
  show_rownames = TRUE,
  fontsize_row = 7,
  clustering_distance_rows = "euclidean",
  clustering_distance_cols = "euclidean",
  clustering_method = "complete",
  main = "Top 50 Differentially Expressed Genes (GSE106582)"
)

# 9. ENRICHMENT ANALYSIS (GO & KEGG) 
message("Menjalankan Enrichment Analysis...")
setEnrichrSite("Enrichr")
dbs <- c("GO_Biological_Process_2023", "KEGG_2021_Human")

# Ambil gen signifikan yang punya simbol (tidak kosong)
signif_genes <- subset(topTableResults, adj.P.Val < 0.01 & abs(logFC) > 1)$SYMBOL
signif_genes <- unique(na.omit(signif_genes[signif_genes != ""]))

enriched_results <- enrichr(signif_genes, dbs)

# Plot GO
plot_go <- plotEnrich(enriched_results[[1]], showTerms = 10, numChar = 40, y = "Count", orderBy = "P.value") +
  ggtitle("Top 10 Gene Ontology (GSE106582)") +
  theme_minimal()
print(plot_go)

# Plot KEGG
plot_kegg <- plotEnrich(enriched_results[[2]], showTerms = 10, numChar = 40, y = "Count", orderBy = "P.value") +
  ggtitle("Top 10 KEGG Pathways (GSE106582)") +
  theme_minimal()
print(plot_kegg)

# 10. SIMPAN HASIL KE CSV -------------------------------------------------
write.csv(topTableResults, "Hasil_GSE106582_Colorectal_DEG.csv", row.names = FALSE)
message("Analisis SELESAI. File CSV telah disimpan!")