# assignment9.R
# setup
library(lattice)
library(ggplot2)

# load data
data("mtcars", package = "datasets")
cat("head(mtcars):\n"); print(head(mtcars))
cat("\nstr(mtcars):\n"); str(mtcars)

# create output folder
# out_dir <- "assignment9_mtcars_plots"
# if (!dir.exists(out_dir)) dir.create(out_dir)

# Scatter mpg vs wt colored by cylinder
cols <- c("red","green3","blue")[as.factor(mtcars$cyl)]
plot(mtcars$wt, mtcars$mpg,
     col = cols, pch = 19,
     xlab = "Weight (1000 lbs)",
     ylab = "MPG",
     main = "Base: MPG vs Weight (colored by cyl)")
legend("topright", legend = sort(unique(mtcars$cyl)),
       col = c("red","green3","blue"), pch = 19, title = "cyl")

# histogram of mpg
hist(mtcars$mpg,
     breaks = 8,
     main = "Base: Distribution of MPG",
     xlab = "MPG")

# Lattice: horsepower vs weight conditioned by cyl
# use print() so it shows when sourcing the script
lp <- xyplot(hp ~ wt | factor(cyl),
             data = mtcars,
             layout = c(3,1),
             main = "Lattice: Horsepower vs Weight by cyl",
             xlab = "Weight (1000 lbs)",
             ylab = "Horsepower",
             pch = 20, col = "darkblue")
print(lp)

# Lattice: box-and-whisker plot of mpg by cyl
bw <- bwplot(mpg ~ factor(cyl),
             data = mtcars,
             main = "Lattice: MPG by cyl (box-and-whisker)",
             xlab = "cyl",
             ylab = "MPG",
             col = "lightblue")
print(bw)

# ggplot2: mpg vs hp with smoothing by gear
p <- ggplot(mtcars, aes(x = hp, y = mpg, color = factor(gear))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: MPG vs Horsepower with linear trend by gear",
       x = "Horsepower",
       y = "MPG",
       color = "gear") +
  theme_minimal()
print(p)

cat("\nA few rows of mtcars (for blog):\n"); print(head(mtcars, 6))
cat("\nSummary (first few cols):\n"); print(summary(mtcars)[1:4])
