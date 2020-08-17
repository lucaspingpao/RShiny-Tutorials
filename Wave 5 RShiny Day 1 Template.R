# Created by Lucas Pao
# Last edited: August 16, 2020 by Karina Halevy
# 1. Introduction ---------------------------------------------------------

# To create a new document, go to File -> New File -> R Script
# Print hello world!
# To run a command, move to the line you want to execute and hit Ctrl + Enter or Cmd + Return


# 2. Data types -----------------------------------------------------------

# Assignment operator "<-" assigns the value on the right to the variable on the left
# Unlike other programming languages, you do not need specify the data type of a variable to create one
# To show a variable on the R console, simply type the name of that variable


# You can change the data type of a variable using as.numeric or as.character


# Print hello world again!

# no quotes here because we are printing the value inside the variable named greeting, not the word "greeting" itself

# 3. Data structures --------------------------------------------------------------

# a) Vectors

# To create a vector, put the elements of a vector inside the c() function


# To append or combine vectors, place all the vectors and extra elements into the c() function


# Sum function adds together all the elements of a vector


# Standard operations between two vectors acts on each corresponding element individually to produce a third vector


# b) Matrices

# Concatenates vectors into a matrix


# Other way to create matrix


# Accessing elements in a matrix


# Create row/column names and access matrix elements by name


# c) Lists

# Create list elements first


# Combine list elements into a list


# Access list elements


# Create names for list elements and access them by name


# 4. Conditionals ---------------------------------------------------------

# Synctactic structure of conditional statements
# if(condition is satisfied) {
#   run command inside brackets once
# }
# 
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


# Iterates through command "print("Hello world") 5 times


# 5. Functions ------------------------------------------------------------

# Syntactic structure of functions
# functionName <- function(parameter1, parameter2, etc.) {
#   commands
#   return(output) <--- optional
# }


# Print hello world yet again!


# Input name, output "Hello my name is ... "


