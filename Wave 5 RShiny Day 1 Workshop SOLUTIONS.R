# Created by Lucas Pao and Karina Halevy
# August 17, 2020 Day 1 - R Basics


# Part 1: Practice! -------------------------------------------------------
# If you get stuck, feel free to ask your peers in your breakout group or refer to the corresponding sections in the lesson template code.

# 1. Introduction
# a) Open up the file named “Wave 5 RShiny Day 1 Workshop.R” in RStudio.
# b) Introduce yourself to the other students in your breakout group (First name, Hometown, favorite number).
# c) Write this information in the script as a comment.

# Lucas, Basel, 8
# Karina, Los Altos, 23


# d) Print the following message to the console using one print command:
#   “[Name] is from [Hometown] and their favorite number is [Number].”

print("Lucas is from Basel and their favorite number is 8.")


# 2. Data Types
# a) Create a new variable called “name” and assign to it a string that contains one of the students’ names in your breakout group.
# b) Create a new variable called “hometown” and assign to it a string that contains the student’s hometown.
# c) Create a new variable called “number” and assign to it the value of the student’s favorite number.

name <- "Lucas"; name
hometown <- "Basel"; hometown
number <- 8; number


# d) Convert the value inside the variable called “number” from a number to a string.
# For example, if “number” contains the value 10, make it now have the value “10”.

number <- as.character(number); number


# e) Print the following message to the console by pasting together the information stored inside the variables “name”, “hometown”, and “number”.
# “[Name] is from [Hometown] and their favorite number is [Number].”

print(paste(name, "is from", hometown, "and their favorite number is", number, "."))


# 3. Data Structures
# a) Create three vectors, each containing information about the students in your breakout group:
# One consisting of all the students’ names, one consisting of all the students’ hometowns, and one consisting of all the students’ favorite numbers.

names <- c("Lucas", "Karina"); names
hometowns <- c("Basel", "Los Altos"); hometowns
numbers <- c(8, 23)


# b) Combine these vectors into a matrix, where each row represents different students’ information.
#   i) Rename the row and column headers to reflect the information stored inside this matrix.
#   ii) Print everyone’s favorite number by accessing the corresponding information in the matrix in two different ways.
#   iii) Print your favorite number by accessing it in the matrix.

teachersMatrix <- cbind(names, hometowns, numbers); teachersMatrix
rownames(teachersMatrix) <- c("Teacher 1", "Teacher 2"); teachersMatrix
teachersMatrix[,3]
teachersMatrix[,"numbers"]
teachersMatrix[1,3]
teachersMatrix["Teacher 1", "numbers"]


# c) Combine these vectors into a list.
#   i) Rename the list elements to reflect the information contained in the list.
#   ii) Print everyone’s favorite number by accessing the corresponding information in the list in two different ways.
#   iii) Print your favorite number by accessing it in the list.

teachersList <- list(names, hometowns, numbers); teachersList
names(teachersList) <- c("Names", "Hometowns", "Numbers"); teachersList
teachersList[[3]]
teachersList$Numbers
teachersList[[3]][1]
teachersList$Numbers[1]


# 4. Conditionals and Functions (Challenge!!!)
# Use the following as a template for the functions you will write in 4.a), 4.b), and 4.c).
greet <- function() {
  return()
}

# a) Create your own greeting function that takes as inputs a name, a hometown, and a number and outputs the message:
#   “[Name] is from [Hometown] and their favorite number is [Number].”
# Example. INPUT: (Lucas, Basel, 8), OUTPUT: “Lucas is from Basel and their favorite number is 8.”
greetA <- function(name, hometown, number) {
  message <- paste(name, "is from", hometown, "and their favorite number is", number, ".")
  return(message)
}
greetA("Lucas", "Basel", 8)

