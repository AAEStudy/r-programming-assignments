# assignment7_OOP.R
# Load data
data(mtcars)
head(mtcars)
str(mtcars)

# Generic functions on built-in dataset
print("Demonstrating generic functions on mtcars")
summary(mtcars)

# S3 example
# constructor for an S3 object
student_s3 <- function(name, age, GPA) {
  obj <- list(name = as.character(name),
              age = as.numeric(age),
              GPA = as.numeric(GPA))
  class(obj) <- "student_s3"
  obj
}

# define an S3 print method
print.student_s3 <- function(x, ...) {
  cat("student_s3 object\n")
  cat("Name:", x$name, "\n")
  cat("Age:", x$age, "\n")
  cat("GPA:", x$GPA, "\n")
}

# define an S3 summary method
summary.student_s3 <- function(object, ...) {
  cat("Summary for student_s3\n")
  cat("Name length:", nchar(object$name), "\n")
  cat("Age:", object$age, "\n")
  cat("GPA:", object$GPA, "\n")
  invisible(object)
}

# create and test S3 object
s3_obj <- student_s3("Alex", 29, 3.5)
class(s3_obj)
print(s3_obj)
summary(s3_obj)
# show how to find S3 methods for a generic
methods("print")

# --- S4 example ---
# define S4 class
setClass("student_s4",
         slots = c(name = "character",
                   age  = "numeric",
                   GPA  = "numeric"))

# define a show method for S4 (print analog)
setMethod("show", "student_s4",
          function(object) {
            cat("student_s4 object\n")
            cat("Name:", object@name, "\n")
            cat("Age:", object@age, "\n")
            cat("GPA:", object@GPA, "\n")
          })

# define a summary method for S4
setMethod("summary", "student_s4",
          function(object, ...) {
            cat("Summary for student_s4\n")
            cat("Name length:", nchar(object@name), "\n")
            cat("Age:", object@age, "\n")
            cat("GPA:", object@GPA, "\n")
            invisible(object)
          })

# create and test S4 object
s4_obj <- new("student_s4", name = "Alex", age = 29, GPA = 3.5)
class(s4_obj)
s4_obj            # calls show
summary(s4_obj)

# --- Inspect object system and type ---
# S3 vs S4 check
isS4(s3_obj)
isS4(s4_obj)
# class and mode/type
class(s3_obj)
mode(s3_obj)
typeof(s3_obj)
class(s4_obj)
mode(s4_obj)
typeof(s4_obj)

# Inspect methods for a class (S3/S4)
methods(class = "student_s3")
showMethods(classes = "student_s4")


