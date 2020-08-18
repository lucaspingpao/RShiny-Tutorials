# Day 3: Statistics!
# Created by Lucas Pao

# Creating some random datasets
a <- 1:5; b <- 1:5; a; b
multiplicationTable <- outer(a, b, function(a, b) a * b); multiplicationTable
random <- sample(1:10, 5); random


# Statistics -----------------------------------------------------------
# sum, min/max, mean, median, range, IQR, variance, standard deviation

# Applying to a random set of numbers - let's check the hand-calculations we just did before!
random
min(random)
max(random)
mean(random)
median(random)
range(random)
IQR(random)
var(random) # sample variance
sd(random) # sample standard deviation

# Applying to all elements in the table
multiplicationTable
sum(multiplicationTable)
min(multiplicationTable)
max(multiplicationTable)
mean(multiplicationTable)
median(multiplicationTable)
range(multiplicationTable)
IQR(multiplicationTable)
sd(multiplicationTable)

# Applying to specific columns
multiplicationTable
col4 <- multiplicationTable[,4]; col4
min(col4)
max(col4)
mean(col4)
median(col4)
range(col4)
IQR(col4)
var(col4)
sd(col4)

#Applying sum/mean to all rows/columns
multiplicationTable
colSums(multiplicationTable)
rowSums(multiplicationTable)
colMeans(multiplicationTable)
rowMeans(multiplicationTable)


