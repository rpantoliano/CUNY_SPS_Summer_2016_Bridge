# Author: Rich Pantoliano, Jr.
# CUNY SPS Week 1 R Assignment

# 1. Write a loop that calculates 12-factorial.
twelveFact <-1
for (i in 2:12)
{
  twelveFact <- twelveFact * i
}
print(twelveFact)


# 2. Show how to create a numeric vector that contains the sequence from 20 to 50 by 5.
byFive <- seq(20,50,5)
print(byFive)


#3.Show how to take a trio of input numbers a, b, and c and implement the quadratic equation.

# function that takes 3 args representing a, b, and c in ax^2 + bx + c = 0 and determines the roots
quadFormula <- function(a, b, c)
{
  # Calculate discriminant
  d <- b^2 - 4 * a * c
  if(d < 0)
  {
    quadFormula <- "No Real Roots"
  }
  else
  {  
    quadFormula <- c((-b + sqrt(d)) / (2 * a), (-b - sqrt(d)) / (2 * a))
  }
}

# Sample output
sample1 <- quadFormula(1, 0, -25)
print(sample1)

sample2 <- quadFormula(50, 0, 64)
print(sample2)



