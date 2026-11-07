### Stats with R Exercise sheet 2

###############################################################
# Deriving sampling distribution and confidence intervals
###############################################################

## This exercise sheet contains the exercises that you will need to complete and 
## submit by 23:55 on Saturday, November 7th. Write the code below the questions. 
## If you need to provide a written answer, comment this out using a hashtag (#). 
## Submit your homework via cms
## Remember to answer each subquestion and test your code, before you submit.


## Please write below your (and your teammates) name, matriculation number. 
## Name: Ankit Khatiwada
## Matriculation number: 7089529
## Name: Bishal Joshi
## Matriculation number: 7079449
## Name: Sonika Acharya
## Matriculation number: 7090131


## Only 1 member needs to submit! 

#############################################
## Exercise 2: Concepts
#############################################

## The following code performs a t test (covered in week 6) to compare mean monthly accident deaths between the
## years 1973 and 1978 in the US
?t.test()

t.test(USAccDeaths[1:12], USAccDeaths[61:72], alternative="greater")

## Look at the output and - without knowing the details of the underlying test - try to answer
## the following questions:

## a) Is the test significant at the alpha level of 0.05?
## Yes as p<alpha, and we reject H0 so it is significant

## b) What is the probability that this result is subject to a Type I error?
## aplha which has the value of 0.05

## c) Is this output also suited to tell you something about the Type II error probability?
## No, we need beta for that.

## d) Is this test one-tailed or two-tailed?
## One tailed

## e) Do you think the test should be one-tailed or two-tailed?
## It should have been two tailed as we don't know how the data looked like.


###############################################################
### Exercise 3: Confidence interval
###############################################################

## A confidence interval is a range of values that is likely to contain an 
## unknown population parameter.
## The population parameter is what we're trying to find out. 
## Navarro discusses this in more depth in chapter 10.


## a) What does a confidence interval mean from the perspective of experiment replication?
## From the perspective of experimental replication, if we repeat the experiment again, 
## and calculate the x% CI, about x% of CI will contain the mean of the population.

## b) please install and load packages sciplot and lsr
install.packages("sciplot")
install.packages("lsr")
library(sciplot)
library(lsr)

## c) We will be working with the dataset rivers, that lists the length of major US rivers. What does the following line do?
sample15 = sample(rivers,15)
sample15
?rivers

## d) calculate 95% Confidence Intervals for rivers and sample15. You can
##    use the function ciMean()
ciMean(sample15) ##95 default..

## e) Why are the intervals different?
## They are the two sides first with 2.5% distributed on both sides of the tail

## f) We will now calculate the confidence interval for the mean of rivers by hand. 
##  A commonly used formula for 95% confidence intervals is mean±1.96*SE
se = sd(sample15)/(length(sample15))^0.5
ciright95 = mean(sample15)+1.96*se
cileft95 = mean(sample15)-1.96*se
## g) Do your results align with the output of ciMean above? (There might be a bit of rounding error)
## abit is different but similar may be the rounding error..


## h) Now, please calculate a 90% confidence interval without the ciMean function. 
##  Hint: You need to replace the 1.96, which is the 97.5 quantile of the normal distribution.


## split 10 in both tail 5 each so checking on 95 percent.
ciright90 = mean(sample15) + qnorm(0.95)*se
cileft90 = mean(sample15) - qnorm(0.95)*se


## i) Compare to the interval in g!
print(ciright95)
print(ciright90)
print(cileft95)
print(cileft90)

## 90 CI is smaller than 95 CI

#################################################################################
##  Exercise 4: Cleaning data
#################################################################################

## download the file insomnia26.csv from cms
## The made-up dataset insomnia contains data of a survey on 63 students. 
## They are asked two questions: whether they regularly encounter sleep problems
## and what their preferred and most consumed drink is.

## a. Load the libraries stringr, dplyr, tidyr and forcats


## b. read in the data


## c. get a summary of the dataset


## d. the variable sleepProblem should be a numerical variable and have 0 for no Problem 
##    and 1 for sleep problems.
##    Make sure that this is the case


## e. how many students encounter sleep problems?


## f. how many different drinks do students name? (transform the variable into a 
## factor first)


## g. collapse factor levels which were spelled wrong


## h. Assign your cleaned dataset to clean