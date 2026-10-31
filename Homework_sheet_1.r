### Stats with R Exercise sheet 1 

## This exercise sheet contains the exercises that you will need to complete and 
## submit by 23:55 on Saturday, October 30. Write the code below the questions. 
## If you need to provide a written answer, comment this out using a hashtag (#). 
## Submit your homework via cms
## You are required to work together in your assignment group (3 students, same tutorial)
## You need to provide a serious attempt at solving each exercise in order to have
## the assignment graded as complete, please do not leave out subquestions and 
## make sure the code is executable!

## Many of the things on this exercise sheet have not been discussed in class. 
## The answers will therefore not be on the slides. You are expected to find 
## the answers using the help function in R, in the textbooks and online. If you 
## get stuck on these exercises, remember: Google is your friend. You are not
## allowed to use chatGPT or other AI engines.
## If you have any questions, you can ask these during the tutorial, or use the 
## cms discussion board for the course.

## Please write below the names of all students from your assignment group present:
## Name: Ankit Khatiwada
## Name: Bishal Joshi
## Name: Sonika Acharya

###############
### Exercise 3: Normal distribution generation
###############

## a) Use the random sampling function in R to generate 100 random samples from
##    a normal distribution with mean 16 and standard deviation 8, and draw a 
##    histogram based on this sample.
##    Repeat 6 times. Set the range of the x-axis between -10 to 40 using xlim. 
##    Fix the number of breaks to 20 using breaks
x <- c()
for (i in 1:6){
  x <- append(x, rnorm(100, mean = 16, sd=8))
}
print(length(x))
help(hist)
hist(x, breaks = 20, xlim= c(-10,40))


##  b)  What do you observe in a?
## The number of bins increased after the break argument, number of bins = breaks +1 changed from "Struges" to breaks count of 20.


###############
### Exercise 4: data exploration and  histograms
###############
## In this exercise, we will deal with data from a package.

## a) Install the package "languageR" and load it.
install.packages("languageR")
library(languageR)

## b) Specifically, we will deal with the dataset 'lexdec'. 
##    This dataset should be available to you once you've loaded languageR.
##    Find out what experiment the data comes from
languageR::lexdec
?lexdec
## Lexical decision latencies elicited from 21 subjects for 79 English concrete nouns, with variables linked to subject or word.

## c) Inspect 'lexdec'. Look at the head, tail, 
##    and summary. 
head(languageR::lexdec)
tail(languageR::lexdec)
summary(languageR::lexdec)

## d) What do head and tail show you?
## Head showed the first 6 and tail showed the last 6 data of the dataframe

## e) Look at the first 15 rows of the data.frame
head(languageR::lexdec ,15)

## f) The file contains multiple observations for each participant. Create a 
##   subset only including subject number S and assign it to S
##   How many observations are there for this participant, i.e. how many rows 
##   are in your subset?

S <- languageR::lexdec[which(languageR::lexdec$Subject == "S"),]
length(S)

## g) looking at the summary of S, what can you find out about the demographic 
##    parameters of this participant?
unique(S$NativeLanguage)

## h) Create a histogram (using hist()) of "RT" (logarithm of reaction time) 
##    for S
hist(S$RT)

## i) Create a kernel density plot for this data using density()
plot(density(S$RT))

## j) What is the difference between the two?
##Kernel density plot is smooth whereas histogram gave rigid bins.

## k) Is this data likely from a normal distribution? How would you check ?
##    (describe in words, remember to comment out text)
## No it is not normal distribution. Not a symmetric bell shaped curve.

## l) Looking at the graph, do you think the data is skewed? In which direction?
## Yes it is skewed, right skewed.

#############################################
### Exercise 5: Dataframes and boxplots
#############################################
# A researcher is interested in the way children tell stories. More specifically,
# she wants to know how often children use 'and then'. She asks 26 children to
# tell her a story, and counts the number of times they use 'and then'.
# The data follow:

# 18	15	18	19	23	17	18	24	17	14	16	16	17	21	22	18	20	21	20	20	
# 16	17	17	18	20	26

count_data <- c(18, 15,	18,	19,	23,	17,	18,	24,	17,	14,	16,	16,	17,	21,	22,	18,	20,	21,	20,	20,	16,	17,	17,	18,	20,	26)

## a) What measurement scale is this data? Is it discrete or continuous? Explain
##    in one sentence why.
##    This uses a ratio scale because true zero exists and children can create stories without usung and then. This is discrete data as the count takes specific, separate, and countable values

## b) The researcher is also interested in whether story telling is related to 
##    their reading habits. As a proxy, she asked the children, whether they have 
##    a library card. The following line codes that the first 13 observations are
##    from children with library card (Y) and the remaining 13 from children 
##    without (N). What measurements scale does this variable have?
lib = c(rep("Y",13),rep("N",13))
## This is nominal scale as it has two distinct values only, which cannot be ordered

## c) You will now create a dataframe of this data. Start by creating a vector 
##    with participant IDs. Your vector should be named 'kid', and your 
##    participants should be labeled from 1 to 26
kid <- c(1:26)

## d) Next, create a vector containing all the observations. Name this vector 'obs'.
obs <- count_data

## e) Create a dataframe including kid, obs and lib. Assign this to 'stories'. 
stories <- data.frame(kid, obs, lib)
stories
## f) Take a look at the summary of your dataframe, and at the classes of your 
##    columns. What class are the variable 'kid' and 'lib'?
class(kid)
class(lib)
## kid is integer class and lib is character

## g) Change the class of 'kid' and 'lib' to factor. Why is factor a better
##     class for these variables? (answer for both separately)
?factor
as.factor(kid)
as.factor(lib, labels= )
kid
lib
## kid is discrete observation IDs. R performs mathematical calculations like mean(kid) or sum(kid), which are statistically meaningless for unique identifiers.
## lib is a binary categorical status ("Y" vs. "N"). Factor explicitly defines fixed levels (Levels: N Y), preventing non-standard values or entries.

## h) Create a boxplot of obs for the two lib groups
?boxplot
boxplot(obs ~ lib, 
       xlab = "Library Access (lib)", 
       ylab = "Observations (obs)", 
       main = "Boxplot of obs by lib Group",
       col = c("red", "green"))
## i) Are there outliers in one of the lib groups?
## Yes there are outliers in both the lib groups which are shown by circles in the plot.

## j) Which group shows the larger interquartile range? 
## Group N shows the largest interquartile range shown by the width of the box

## k) Which one has the  greater overall range?
## Both Group Y and N has equal overall range given by: Range = Maximum - Minimum which is 10 in both case

## l) What is a whisker? Why is the upper whisker of group "Y" so short?
## A whisker is a line extending from the top or bottom of the central box to to the length of 1.5 * Inter_Quartile_Range which indicate the variability outside the upper and lower quartiles.

## m) Compare the median of group Y with the mean - which one is plotted in your
##    boxplot? Why are they different?
## Median is plotted in our boxplot at 17. Mean of the data points and is swayed by the outliers while median is not affected by outliers thus is robust.
