# Day 3: Statistics!
# Created by Lucas Pao on August 19, 2020


# 1. Let's check our calculations from the slides! ------------------------

# a) The mean is the sum of elements divided by the number of elements of a set.
vector1 <- c(1,2,3,4,5); vector1
sum(vector1) / length(vector1)
mean(vector1)

# b) The median is the middle element of a set of sorted numbers.
vector2 <- c(4,5,8,3,2,1); vector2
sort(vector2)
median(vector2)

# c) Measures of Spread: range = max - min
vector3 <- c(1,2,3,4,5,6,7,8,9,10); vector3
max(vector3)
min(vector3)
range(vector3)
max(vector3) - min(vector3)

# d) The nth percentile of a set of numbers is value at which n percent of the numbers are less than the value
# The Interquartile Range is the 75th percentile - 25th percentile
quantile(vector3) #All percentiles
quantile(vector3, 0.25) #25th percentile
quantile(vector3, 0.75) #75th percentile
quantile(vector3, 0.75) - quantile(vector3, 0.25)
IQR(vector3)

# e) The variance of a set of numbers represents how much the numbers differ from the mean.
# The standard deviation is the squareroot of the variance.
var(vector3)
sqrt(var(vector3))
sd(vector3)


# 2. Let's sample a random set of numbers and find: -----------------------
# sort, sum, mean, median, min/max, range, quantiles, IQR, variance, standard deviation
random <- sample(1:100, 10); random
sort(random)
sum(random)
mean(random)
median(random)
min(random)
max(random)
range(random)
quantile(random)
IQR(random)
var(random)
sd(random)


# 3. Let's analyze this random set of student's grades --------------------
grades <- matrix(sample(60:100, 15), nrow=5, ncol=3); grades
rownames(grades) <- c("Alice", "Bob", "Charlie", "David", "Eve"); grades
colnames(grades) <- c("Homework", "Quiz", "Test"); grades

# a) Applying statistics to all elements in the table
# sort, sum, mean, median, min/max, range, quantiles, IQR, standard deviation
grades
sort(grades)
sum(grades)
mean(grades)
median(grades)
min(grades)
max(grades)
range(grades)
quantile(grades)
IQR(grades)
sd(grades)

# b) Applying statistics to specific rows and columns in the table
grades
bob <- grades["Bob",]; bob
mean(bob)
quiz <- grades[,"Quiz"]; quiz
median(quiz)

# c) Applying sum/mean to all rows/columns in the table
grades
colSums(grades)
rowSums(grades)
colMeans(grades)
rowMeans(grades)


