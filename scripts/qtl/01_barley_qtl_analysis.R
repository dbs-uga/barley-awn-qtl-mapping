
# ============================================================
# Barley QTL Mapping — Awn Length
# Multi-parent population | 355 SNP markers | 916 lines
# Data: statgenMPP R package (Liller et al. 2017)
# Author: Divya Bhanu Sharma
# ============================================================

# --- Load libraries ---
library(statgenMPP)
library(ggplot2)

# --- Load data ---
data(barleyPheno)
data(barleyMQM)

# --- QTL results table ---
qtl_data <- data.frame(
  marker = c("2_1053","2_1187","1_1522","2_0340","1_1501",
             "1_1070","1_0611","2_0645","1_0094","1_0120",
             "2_0687","1_1012"),
  chr = c(1,2,2,2,3,4,4,5,5,6,6,7),
  pos = c(47.06,27.21,46.06,68.99,42.17,51.72,102.75,
          56.84,94.26,1.67,88.03,121.04),
  minlog10p = c(10.05,4.86,4.73,6.14,13.42,5.83,4.05,
                6.86,14.48,4.41,5.70,65.39),
  varExpl = c(0.0212,0.0121,0.0459,0.0208,0.0526,0.0554,
              0.0299,0.0268,0.0939,0.0372,0.0344,0.2648)
)

# --- Allele effects at major QTL Chr 7 ---
effects_chr7 <- data.frame(
  parent = c("Morex", "HID4", "HID64", "HID369", "HID382"),
  effect = c(11.3779, 5.77, -9.658, 7.651, -15.136),
  se = c(0.865, 1.76, 1.84, 1.96, 1.37)
)

# --- Figure 1: QTL bubble plot ---
dir.create("figures", showWarnings = FALSE)

png("figures/01_qtl_bubble_plot.png", width=3000, height=1500, res=300)
ggplot(qtl_data, aes(x=pos, y=minlog10p,
                     color=factor(chr), size=varExpl)) +
  geom_point(alpha=0.8) +
  geom_hline(yintercept=4, linetype="dashed", color="red") +
  facet_wrap(~chr, nrow=1, labeller=label_both) +
  scale_size_continuous(range=c(3,12), name="Variance
Explained") +
  labs(title="QTL Mapping for Awn Length in Barley",
       subtitle="Multi-parent population | 355 SNP markers | 916 lines",
       x="Genetic Position (cM)", y="-log10(p-value)",
       color="Chromosome") +
  theme_bw() +
  theme(plot.title=element_text(face="bold", size=14),
        strip.background=element_rect(fill="grey20"),
        strip.text=element_text(color="white", face="bold"))
dev.off()

# --- Figure 2: Allele effects Chr 7 ---
png("figures/02_allele_effects_chr7.png", width=2000, height=1500, res=300)
ggplot(effects_chr7, aes(x=reorder(parent, effect),
                          y=effect, fill=effect > 0)) +
  geom_bar(stat="identity", width=0.6) +
  geom_errorbar(aes(ymin=effect-se, ymax=effect+se),
                width=0.2, linewidth=0.8) +
  geom_hline(yintercept=0, color="black") +
  scale_fill_manual(values=c("#d73027","#4575b4"),
                    labels=c("Shorter awns","Longer awns"),
                    name="Effect direction") +
  labs(title="Allele Effects at Major QTL — Chromosome 7",
       subtitle="Position: 121.04 cM | Variance explained: 26.48%",
       x="Parent", y="Allele Effect on Awn Length (mm)") +
  theme_bw() +
  theme(plot.title=element_text(face="bold", size=14))
dev.off()

# --- Figure 3: Variance explained ---
png("figures/03_variance_explained.png", width=2500, height=1500, res=300)
ggplot(qtl_data, aes(x=reorder(marker,-varExpl),
                      y=varExpl*100, fill=factor(chr))) +
  geom_bar(stat="identity", width=0.7) +
  geom_text(aes(label=paste0(round(varExpl*100,1),"%")),
            vjust=-0.5, size=3.5, fontface="bold") +
  scale_fill_brewer(palette="Set1", name="Chromosome") +
  labs(title="Phenotypic Variance Explained by Each QTL",
       subtitle="Awn length in barley | 12 QTLs across 7 chromosomes",
       x="QTL Marker", y="Variance Explained (%)") +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1, size=10),
        plot.title=element_text(face="bold", size=14))
dev.off()

# --- Figure 4: Phenotype distribution ---
png("figures/04_phenotype_distribution.png", width=2000, height=1500, res=300)
ggplot(barleyPheno, aes(x=Awn_length)) +
  geom_histogram(aes(y=after_stat(density)), bins=30,
                 fill="#4575b4", color="white", alpha=0.8) +
  geom_density(color="#d73027", linewidth=1.2) +
  geom_vline(xintercept=mean(barleyPheno$Awn_length),
             linetype="dashed", color="black", linewidth=1) +
  annotate("text", x=mean(barleyPheno$Awn_length)+5, y=0.03,
           label=paste0("Mean = ",
           round(mean(barleyPheno$Awn_length),1)," mm"),
           hjust=0, size=4) +
  labs(title="Phenotypic Distribution of Awn Length in Barley",
       subtitle="916 lines from multi-parent population",
       x="Awn Length (mm)", y="Density") +
  theme_bw() +
  theme(plot.title=element_text(face="bold", size=14))
dev.off()

# --- Figure 5: Chromosome map ---
png("figures/05_qtl_chromosome_map.png", width=2000, height=2000, res=300)
ggplot(qtl_data, aes(x=factor(chr), y=pos)) +
  geom_segment(aes(x=factor(chr), xend=factor(chr),
                   y=0, yend=max(pos)+20),
               color="grey70", linewidth=2) +
  geom_point(aes(size=varExpl*100, fill=minlog10p),
             shape=21, color="black", stroke=0.8) +
  scale_fill_gradient(low="#fee090", high="#d73027",
                      name="-log10(p)") +
  scale_size_continuous(range=c(4,14),
                        name="Variance
Explained (%)") +
  scale_y_reverse() +
  labs(title="QTL Positions Across Barley Chromosomes",
       subtitle="Awn length | 12 QTLs | Size = variance explained",
       x="Chromosome", y="Genetic Position (cM)") +
  theme_bw() +
  theme(plot.title=element_text(face="bold", size=14),
        panel.grid.major.x=element_blank())
dev.off()

cat("Analysis complete. All figures saved.
")

