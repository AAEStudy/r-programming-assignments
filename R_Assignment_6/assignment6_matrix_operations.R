# assignment6.R
# Matrix operations and construction

# 1) Define A and B
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Show A and B
A
B

# 2) Addition and subtraction
A_plus_B  <- A + B
A_minus_B <- A - B

A_plus_B
A_minus_B

# 3) Diagonal matrix D (4x4)
D <- diag(c(4, 1, 2, 3))
D

# 4) Custom 5x5 matrix
M <- matrix(0, 5, 5)
M[1, ] <- c(3, 1, 1, 1, 1)
M[2:5, 1] <- 2
diag(M)[2:5] <- 3
M
