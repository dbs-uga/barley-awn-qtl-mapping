# 🌾 Barley Awn Length — QTL Mapping

### Genetic dissection of awn length in a barley multi-parent population

---

## 🔬 Overview
This project performs QTL mapping for awn length in barley (*Hordeum vulgare*)
using a multi-parent population. The analysis identifies genomic regions 
controlling awn development, quantifies allele effects across parent lines,
and provides a fully reproducible R pipeline with publication-quality figures.

This work demonstrates transferable computational skills in quantitative 
genetics directly applicable to plant ecological genetics research.

---

## 📊 Dataset
- **Population:** Multi-parent barley population (Liller et al. 2017)
- **Lines:** 916 barley accessions
- **Markers:** 355 SNP markers across 7 chromosomes
- **Trait:** Awn length (mm)
- **Data source:** `statgenMPP` R package

---

## 🔁 Pipeline
1. **Phenotypic analysis** — distribution, summary statistics
2. **QTL mapping** — multi-parent QTL mapping with threshold LOD = 4
3. **Allele effect estimation** — per parent allele effects at significant QTLs
4. **Visualization** — publication-quality figures in ggplot2

---

## 📈 Key Results
- 12 QTLs detected across all 7 barley chromosomes
- Major QTL on chromosome 7 (position 121.04 cM) explaining **26.48%** of phenotypic variance
- Allele effects range from -15.1 mm (HID382) to +11.4 mm (Morex)
- Mean awn length: 149.8 mm (range: 89–207 mm)

---

## 🖼️ Figures
| Figure | Description |
|---|---|
| 01_qtl_bubble_plot | QTL significance across all chromosomes |
| 02_allele_effects_chr7 | Allele effects at major QTL — Chr 7 |
| 03_variance_explained | Phenotypic variance explained per QTL |
| 04_phenotype_distribution | Phenotype distribution across 916 lines |
| 05_qtl_chromosome_map | QTL positions mapped across chromosomes |

---

## 🛠️ Tools & Packages
**R:** `statgenMPP`, `ggplot2`, `dplyr`

---

## 📁 Repository Structure
- data/ — raw and processed data files
- scripts/ — R analysis scripts
- results/figures/ — publication-quality PNG figures
- results/tables/ — QTL results tables
- report/ — RMarkdown integrated report
- docs/ — methods and notes

---

## 📄 Status
✅ Phase 1: QTL mapping complete — 5 publication figures produced
🔄 Phase 2: Candidate gene identification
🔄 Phase 3: CRISPR in silico validation

---

## 📚 Reference
Liller CB et al. (2017) Fine mapping of a major QTL for awn length in barley 
using a multiparent mapping population. *Theoretical and Applied Genetics.*

---

## 👤 Author
Divya Bhanu Sharma | Plant Geneticist & Bioinformatics Researcher
Independent research | 2026
