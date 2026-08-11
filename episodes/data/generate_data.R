# ---------------------------------------------------------
# SET WORKING DIRECTORY TO SCRIPT LOCATION
# ---------------------------------------------------------
script_path <- tryCatch({
  normalizePath(sys.frame(1)$ofile)
}, error = function(e) {
  if ("rstudioapi" %in% installed.packages()) {
    normalizePath(rstudioapi::getActiveDocumentContext()$path)
  } else {
    stop("Cannot determine script location. Run with Rscript or RStudio.")
  }
})

setwd(dirname(script_path))
print(paste("Saving output to:", getwd()))

# ---------------------------------------------------------
# CLEAR EVERYTHING
# ---------------------------------------------------------
rm(list = ls())
gc()
options(stringsAsFactors = FALSE)

set.seed(123)

n <- 5000

species <- c("fir", "oak", "willow")
music <- c("classical", "heavy_metal", "pop", "Christmas", "white_noise", "no_sound")

# Baseline height distributions (cm)
baseline_means <- c(fir = 180, oak = 330, willow = 255)
baseline_sd    <- c(fir = 100, oak = 80,  willow = 50)

# Annual growth (cm)
growth_means <- c(fir = 20, oak = 12, willow = 8)
growth_sd    <- c(fir = 5,  oak = 4,  willow = 3)

df <- data.frame(
  tree_id = 1:n,
  species = sample(species, n, replace = TRUE),
  music_genre = sample(music, n, replace = TRUE),
  stringsAsFactors = FALSE
)

df$species     <- trimws(tolower(df$species))
df$music_genre <- trimws(tolower(df$music_genre))

# Baseline height
df$height_baseline <- rnorm(
  n,
  mean = baseline_means[df$species],
  sd   = baseline_sd[df$species]
)

# Growth (music has NO effect)
df$annual_growth <- rnorm(
  n,
  mean = growth_means[df$species],
  sd   = growth_sd[df$species]
)

# Negative growth (dieback)
negative_idx <- sample(1:n, size = round(n * 0.05))
df$annual_growth[negative_idx] <- df$annual_growth[negative_idx] * -runif(length(negative_idx), 0.2, 1.2)

# Missing values
missing_idx <- sample(1:n, size = round(n * 0.003))
df$annual_growth[sample(missing_idx, size = round(length(missing_idx)/2))] <- NA

# Final height
df$height_final <- df$height_baseline + df$annual_growth

# Remove annual_growth column
df$annual_growth <- NULL

# ---------------------------------------------------------
# WRITE SEPARATE FILES PER MUSIC GENRE (WITHOUT species COLUMN)
# ---------------------------------------------------------
dir.create("tree_data", showWarnings = FALSE)

for (m in unique(df$music_genre)) {

  sub <- df[df$music_genre == m, ]

  # Remove species column
  sub$music_genre <- NULL

  # Round heights to whole cm
  sub$height_baseline <- round(sub$height_baseline)
  sub$height_final    <- round(sub$height_final)

  # Write file
  filename <- paste0("tree_data/", m, "_data.csv")
  write.csv(sub, filename, row.names = FALSE)
}
