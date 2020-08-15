library(primes) # some functions such as is_prime come with this library
# install.packages("primes")
# brute force inverse calculator - num is the number and n is the modulo
inverse <- function(num, n) {
  # goes through every element from 1 to n - 1
  for (k in seq(1:n)) {
    # if k * the number is 1 mod n, then that satisfies the definition of an inverse
    if ((num * k) %% n == 1) {
      # if we're here, we know that we've found the inverse, and the inverse is unique
      return(k)
    }
  }
  # if we've looped through all the numbers and still haven't returned an inverse, then we know there is no inverse
  return(-1)
}

# test inverse - uncomment this and run to see if our calculations are correct
# this example is the inverse of [3]_6
# inverse(3, 6)
# inverse(2, 5)

# Given a number num, exponentiates it modulo n
# Uses the strategy of repeated multiplication & modding so as not to overflow for large numbers
modExp <- function(num, n, p, intermediate) {
  # anything to the zero power is 1
  if (p == 0) {
    return(1)
  }
  # anything to the first power is just itself, so we just need to take it mod n
  if (p == 1) {
    return(intermediate %% n)
  }
  # recursive step: multiply the intermediate value by num, take it mod n, decrement p by 1, and repeat until we hit 1 or 0
  return(modExp(num, n, p - 1, (intermediate * num) %% n))
}

# test modExp - this one is [6]_7^2, and we pass intermediate = 6 for the sake of recursion
# modExp(6, 7, 2, 6)

# Given a number n, calculates the number closest to n that is prime, rounding up in case of ties
# Low and high are to indicate the bounds of our slider, which we'll use in app.R
# Radius is a helper variable to see the range of values we should be looking at
closestPrime <- function(n, low = 2, high = 50, radius = 0) {
  # this code tests if n - radius is prime, and the first step is to calculate the lower bound
  # it's usually n - radius, unless that value is below our lower bound, so we want the higher of the 2
  lower <- max(low, n - radius)
  # repeat but for n + radius
  higher <- min(high, n + radius)
  # is_prime is a function in the primes library that tests if a number is prime
  # there are also manual ways to do this such as checking divisibility up to sqrt(n), Rabin-Miller, etc
  # if the higher number is prime, return it (this is how we break ties)
  if (is_prime(higher)) {
    return(higher)
  }
  # if the higher number isn't prime but the lower one is, return it
  if (is_prime(lower)) {
    return(lower)
  }
  # if we haven't found a prime yet, recursively call the function again, and expand our search radius
  # eventually, with reasonable bounds, we'll find a prime, so the recursion will terminate at some point
  return(closestPrime(n, low, high, radius + 1))
}

# test closestPrime - uncomment to run
# closestPrime(50)

