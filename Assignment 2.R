# When we run:
#   assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)
#   
#   myMean <- function(assignment2) {
#     
#     return(sum(assignment) / length(someData))
#     
#   }
#   
#   myMean(assignment2)
#   
#   It returns the error:
#     
#     myMean(assignment2)
#   
#   Error in myMean(assignment2) : object 'assignment' not found
#   
#   This occurs because the function refers to 'assignment' and 'someData,' which are names that don't exist instead of the parameter 'assignment2'. The corrected function would look like:
# 
# myMean <- function(assignment2) {
# 
#   return(sum(assignment2) / length(assignment2))
# 
# }
# 
# myMean(assignment2)
# 
# The corrected function outputs the mean of the list, which is 19.25. 
# 

assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}

myMean(assignment2)
