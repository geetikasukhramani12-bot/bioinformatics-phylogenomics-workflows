############################################################
# PCA Visualization
############################################################

library(ggplot2)

# Read PCA coordinates
pca <- read.table(
  "Smilax_PCA.eigenvec",
  header = FALSE
)

# Rename columns
colnames(pca)[1:4] <- c(
  "FID",
  "IID",
  "PC1",
  "PC2"
)

# Plot PCA
ggplot(
  pca,
  aes(x = PC1, y = PC2)
) +
  geom_point(size = 3) +
  theme_classic() +
  labs(
    title = "PCA of SNP Genotype Data",
    x = "Principal Component 1",
    y = "Principal Component 2"
  )
