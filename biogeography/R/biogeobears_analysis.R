############################################################
# BioGeoBEARS Historical Biogeography Analysis
# Taxon: Smilax L.
#
# Purpose:
#   Reconstruct ancestral geographic ranges and compare
#   alternative biogeographic models using BioGeoBEARS.
#
# Models:
#   DEC
#   DEC + J
#   DIVALIKE
#   DIVALIKE + J
#   BAYAREALIKE
#   BAYAREALIKE + J
#
# Author: Geetika Sukhramani
############################################################


############################
# 1. Load required packages
############################

library(BioGeoBEARS)
library(ape)


############################
# 2. Set working directory
############################

# Change this to the directory containing your input files.
# Example:
# setwd("~/BioGeoBEARS/Smilax")

# setwd("PATH/TO/YOUR/PROJECT")


############################
# 3. Define input files
############################

# Time-calibrated phylogenetic tree
trfn <- "Smilax_dated_tree.newick"

# Geographic range data
geogfn <- "Smilax_geographic_ranges.data"


############################
# 4. Read phylogenetic tree
############################

tr <- read.tree(trfn)

cat("\nPhylogenetic tree information:\n")
print(tr)

cat("\nNumber of tips:", length(tr$tip.label), "\n")


############################
# 5. Plot phylogenetic tree
############################

pdf("01_phylogenetic_tree.pdf",
    width = 10,
    height = 12)

plot(tr,
     cex = 0.5,
     no.margin = TRUE)

title("Time-calibrated phylogenetic tree")

dev.off()


############################
# 6. Read geographic data
############################

# BioGeoBEARS uses a text file describing
# geographic ranges of the taxa.

tipranges <- getranges_from_LagrangePHYLIP(
    geogfn
)

cat("\nGeographic range data:\n")
print(tipranges)


############################
# 7. Check tree and geographic data
############################

cat("\nTaxa in phylogenetic tree:\n")
print(tr$tip.label)

cat("\nTaxa in geographic dataset:\n")
print(rownames(tipranges@df))


############################
# 8. Create BioGeoBEARS input
############################

BioGeoBEARS_run <- define_BioGeoBEARS_run()

BioGeoBEARS_run$trfn <- trfn
BioGeoBEARS_run$geogfn <- geogfn

BioGeoBEARS_run$max_range_size <- 4


############################
# 9. Set output directory
############################

BioGeoBEARS_run$base_dir <- getwd()

BioGeoBEARS_run$on_NaN_error <- -1e50

BioGeoBEARS_run$force_sparse <- FALSE

BioGeoBEARS_run$print_optim_results_precision <- 8

BioGeoBEARS_run$calc_ancprobs <- TRUE


############################
# 10. Set dispersal/extinction
############################

BioGeoBEARS_run$dstart <- 0.01
BioGeoBEARS_run$est_D = TRUE

BioGeoBEARS_run$e_start <- 0.01
BioGeoBEARS_run$est_E = TRUE


############################################################
# 11. DEC MODEL
############################################################

cat("\n====================================\n")
cat("Running DEC model\n")
cat("====================================\n")

BioGeoBEARS_run$include_null_range <- TRUE

BioGeoBEARS_run$force_sparse <- FALSE

BioGeoBEARS_run <- readfiles_BioGeoBEARS_run(
    BioGeoBEARS_run
)

BioGeoBEARS_run <- run_BioGeoBEARS_run(
    BioGeoBEARS_run
)


############################
# Save DEC results
############################

saveRDS(
    BioGeoBEARS_run,
    file = "DEC_model_results.rds"
)


############################################################
# 12. DEC + J MODEL
############################################################

cat("\n====================================\n")
cat("Running DEC + J model\n")
cat("====================================\n")


# Start with the DEC model settings

BioGeoBEARS_run_DECj <- BioGeoBEARS_run

BioGeoBEARS_run_DECj$BioGeoBEARS_model_object@params_table["j",
                                                               "type"] <- "free"

BioGeoBEARS_run_DECj$BioGeoBEARS_model_object@params_table["j",
                                                               "init"] <- 0.01

BioGeoBEARS_run_DECj$BioGeoBEARS_model_object@params_table["j",
                                                               "est"] <- TRUE

BioGeoBEARS_run_DECj <- run_BioGeoBEARS_run(
    BioGeoBEARS_run_DECj
)


############################
# Save DEC + J results
############################

saveRDS(
    BioGeoBEARS_run_DECj,
    file = "DECJ_model_results.rds"
)


############################################################
# 13. DIVALIKE MODEL
############################################################

cat("\n====================================\n")
cat("Running DIVALIKE model\n")
cat("====================================\n")

BioGeoBEARS_run_DIVALIKE <- BioGeoBEARS_run

BioGeoBEARS_run_DIVALIKE$BioGeoBEARS_model_object@type <- "DIVALIKE"

BioGeoBEARS_run_DIVALIKE <- run_BioGeoBEARS_run(
    BioGeoBEARS_run_DIVALIKE
)

saveRDS(
    BioGeoBEARS_run_DIVALIKE,
    file = "DIVALIKE_model_results.rds"
)


############################################################
# 14. DIVALIKE + J MODEL
############################################################

cat("\n====================================\n")
cat("Running DIVALIKE + J model\n")
cat("====================================\n")

BioGeoBEARS_run_DIVALIKEj <- BioGeoBEARS_run_DIVALIKE

BioGeoBEARS_run_DIVALIKEj$BioGeoBEARS_model_object@params_table["j",
                                                                    "type"] <- "free"

