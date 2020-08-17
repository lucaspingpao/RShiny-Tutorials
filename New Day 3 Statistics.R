# Day 3: Statistics!
# Created by Lucas Pao

# Creating some random datasets
a <- 1:5; b <- 1:5
multiplicationTable <- outer(a,b, function(a,b) a*b); multiplicationTable
random <- sample(1:10, 5); random


# Statistics -----------------------------------------------------------
#sum, min/max, mean, median, range, IQR, variance, standard deviation

#Applying to a random set of numbers - let's check the hand-calculations we just did before!
random
min(random)
max(random)
mean(random)
median(random)
range(random)
IQR(random)
var(random)
sd(random)

#Applying to all elements in the table
multiplicationTable
sum(multiplicationTable)
min(multiplicationTable)
max(multiplicationTable)
mean(multiplicationTable)
median(multiplicationTable)
range(multiplicationTable)
IQR(multiplicationTable)
sd(multiplicationTable)

#Applying to specific columns
multiplicationTable
multiplicationTable[,4]
min(multiplicationTable[,4])
max(multiplicationTable[,4])
mean(multiplicationTable[,4])
median(multiplicationTable[,4])
range(multiplicationTable[,4])
IQR(multiplicationTable[,4])
var(multiplicationTable[,4])
sd(multiplicationTable[,4])

#Applying sum/mean to all rows/columns
multiplicationTable
colSums(multiplicationTable)
rowSums(multiplicationTable)
colMeans(multiplicationTable)
rowMeans(multiplicationTable)


