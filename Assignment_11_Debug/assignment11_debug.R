# assignment11_debug.R


# helper: implement Tukey rule as logical vector
tukey.outlier <- function(v) {
  v <- as.numeric(v)
  q <- quantile(v, probs = c(0.25, 0.75), na.rm = TRUE)
  iqr <- diff(q)
  lower <- q[1] - 1.5 * iqr
  upper <- q[2] + 1.5 * iqr
  (v < lower) | (v > upper)
}

# original buggy function
tukey_multiple_buggy <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    # BUG: using && (not vectorized) here
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

# corrected function (element wise &)
tukey_multiple_corrected <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    # correct: element wise logical AND
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

# Reproduce with test data
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)  # 10 rows 5 cols
cat("test_mat (first 6 rows):\n"); print(head(test_mat))
cat("\nRun original buggy function:\n")
res_buggy <- tryCatch(tukey_multiple_buggy(test_mat), error = function(e) e)
print(res_buggy)

cat("\nRun corrected function:\n")
res_fixed <- tryCatch(tukey_multiple_corrected(test_mat), error = function(e) e)
print(res_fixed)

# show differences if any
cat("\nDo buggy and fixed results match? ")
print(identical(res_buggy, res_fixed))

cat("\nSummary counts. Number of rows flagged TRUE:\n")
cat("buggy:", sum(res_buggy == TRUE), "\n")
cat("fixed:", sum(res_fixed == TRUE), "\n")