BioGeoBEARS_run_DIVALIKEj$BioGeoBEARS_model_object@params_table["j",
                                                                    "init"] <- 0.01

BioGeoBEARS_run_DIVALIKEj$BioGeoBEARS_model_object@params_table["j",
                                                                    "est"] <- TRUE

BioGeoBEARS_run_DIVALIKEj <- run_BioGeoBEARS_run(
    BioGeoBEARS_run_DIVALIKEj
)

saveRDS(
    BioGeoBEARS_run_DIVALIKEj,
    file = "DIVALIKEJ_model_results.rds"
)


############################################################
# 15. BAYAREALIKE MODEL
############################################################

cat("\n====================================\n")
cat("Running BAYAREALIKE model\n")
cat("====================================\n")

BioGeoBEARS_run_BAYAREALIKE <- BioGeoBEARS_run

BioGeoBEARS_run_BAYAREALIKE$BioGeoBEARS_model_object@type <- "BAYAREALIKE"

BioGeoBEARS_run_BAYAREALIKE <- run_BioGeoBEARS_run(
    BioGeoBEARS_run_BAYAREALIKE
)

saveRDS(
    BioGeoBEARS_run_BAYAREALIKE,
    file = "BAYAREALIKE_model_results.rds"
)


############################################################
# 16. BAYAREALIKE + J MODEL
############################################################

cat("\n====================================\n")
cat("Running BAYAREALIKE + J model\n")
cat("====================================\n")

BioGeoBEARS_run_BAYAREALIKEj <- BioGeoBEARS_run_BAYAREALIKE

BioGeoBEARS_run_BAYAREALIKEj$BioGeoBEARS_model_object@params_table["j",
                                                                       "type"] <- "free"

BioGeoBEARS_run_BAYAREALIKEj$BioGeoBEARS_model_object@params_table["j",
                                                                       "init"] <- 0.01

BioGeoBEARS_run_BAYAREALIKEj$BioGeoBEARS_model_object@params_table["j",
                                                                       "est"] <- TRUE

BioGeoBEARS_run_BAYAREALIKEj <- run_BioGeoBEARS_run(
    BioGeoBEARS_run_BAYAREALIKEj
)

saveRDS(
    BioGeoBEARS_run_BAYAREALIKEj,
    file = "BAYAREALIKEJ_model_results.rds"
)


############################################################
# 17. Model comparison
############################################################

cat("\n====================================\n")
cat("MODEL COMPARISON\n")
cat("====================================\n")


results <- data.frame(
    Model = c(
        "DEC",
        "DEC+J",
        "DIVALIKE",
        "DIVALIKE+J",
        "BAYAREALIKE",
        "BAYAREALIKE+J"
    ),

    LogLikelihood = c(
        BioGeoBEARS_run$likelihood,
        BioGeoBEARS_run_DECj$likelihood,
        BioGeoBEARS_run_DIVALIKE$likelihood,
        BioGeoBEARS_run_DIVALIKEj$likelihood,
        BioGeoBEARS_run_BAYAREALIKE$likelihood,
        BioGeoBEARS_run_BAYAREALIKEj$likelihood
    )
)


############################
# Calculate AIC
############################

results$NumParams <- c(
    length(BioGeoBEARS_run$free_params),
    length(BioGeoBEARS_run_DECj$free_params),
    length(BioGeoBEARS_run_DIVALIKE$free_params),
    length(BioGeoBEARS_run_DIVALIKEj$free_params),
    length(BioGeoBEARS_run_BAYAREALIKE$free_params),
    length(BioGeoBEARS_run_BAYAREALIKEj$free_params)
)


results$AIC <- (
    -2 * results$LogLikelihood +
    2 * results$NumParams
)


############################
# AICc calculation
############################

n <- length(tr$tip.label)

results$AICc <- (
    results$AIC +
    (2 * results$NumParams *
       (results$NumParams + 1)) /
    (n - results$NumParams - 1)
)


############################
# Calculate Delta AICc
############################

results$DeltaAICc <- (
    results$AICc -
    min(results$AICc)
)


############################
# Print model comparison
############################

print(results)


############################
# Save model comparison
############################

write.csv(
    results,
    "BioGeoBEARS_model_comparison.csv",
    row.names = FALSE
)


############################################################
# 18. Identify best-supported model
############################################################

best_model <- results$Model[
    which.min(results$AICc)
]

cat("\nBest-supported model:",
    best_model,
    "\n")


############################################################
# 19. Ancestral range reconstruction
############################################################

# The best-supported model can be used to
# visualize ancestral geographic distributions.

# Example for DEC model:

pdf(
    "02_DEC_ancestral_ranges.pdf",
    width = 12,
    height = 14
)

plot_BioGeoBEARS_results(
    results_object = BioGeoBEARS_run,
    analysis_titletxt = "DEC model",
    addl_params = list(
        "j" = FALSE
    ),
    plotwhat = "text",
    label.offset = 0.5,
    tipcex = 0.5,
    statecex = 0.5,
    splitcex = 0.5,
    titlecex = 0.8,
    plotsplits = TRUE,
    cornercoords_loc = "bottomleft"
)

dev.off()


############################################################
# 20. Export final results
############################################################

write.csv(
    results,
    "final_BioGeoBEARS_results.csv",
    row.names = FALSE
)


############################################################
# 21. End of analysis
############################################################

cat("\n====================================\n")
cat("BioGeoBEARS analysis completed.\n")
cat("Best-supported model:", best_model, "\n")
cat("====================================\n")