# b) Create your own greeting function that takes as inputs vectors of names, hometowns, and numbers and outputs the message:
# “[Name 1] is from [Hometown 1] and their favorite number is [Number 1].”
# “[Name 2] is from [Hometown 2] and their favorite number is [Number 2].”
# “[Name 3] is from [Hometown 3] and their favorite number is [Number 3].” 
# … and so on …
# Example. INPUT: (c("Lucas", "Karina"), c("Basel", "Los Altos"), c(8, 23)),
#          OUTPUT: “Lucas is from Basel and their favorite number is 8. Karina is from Los Altos and their favorite number is 23.”
greetB <- function(names, hometowns, numbers) {
  numPeople <- length(names)
  message <- ""
  for(i in 1:numPeople) {
    message <- paste(message, names[i], "is from", hometowns[i], "and their favorite number is", numbers[i], ".")
  }
  return(message)
}
greetB(c("Lucas", "Karina"), c("Basel", "Los Altos"), c(8, 23))

# c) Create your own greeting function that inputs vectors of names, hometowns, and numbers and outputs the message:
# “[Name] is from [Hometown] and their favorite number is [Number].”
# for each set of inputs whose corresponding favorite number is odd.
# Example. INPUT: (c(Lucas, Karina), c(Basel, Los Altos), c(8, 23)),
#          OUTPUT: "Karina is from Los Altos and their favorite number is 23.”
greetC <- function(names, hometowns, numbers) {
  numPeople <- length(names)
  message <- ""
  for(i in 1:numPeople) {
    if(numbers[i] %% 2 == 1) {
      message <- paste(message, names[i], "is from", hometowns[i], "and their favorite number is", numbers[i], ".")
    }
  }
  return(message)
}
greetC(c("Lucas", "Karina"), c("Basel", "Los Altos"), c(8, 23))



# Part 2 - Apps! (Bonus) --------------------------------------------------

# In tomorrow’s lesson, we will start creating an app related to prime factorization.
# Please write the following functions that will be implemented in the app.

# 1. Create a function that takes as an input an integer and outputs a list of its factors
# Example. INPUT: 24, OUTPUT: "The factors of 24 are: 1,2,3,4,6,8,12,24."

factorize <- function(number) {
  if(is.character(number) || number < 2 || number != round(number)) {
    return("Error. Input must be an integer greater than 2.")
  }
  factors <- c()
  for(i in 1:number) {
    if(number %% i == 0) {
      factors <- c(factors, i)
    }
  }
  factorsString <- paste(factors, collapse=", ")
  message <- paste("The factors of", number, "are:", factorsString)
  return(message)
}
factorize(24)
factorize(-1)
factorize(2.5)
factorize("Hello world")


# 2. Create a function that takes as an input an integer and outputs its prime factorization
# Example. INPUT: 360, OUTPUT: "The prime factorization of 360 is: 2 x 2 x 2 x 3 x 3 x 5."
# Hint: use the following commands from the primes library
install.packages("primes"); library(primes) #Run this command
is_prime(5) #is_prime() tells you if a number is prime
generate_primes(0,10) #generate_primes(min, max) tells you all the prime numbers between min and max

# *** WRITE CODE for 2. HERE ***
primefactorize <- function(number) {
  if(is.character(number) || number < 2 || number != round(number)) {
    return("Error. Input must be an integer greater than 2.")
  }
  primes <- generate_primes(0, number)
  n <- number
  primefactors <- c()
  for(i in primes) {
    while(n %% i == 0) {
      n = n/i
      primefactors <- c(primefactors, i)
    }
  }
  primefactorsString <- paste(primefactors, collapse=" x ")
  message <- paste("The prime factorization of", number, "is:", primefactorsString)
  return(message)
}
primefactorize(360)
factorize(-1)
factorize(2.5)
factorize("Hello world")


# c) Create error handling messages for these functions so that these functions only work for integers greater than 2.
# Example. INPUT: -1, OUTPUT: "Error. Input must be an integer greater than 2."
# Example. INPUT: 2.5, OUTPUT: "Error. Input must be an integer greater than 2."
# Example. INPUT: "Hello world", OUTPUT: "Error. Input must be an integer greater than 2."

# *** EDIT CODE for 3. ABOVE ***


