### Stats with R Exercise sheet 3

#################################################
# Tests for Categorical Data 
#################################################

## This exercise sheet contains the exercises that you will need to complete and 
## submit by 23:55 on Saturday, November 14th. Write the code below the questions. 
## If you need to provide a written answer, comment this out using a hashtag (#). 
## Submit your homework via cms. Remember to answer each subquestion and run your
## code before you submit.

## Only 1 member needs to submit! 

## Please write below your name and matriculation number (any member of the team)
## Name:
## Matriculation number:

####################################################################
### Exercise 2: Chi-squared test in r
####################################################################

## Consider the data set insomnia from last week's sheet (there is a cleaned 
## version uploaded to cms)
## Now consider we want to see whether the preferred drink influences sleep problems

## a. Load dataset using function "load" 
dataset <- load('./dataset/insmonia_clean26.rdata')
clean

## b. use r's build in function chisq.test() to test the above hypothesis
##    and assign the result to chitest
chitest <- chisq.test(clean$sleepProblem, clean$drink, correct = TRUE, rescale.p = TRUE)
chitest

## c. What is your conclusion? Remember to report p-values and test statistics
##    where appropriate.
## X-squared = 9.6804, df = 2, p-value = 0.007906
## A Pearson's chi-squared test was conducted to examine whether 
## preferred drink influences sleep problems. There is a statistically significant 
## association between preferred drink and sleep problems, X^2 = 9.68, p = 0.0079. 
## Since p < 0.05, we reject the null hypothesis and conclude that sleep problems depend on the preferred drink.

## d. Look at the observed and expected values of your chi square test
sum(((chitest$observed - chitest$expected)^2)/chitest$expected)
chitest$observed
chitest$expected

## e. Is the Chisquare test appropriate or should you use Fisher's exact test for this data? Explain. 
## Here the expected frequency in each cell of our data is > 5 which is the required threshold for
## Fisher's test. So we donot need to perform this test and our chi square test is appropriate

####################################################################
### Exercise 3: Confounding variables
####################################################################

## In the above dataset, there were two other demographic variables: gender and subject.
## In this exercise, we want to find out whether they might be confounds for the
## relationship between drink and sleeping problems.

## a.  What is a confound? Why can it be problematic? Describe in your own words
## Confound is a variable which can be related to both the dependent or independent variable
## and can affect the outcome of our test

## b. Please argue whether gender is a confound here. 
##    Hint: You have to run 2 chisquare tests to find out
chisq.test(clean$gender, clean$drink)
chisq.test(clean$gender, clean$sleepProblem)

(chisq.test(clean$gender, clean$drink))$expected
(chisq.test(clean$gender, clean$sleepProblem))$expected

# Yes, gender is a confound variable for the relationship between preferred drink and sleep problems. 
# Confound variable must be associated with both dependent and independent variable. Here,
# 1. Gender vs. preferred drink: X^2 = 10.19, p = 0.0061 (p < 0.05, significant association)
# 2. Gender vs. sleep problems: X^2 = 4.01, p = 0.0454 (p < 0.05, significant association)
# conditions for confounding.

## c. Please argue whether subject is a confound here.
chisq.test(clean$subject, clean$drink)
(chisq.test(clean$subject, clean$drink))$expected

# expected frequency < 5 so need fisher test
fisher.test(clean$subject, clean$drink)

chisq.test(clean$subject, clean$sleepProblem)
(chisq.test(clean$subject, clean$sleepProblem))$expected

# expected frequency < 5 so need fisher test
fisher.test(clean$subject, clean$sleepProblem)

# No, subject is not a confound for the relationship between preferred drink and sleep problems.
# Because expected cell frequencies were below 5, Fisher's exact tests were used:
# 1. Subject vs. preferred drink: Fisher's exact test, p = 0.0919 (p > 0.05, not significant)
# 2. Subject vs. sleep problems: Fisher's exact test, p = 0.4880 (p > 0.05, not significant)
# Since subject is not significantly associated with either preferred drink or sleep 
# it is not a confound.


## d. Given your results from b and c, do you have to change your interpretation of
##   the relationship between sleepProblems and preferred drink?
# Yes, we must adjust our interpretation. subject is not a confound but 
# gender is a confound because it is significantly associated with both 
# preferred drink (p = 0.0061) and sleep problems (p = 0.0454). 
# We cannot conclude from Exercise 2 alone that preferred drink directly 
# influences sleep problems the apparent association between drink and sleep problems may 
# related to gender differences.


#########################################
##Exercise 4. Binomial distribution
#########################################
##  In a board game, you have to roll a fair 6-sided die. You will get a point, 
##  each time the number is higher than 4. You roll 20 times.

## a) What is the chance in a single roll of earning a point?
## Fair 6 side dice has 1,2,3,4,5,6 possibilities
## To get point we need > 4 in one try which is 5 or 6 so 2/6
prob_point <- 2/6

## b) Please calculate the probability of getting exactly 8 points.
##    Calculate this using the dbinom() function.
## Here success probability in each trial which is getting a point is 2/6 
dbinom(x = 8, size = 20, prob = 1/3)
# The probability of getting exactly 8 is 0.1479796

## c) Next please calculate the probability of getting at most 5 points
pbinom(q= 5 , size = 20, prob = 1/3)
# The probability is 0.2972139

## d) What is the difference between density function and distribution function?
# 1. Density function:
#    Gives the probability of obtaining an exact specific value, P(X = k). 
#    For example, dbinom(8, 20, 1/3) gives the probability of getting exact 8 points.
#
# 2. Distribution function:
#    Gives the cumulative probability of obtaining a value less than or equal to a 
#    given threshold.
#    For example, pbinom(5, 20, 1/3) adds up the probabilities of getting 0, 1, 2, 3, 4, 
#    or 5 points.

#########################################
##Exercise 5
#########################################

##  In order to better understand the relationship between sleeping problems and 
##  consumed drinks, we set up a better controlled experiment: 
##  For two weeks, students are asked to drink mostly coffee and are then asked
##  whether they encountered sleep problems. For another two weeks, the same students
##  are asked to switch to tea and then again asked for sleeping problems.

## a) Can you use the ChiSquare test in this situation? Explain and motivate
##  your answer


## b) Is there an alternative test you could use? Why would this be appropriate?