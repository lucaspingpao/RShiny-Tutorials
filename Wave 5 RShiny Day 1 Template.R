# Created by Lucas Pao
# Last edited: August 16, 2020 by Karina Halevy
# 1. Introduction ---------------------------------------------------------

# To create a new document, go to File -> New File -> R Script
# Print hello world!
# To run a command, move to the line you want to execute and hit Ctrl + Enter or Cmd + Return
print("Hello world!")

# 2. Data types -----------------------------------------------------------

# Assignment operator "<-" assigns the value on the right to the variable on the left
# Unlike other programming languages, you do not need specify the data type of a variable to create one
# To show a variable on the R console, simply type the name of that variable
testVariable1 <- 1; testVariable1
print(testVariable1)
testVariable2 <- "Hello"; testVariable2
testVariable3 <- TRUE; testVariable3 # boolean

# You can change the data type of a variable using as.numeric or as.character
testVariable3 <- 2; testVariable3
testVariable3 <- as.character(testVariable1); testVariable3
testVariable4 <- as.numeric(testVariable3); testVariable4

# Print hello world again!
name <- "Karina"
greeting <- paste("Hello my name is", name)
print(greeting)

1 + 2
3 * 8
3 / 4
5 - 6
# no quotes here because we are printing the value inside the variable named greeting, not the word "greeting" itself

# 3. Data structures --------------------------------------------------------------

# a) Vectors

# To create a vector, put the elements of a vector inside the c() function
vectorExample <- c(1, 2, 3, 4, 5); vectorExample

# To append or combine vectors, place all the vectors and extra elements into the c() function
combinedVector <- c(vectorExample, 10, 11, 12); combinedVector

# Sum function adds together all the elements of a vector
sum(vectorExample)

v1 <- c(1, 2, 3, 4); v1
v2 <- c(6, 7, 8, 9); v2
# Standard operations between two vectors acts on each corresponding element individually to produce a third vector
v1 + v2
v1 * v2

# b) Matrices

# Concatenates vectors into a matrix
cbind(v1, v2)
rbind(v1, v2)

# Other way to create matrix
matrixInputs <- c(v1, v2); matrixInputs
matrixExample <- matrix(matrixInputs, nrow=2, ncol=4, byrow=TRUE); matrixExample

# Accessing elements in a matrix
matrixExample[1,3]
matrixExample[1,]
matrixExample[,3]

# Create row/column names and access matrix elements by name
rownames(matrixExample) <- c("row1", "row2"); matrixExample
colnames(matrixExample) <- c("col1", "col2", "col3", "col4"); matrixExample
matrixExample["row1", "col3"]
matrixExample["row1",]
matrixExample[,"col3"]

# c) Lists

# Create list elements first
line1 <- c(1, 2, 3, 4, 5)
line2 <- c("A", "B", "C")

# Combine list elements into a list
listExample <- list(line1, line2); listExample

# Access list elements
listExample[[2]]

# Create names for list elements and access them by name
names(listExample) <- c("firstline", "secondline"); listExample
listExample$secondline

# 4. Conditionals ---------------------------------------------------------

# Synctactic structure of conditional statements
 if(2 > 3) {
   print("two is more than three")
} else {
  print("something went wrong")
}

# while(condition is satisfied) {
#   keep running brackets inside brackets until conditions are no longer satisfied
# }
# 
# for(i in 1:N) {
#   run command inside brackets N times
# }


# Deconstructing the for loop!

1:5 # Vector of elements 1-5

# Iterates through command "print(i)" 5 times
for(i in 1:5) {
  print(i)
}

# Iterates through command "print("Hello world") 5 times
for(i in 1:5) {
  print("Hello world")
}

n <- 5
while(n > 0) {
  print("n is positive")
  n <- n - 1
}
# 5. Functions ------------------------------------------------------------

# Syntactic structure of functions
# functionName <- function(parameter1, parameter2, etc.) {
#   commands
#   return(output) <--- optional
# }


# Print hello world yet again!
greet <- function(name) {
  message <- paste("Hello my name is", name)
  return(message)
}
greet("Karina")
greet("Lucas")
# Input name, output "Hello my name is ... "


