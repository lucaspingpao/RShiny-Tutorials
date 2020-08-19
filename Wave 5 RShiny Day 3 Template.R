# Day 3: Statistics!
# Created by Lucas Pao on August 19, 2020


# 1. Let's check our calculations from the slides! ------------------------

# a) The mean is the sum of elements divided by the number of elements of a set.
vector1 <- c(1,2,3,4,5); vector1


# b) The median is the middle element of a set of sorted numbers.
vector2 <- c(4,5,8,3,2,1); vector2


# c) Measures of Spread: range = max - min
vector3 <- c(1,2,3,4,5,6,7,8,9,10); vector3


# d) The nth percentile of a set of numbers is value at which n percent of the numbers are less than the value
# The Interquartile Range is the 75th percentile - 25th percentile


# e) The variance of a set of numbers represents how much the numbers differ from the mean.
# The standard deviation is the squareroot of the variance.



# 2. Let's sample a random set of numbers and find: -----------------------
# sort, sum, mean, median, min/max, range, quantiles, IQR, variance, standard deviation



# 3. Let's analyze this random set of student's grades --------------------
grades <- matrix(sample(60:100, 15), nrow=5, ncol=3); grades
rownames(grades) <- c("Alice", "Bob", "Charlie", "David", "Eve"); grades
colnames(grades) <- c("Homework", "Quiz", "Test"); grades

# a) Applying statistics to all elements in the table
# sort, sum, mean, median, min/max, range, quantiles, IQR, standard deviation
grades


# b) Applying statistics to specific rows and columns in the table
grades


# c) Applying sum/mean to all rows/columns in the table
grades


