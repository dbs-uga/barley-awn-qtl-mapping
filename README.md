# 🌿 Barley Leaf GWAS Meta-Analysis

### Fitness effects of molecular variants affecting leaf area and 
### economics spectrum in *Hordeum vulgare*

---

## 🔬 Overview
This project is a computational reproduction and meta-analysis of 
published GWAS studies on leaf morphology and leaf economics spectrum 
(LES) traits in barley (*Hordeum vulgare*), integrating RNA-Seq 
re-analysis and CRISPR in silico validation to identify and 
functionally characterize candidate genes.

This work is independently conducted to demonstrate active 
bioinformatics skills aligned with current research in plant 
ecological genetics.

---

## 🎯 Traits Studied
| Trait | Description |
|---|---|
| Leaf Area | Total leaf surface area per plant |
| Specific Leaf Area (SLA) | Leaf area per unit dry mass |
| Leaf Width | Blade width at widest point |
| Leaf Length | Blade length from base to tip |
| Leaf Nitrogen Content | Proxy for photosynthetic capacity |

---

## 🔁 Pipeline
1. **GWAS Meta-Analysis** — consistent SNPs across published studies (`metafor`)
2. **RNA-Seq Re-analysis** — candidate gene expression in leaf tissue (`DESeq2`)
3. **CRISPR In Silico Validation** — guide RNA design and off-target analysis

---

## 🛠️ Tools & Packages
**R:** `metafor`, `DESeq2`, `clusterProfiler`, `ggplot2`,
`biomaRt`, `dplyr`, `data.table`, `pheatmap`, `qqman`

**External:** CRISPOR, Cas-OFFinder, GrainGenes, NCBI GEO

---

## 📊 Data Sources
- GrainGenes (graingenes.org)
- NCBI GEO (ncbi.nlm.nih.gov/geo)
- IPK Gatersleben Barley Diversity Panel
- Published GWAS supplementary tables (cited in report)
- *Hordeum vulgare* reference genome (Morex v3)

---

## 📁 Repository Structure

- data/raw — Downloaded GWAS summary stats and count matrices
- data/processed — Cleaned and harmonized data
- scripts/gwas — Meta-analysis R scripts
- scripts/rnaseq — DESeq2 pipeline scripts
- scripts/crispr — Guide RNA and off-target scripts
- results/figures — Manhattan, forest, volcano plots
- results/tables — Top SNPs, DEGs, candidate genes
- report/ — Integrated RMarkdown report

---

## 📄 Status
🔄 Phase 1: Data collection — GWAS summary statistics

---

## 👤 Author
Divya Bhanu Sharma | Plant Geneticist & Bioinformatics Researcher  
Independent research | 2025
