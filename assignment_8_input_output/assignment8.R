# assignment8.R

# ---- Libraries ----
library(dplyr)
library(readr)
library(stringr)

# ---- Paths ----
downloads <- "/Users/administrator/Downloads"
csv_path  <- file.path(downloads, "HW6D1.csv")

# ---- Read data ----
df <- read_csv(csv_path, show_col_types = FALSE)

# ---- Grouped mean of Weight by Sex (dplyr) ----
gender_mean <- df %>%
  group_by(Sex) %>%
  summarise(WeightAverage = mean(Weight, na.rm = TRUE), .groups = "drop")

# Write tab-delimited text
write_tsv(gender_mean, file.path(downloads, "gender_mean.txt"))

# filter captures Heavy & Very Heavy smokers 
heavy_rows <- df %>%
  filter(str_detect(Smoking_Status, regex("heavy", ignore_case = TRUE)))

# Write IDs only
heavy_rows %>%
  distinct(ID) %>%
  write_csv(file.path(downloads, "heavy_ids.csv"))

# Write full filtered rows
write_csv(heavy_rows, file.path(downloads, "heavy_rows_full.csv"))
#check that files were written
cat(file.exists(file.path(downloads, "gender_mean.txt")), "\n")
cat(file.exists(file.path(downloads, "heavy_ids.csv")), "\n")
cat(file.exists(file.path(downloads, "heavy_rows_full.csv")), "\n")