# Given n, op, left, and right, converts the calculation into a printable mathJax helptext string
# n is the base of Z_n, op is the binary operation, left is the left input, and right is the right input
convertEquation <- function(n, op, left, right) {
  # these next 5 if statements carry out the calculation on left and right given the string op
  if (op == "+") {
    # do the addition and store it in result variable
    result <- (left + right) %% n
  }
  if (op == "-") {
    result <- (left - right) %% n
  }
  if (op == "*") {
    result <- (left * right) %% n
    # changing op to \\cdot for LaTeX purposes (it's the dot you see that represents multiplication)
    op <- "\\cdot"
  }
  if (op == "/") {
    # for division, we need to do some error checking
    # we only carry out the division if the denominator is valid - i.e. it's not 0 mod n
    if (right %% n != 0) {
      # essentially, x / y is equal to x * the inverse of y
      # calculate the inverse mod n using our previously written inverse function
      i <- inverse(right, n)
      # remember that we used -1 to represent the fact that a number doesn't have an inverse
      if (i != -1) {
        # if we have an inverse, carry out the appropriate multiplication
        result <- (left * i) %% n
      }
      else {
        # if the denominator is valid but there is no inverse, we'll represent that by -1
        result <- -1
      }
    }
    # if the denominator is 0 mod n, we'll represent that by -2 and use that to display the appropriate error message
    else {
      result <- -2
    }
  }
  # some error checking is also needed for exponentiation
  if (op == "^") {
    if (left == 0 && right == 0) {
      # 0^0 is undefined
      return("Cannot raise 0 to the 0 power.")
    }
    # taking everything mod n just to be safe - never hurts to over-mod
    # otherwise, essentially just calling modExp
    result <- (modExp(left, n, right, left)) %% n
  }
  # remember that we used this to denote the denominator being zero
  if (result == -2) {
    # helper will be our variable that stores some text we want to display
    helper <- "Cannot divide by zero."
  }
  # as.integer takes a float and rounds it down to the nearest integer
  else if (left != as.integer(left) || right != as.integer(right)) {
    # nothing will go wrong with our calculations if we do them on floats
    # however, modular arithmetic is confined to integers, so we don't want to display them
    helper <- "Inputs must be integers."
  }
  # next case: if we have a valid numerical result
  else if (result != -1) {
    # exponentiation needs some special handling
    if (op != "^") {
      # this is LaTeX for displaying something like [a]_b + [c]_b = [d]_b
      # helper 1 is an equation giving the raw inputs and the result
      helper1 <- paste("$$[", left, "]_{", n, "}", op, " [", right, "]_{", n, "}", " = ", "[", result, "]_{", n, "}$$")
      # helper 2 is an equation giving the inputs taken mod n, to demonstrate that something like [27]_2 is the same as [1]_2
      helper2 <- paste("$$[", left %% n, "]_{", n, "}", op, " [", right %% n, "]_{", n, "}", " = ", "[", result, "]_{", n, "}$$")
      # paste is a function that concatenates two strings
      helper <- paste(helper1, helper2)
    }
    else {
      # this code is pretty similar, but LaTeX is a bit weird with the ^ symbol, so we separate it out
      # we also don't modularize the exponent
      helper1 <- paste("$$[", left, "]_{", n, "}^{", right, "}", " = ", "[", result, "]_{", n, "}$$")
      helper2 <- paste("$$[", left %% n, "]_{", n, "}^{", right, "}", " = ", "[", result, "]_{", n, "}$$")
      helper <- paste(helper1, helper2)
    }
  }
  # finally, this is the case where the result is -1, which we used when a number didn't have an inverse
  else {
    helper <- paste("$$[", right, "]_{", n, "}$$ has no inverse in $$Z_{", n, "}$$")
  }
  # returns the giant string of helper text, to be passed into withMathJax later in app.R
  return(helper)
}

# Given a table and a target value, returns the rows that are supposed to be colored
# This is used to color the multiplication and addition tables in the app
# tbl is the table of data values (including column labels), target is the cells that need to be colored
# example: if target = 1, then we color all the cells that are equal to 1
getColors <- function(tbl, target) {
  # start 2 empty vectors to store coordinates (indices) of cells that will be collored
  r <- vector()
  c <- vector()
  # tbl[,1] is the first column of the table, so we just need the length of that column to figure out the number of rows
  # seq(a, b, c) means the sequence of numbers from a to b in intervals of c
  for (row in seq(1, length(tbl[,1]), 1)) {
    # length(tbl) is the number of columns that the table has
    for (column in seq(1, length(tbl), 1)) {
      # if that entry in the table is equal to the target value, add the coordinates to r and c
      if (tbl[row, column] == target) {
        # append coordinates
        r <- c(r, c(row))
        c <- c(c, c(column))
      }
    }
  }
  # return 2 rows, one of "x coordinates", and one of "y coordinates"
  return(rbind(r, c))
}

# test getColors and generating flextable
'n <- 2; v <- seq(1:n)

multbldf <- as.data.frame(cbind(v, outer(v, v, function(x, y) (x * y) %% n))); multbldf
multbldf
multbldf[1, 2]
multbldf[1,]
length(multbldf)
colnames(multbldf) <- c("Multiply", v); multbldf
multbl <- flextable(multbldf); multbl
colors <- getColors(multbldf, 1); colors
for (k in 1:length(colors[2,])) {
   if (colors[2,][k] != 1)
    multbl <- bg(multbl, i = colors[1,][k], j = colors[2,][k], bg = "cyan"); multbl
  }
multbl

addtbldf <- as.data.frame(cbind(v, outer(v, v, function(x, y) (x + y) %% n)))
colnames(addtbldf) <- c("Add", v); addtbldf
addtbl <- flextable(addtbldf)
colors2 <- getColors(addtbldf, 0); colors2
for (k in 1:length(colors2[2,])) {
  addtbl <- bg(addtbl, i = colors2[1,][k], j = colors2[2,][k], bg = "cyan")
}
addtbl
output$multable <- renderUI({htmltools_value(multbl)})
output$addtable <- renderUI({htmltools_value(addtbl)})'
