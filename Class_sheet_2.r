### Stats with R class sheet 2


## This class sheet contains the exercises that you will need to complete and 
## submit within the next 60 minutes. Write the code below the questions. 
## If you need to provide a written answer, comment this out using a hashtag (#). 
## Submit your class sheet via cms (one member) and notify your tutor once you are done.

## Please write below all Names and Matriculation numbers of your team members that are present:
## Name: Ankit Khatiwada
## Matriculation number: 7089529
## Name: Bishal Joshi
## Matriculation number: 7079449
## Name: Sonika Acharya
## Matriculation number: 7090131

###############################################################
# Sampling distribution, confidence intervals, and data cleaning
###############################################################

###############################################################
### Exercise 1: Deriving sampling distributions
###############################################################
## In this exercise, we're going to derive sampling distributions for the mean with 
## different sizes.

## a) We will not use data from a normal distribution, but work with the poisson distribution, which is 
### often used for count data. We will use the dataset sunspot.year, please find out what it is about


??sunspot


 ## please run the following line to convert the data into numeric
sunspot.year = as.numeric(sunspot.year)

## b) Take a look at the dataset using the summary() function and histogram and boxplot. 
summary(sunspot.year)
hist(sunspot.year)
boxplot(sunspot.year)
## c) Compare mean and median of the dataset
mean(sunspot.year)
median(sunspot.year)
## mean is 48.61 and median is 39.00
## d) Create a random sample of a normal distribution of equal length (same number of data points) and with the same mean and 
##   standard deviation as the observed dataset (sunspot.year), assign it to norm_disc
norm_disc = rnorm(length(sunspot.year), mean=mean(sunspot.year), sd=sd(sunspot.year))
?sunspot.year
## e) Make a histogram of norm_disc and compare this to the histogram of the original dataset from b
hist(norm_disc)

## f) Describe the differences observed in e
## The original dataset was right skewed and the new sampled dataset is normally distributed

## g) Now, we are going to draw a smaller sample from sunspot.year.
### Use the function sample() to create a sample of four instances from sunspot.year
### assign it to sample4
?sample
sample4 = sample(sunspot.year, 4)
sample4


## h) draw another 2 samples of 4 called sample4b and sample4c
sample4b = sample(sunspot.year, 4)
sample4c = sample(sunspot.year, 4)

## i) calculate the mean of the three samples and store them in the vector means4
means4 = c(mean(sample4), mean(sample4b), mean(sample4c))

## j) Are the values different? Why?
means4
## No the mean is not equal as we are sampling randomly which generates 4 different data  


## k)   In order to draw a distribution of such a sample, we want to calculate the
###   mean of 1000 samples, each of size 4. However, we don't want to repeat 
###   question e and f 1000 times. Use a for loop to draw 1000 samples of size 4
###   and store the mean of each sample in the vector means4.
means4 = c()
for (x in 1:1000) {
  means4 = append(means4, mean(sample(sunspot.year, 4)))
}


## l) Repeat the for-loop in question k, but use a sample size of 40. 
##    Assign this to 'means40' instead of 'means4'.
means40 = c()
for (x in 1:1000) {
  means40 = append(means40, mean(sample(sunspot.year, 40)))
}

## m) Explain in your own words what 'means4' and 'means40' now contain. 
##    How do they differ?

## Mean4 will contain the mean of randomly sampled 4 samples from the distribution. 
## Mean40 will contain the mean of randomly sampled 40 samples from the same distribution.
## Sampling is done 1000 times in each.


## n) Draw histograms of means4 and means40. Describe in what way they differ
hist(means4)
hist(means40)
## Mean 40 is more normally distributed than means4 cause it has more number of samples.

## o) Why do you observe a skew for means4, but not for means40?

## The same reason as we increase the number of data in sampling it moves from the original distribution to the normal distribution. 
## As the original distribution was right skewed, the mean4 is a bit skewed because it has less number of sample, whereas means40 has more number of samples so it is normally distributed