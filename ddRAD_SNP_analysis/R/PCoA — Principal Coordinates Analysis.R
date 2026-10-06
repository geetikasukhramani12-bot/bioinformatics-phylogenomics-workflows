############################################################
# Principal Coordinates Analysis
############################################################

library(ape)

# Read distance matrix
dist_matrix <- read.table(
  "genetic_distance.txt",
  header = TRUE,
  row.names = 1,
  check.names = FALSE
)

# Convert to distance object
genetic_dist <- as.dist(dist_matrix)

# Perform PCoA
pcoa <- pcoa(genetic_dist)

# Extract coordinates
coordinates <- as.data.frame(
  pcoa$vectors[, 1:2]
)

colnames(coordinates) <- c(
  "PCoA1",
  "PCoA2"
)

# Plot
plot(
  coordinates$PCoA1,
  coordinates$PCoA2,
  pch = 19,
  xlab = "PCoA1",
  ylab = "PCoA2",
  main = "Principal Coordinates Analysis"
)
