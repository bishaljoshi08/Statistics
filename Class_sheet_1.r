### Stats with R class sheet 1 

## This exercise sheet contains the exercises that you will need to complete 
## in your first tutorial session. Write the code below the questions. 
## If you need to provide a written answer, comment this out using a hashtag (#). 
## Submit your homework via cms BY THE END OF THE FIRST PART OF THE TUTORIAL SESSION
## Only one student of your assignment group needs to submit. Please tell your 
## tutor once you have submitted, you can then start working on the homework sheet.
## You need to provide a serious attempt at solving each exercise in order to have
## the assignment graded as complete, please do not leave out subquestions!

## Please write below the names of all students from your assignment group present:
## Name: Ankit Khatiwada
## Name: Bishal Joshi
## Name: Sonika Acharya


## Many of the things on this exercise sheet have not been discussed in class. 
## The answers will therefore not be on the slides. You are expected to find 
## the answers using the help function in R, in the textbooks and online. If you 
## get stuck on these exercises, you can ask your tutor.
## You cannot use chatGPT or any other AI engine to answer your questions. If we
## catch you using one, we will grade the entire sheet as failed.

###############
### Exercise 1: Getting started
###############
## a) Look at your current working directory.
getwd()
## b) Get help with this function.
?getwd
## c) Change your working directory to another directory.
setwd("/home/ankit/Documents/SemII/Stats_with_R/class_sheet_1")
###############
### Exercise 2: Normal distribution plotting
###############
## In this exercise, we will plot normal distributions.

## a) First, use seq() (?seq) to select the x-values to plot the range for
##    (will become the x-axis in the plot).
##    Get R to generate the range from -4 to 4, by 0.1. Assign this to the 
##    variable x.
x <- seq(-4, 4, by=0.1)
?seq
## b) Now we need to obtain the y-values of the plot (the density). We do this 
##    using the density function for the normal distribution. 
##    Use "help(dnorm)" to find out about the standard functions for the normal 
##    distribution.
help(dnorm)
y<-dnorm(x)
## c) Now use plot() to plot the normal distribution for z values of "x". 
require(graphics)
plot(x,y)

## d) The plot now has a relatively short y-range, and it contains circles 
##    instead of a line. 
##    Using plot(), specify the y axis to range from 0 to 0.8, and plot a line 
##    instead of the circles.
?plot
plot(x,y, type="l", ylim=c(0, 0.8))
## e) We want to have a vertical line to represent the mean of our distribution.
##    'abline()' can do this for us. Look up help for abline(). 
##    Use abline() to create the vertical line. Specify the mean of x using
##    the argument 'v'.
##    In order to change the color of the line, set the argument 'col' to red.
?abline
abline(v=mean(x), col="red")
## f) Take a look at the beaver2 dataset. (You can see it by typing "beaver2".) 
##    Then select only the temperature part and store it in a variable "b2temp".
b2temp <- beaver2$temp
print(b2temp)
## g) Calculate the mean and standard deviation of this dataset and plot a normal
##    distribution with these parameters.
b2temp_mean <- mean(b2temp)
b2temp_sd <- sd(b2temp)
plot(b2temp, y=dnorm(b2temp, b2temp_mean, b2temp_sd), type="l") #gives zig zags due to back and forth of values in x axis
plot(sort(b2temp), y=dnorm(sort(b2temp), b2temp_mean, b2temp_sd), type="l") # sorting
## h) We observe two temperatures (38.34 and 36.91). What's the likelihood that
##    these temperatures (or more extreme ones) respectively come 
##    from the normal distribution from g)?
x1 <- 38.34
x2 <- 36.91
z1 <- (x1-b2temp_mean)/b2temp_sd
z2 <- (x2-b2temp_mean)/b2temp_sd
pnorm(z1)
pnorm(z2)
#For 38.34 we subtract 1-p
p1<-(1-pnorm(x1, b2temp_mean, b2temp_sd ))
print
#For 36.91
p2<-pnorm(x2, b2temp_mean, b2temp_sd )

