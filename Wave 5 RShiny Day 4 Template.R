#Created by Lucas Pao on July 27, 2020
#Last Edited: July 27, 2020

# 1. Data Frames ----------------------------------------------------------

# a) Creating Data Frames -------------------------------------------------

#Create columnns first and combine them into a data frame


#Create data frame from scratch



# b) Accessing Data Frame Elements ----------------------------------------

#Accessing data
data2
#row 1
#row 1 and 2
#column 1
#row 1 column 1

#Create row/columnn names and access elements by name
data2
#column 1
#column 1 row 1
#row 1
#row 1 and 2
#column 1
#row 1 column 1

#Subsetting Rows (subset, which)
data1


# c) Special Table functions ----------------------------------------------
#(expand.grid, outer)


# d) Statistics -----------------------------------------------------------
#sum, min/max, mean, median, range

#Applying to all elements in the tabble
multiplicationTable


#Applying to specific columns
multiplicationTable


#Applying sum/mean to all rows/columns
multiplicationTable



# 2. Data Analytics -------------------------------------------------------

#Read Data
#Go to "Session" -> "Set Working Directory" -> "Choose Directory"
#Then choose the folder in which the dataset file is located
dataset <- read.csv("Wave5-RShiny-Covid-Dataset.csv")


#Analyze the data!


#Previewing data (str, head)


# 3. Plotting -------------------------------------------------------------
library(graphics) #Graphics
#Other libraries: plotrix, ggplot, tidyverse

#Scatterplots
plot(x=NULL, y=NULL, xlab="x", ylab="y", xlim=c(0,10), ylim=c(-2,2), asp=1, main="Title", axes=TRUE)
x <- seq(1, 10, 0.5); x
y <- sin(x); y

#Points, lines, curves, text
?par #Find all the parameters here
?pch #Find all styles here
#pch: type of point
#cex: size of points/texts
#lty: type of line
#lwd: line thickness
points(x, y, col="blue", pch=20, cex=0.5)
lines(x, y, col="blue", lty=1, lwd=0.5)
abline(v=5, col="red", lty=2)
abline(h=0, col="red", lty=2)
curve(sin, from=0, to=20)
text(10,0, "Hello world", cex=1)

#Segments and arrows
#x0: from(x), x1: to(x), y0: from(y), y1: to(y)
plot(x=NULL, y=NULL, xlab="x", ylab="y", xlim=c(0,10), ylim=c(0,10), asp=1, main="Title", axes=TRUE)
arrows(x0=1, y0=1, x1=3, y1=3, col="green", lty=1, lwd=2)
segments(x0=4, y0=4, x1=6, y1=6, col="green", lty=1, lwd=2)

#Barplots
barplot(height=1:5, names.arg=c("a","b","c","d","e"), xlab="x", ylab="y", main="Title", col="blue", border="red")
barplot(height=data1$ages, names.arg=data1$names, xlab="Name", ylab="Age", ylim=c(0,25), main="Title", col="blue", border="red")
