#R assignment 3
#https://rstudioclass.blogspot.com/2025/09/r-assignment-3.html

Name     <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(  4,      62,      51,    21,      2,        14,       15)
CBS_poll <- c( 12,      75,      43,    19,      1,        21,       19)

# Combine into data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll, stringsAsFactors = FALSE)

# Inspect
str(df_polls)
head(df_polls)

# Summary statistics for each poll
mean_ABC  <- mean(df_polls$ABC_poll)
median_ABC<- median(df_polls$ABC_poll)
range_ABC <- range(df_polls$ABC_poll)

mean_CBS  <- mean(df_polls$CBS_poll)
median_CBS<- median(df_polls$CBS_poll)
range_CBS <- range(df_polls$CBS_poll)

# Add difference column (corrected variable name)
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

cat("Diff vector (CBS - ABC):", paste(df_polls$Diff, collapse = ", "), "\n")
cat("Diff mean:", mean(df_polls$Diff), "  Diff median:", median(df_polls$Diff), "\n")

# Create a long/tidy version for plotting
library(tidyr)
library(ggplot2)

df_long <- pivot_longer(df_polls, cols = c("ABC_poll","CBS_poll"),
                        names_to = "Poll", values_to = "Percent")

# Basic grouped bar chart
p <- ggplot(df_long, aes(x = Name, y = Percent, fill = Poll)) +
  geom_col(position = position_dodge(width = 0.8), width = 0.7) +
  labs(title = "ABC vs CBS Polls by Candidate",
       y = "Percent",
       x = "") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 25, hjust = 1))

# Print the plot
print(p)

