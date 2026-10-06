############################################################
# Discriminant Analysis of Principal Components
# DAPC
############################################################

library(adegenet)

# Import genotype data
genind_data <- read.genetix(
  "genotypes.gen"
)

# Identify genetic clusters
clusters <- find.clusters(
  genind_data,
  max.n.clust = 10
)

# Perform DAPC
dapc_result <- dapc(
  genind_data,
  clusters$grp,
  n.pca = 20,
  n.da = 2
)

# Plot DAPC
scatter(
  dapc_result,
  scree.da = FALSE,
  scree.pca = FALSE
)

title(
  "Discriminant Analysis of Principal Components"
)
