# Given n, op, left, and right, converts the calculation into a printable mathJax helptext string
# n is the base of Z_n, op is the binary operation, left is the left input, and right is the right input
convertEquation <- function(op, left, right) {
  # these next 5 if statements carry out the calculation on left and right given the string op
  if (op == "+") {
    # do the addition and store it in result variable
    result <- left + right
  }
  if (op == "-") {
    result <- left - right
  }
  if (op == "*") {
    result <- left * right
  }
  if (op == "/") {
    # for division, we need to do some error checking
    # we only carry out the division if the denominator is valid - i.e. it's not 0 mod n
    if (right != 0) {
      result <- left / right
    }
    # if the denominator is 0 mod n, we'll represent that by -1 and use that to display the appropriate error message
    else {
      result <- -1
    }
  }
  # remember that we used this to denote the denominator being zero
  if (result == -1) {
    # helper will be our variable that stores some text we want to display
    helper <- "Cannot divide by zero."
  }
  # next case: if we have a valid numerical result
  else {
    # exponentiation needs some special handling
    helper <- paste(left, " ", op, " ", right, " = ", result)
  }
  # returns the giant string of helper text, to be passed into withMathJax later in app.R
  return(helper)
}