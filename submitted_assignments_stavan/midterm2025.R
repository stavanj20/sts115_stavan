################################################################
# This file contains questions for the midterm exam for STS115 #
# Winter Quarter, 2025.                                        #
#                                                              #
# This is exam is designed to provide you with the chance      #
# to demonstrate your understanding of both the concepts       #
# and syntax of the methods deployed by Data Scientists.       #
# As such, even if you are unable to provide working code      #
# for questions that require you to code, we encourage you     #
# to provide pseudo code and/or a textual explanation          #
# of your understanding of how one would approach the          #
# problem computationally, or even how the computer itself     #
# would approach the problem given your knowledge of how       #
# computers and programming languages work.                    #
#                                                              #
# Because problem solving is an essential part of being a      #
# Data Scientist, you are allowed to use any resources at      #
# your disposal to respond to the questions in this exam.      #
# This includes, but is not limited to, resources such as      #
# Google, Stack Overflow, the Course Reader, etc.              #
# The only restriction is that you may not use live chat,      # 
# messaging, email, discourse, Slack, or any other method of   # 
# real-time communication with another member of the course    #
# or any other person to formulate your response.              #
#                                                              #
# Questions appear as comments in this file.  As with the      #
# homework assignments, place your answers to each question    #
# immediately following the question prompt. Some questions    #
# require you to write computer code (R or Shell Script) as    #
# an answer and other questions ask you to provide text only   #
# explanations of computing and Data Science concepts.         #
# The phrase "[Text Answer]" appears immediately following     #
# each question that requires a text only answer. As noted     #
# above, you are encouraged to include text explanation of     #
# your code answers in all cases to increase your chances      #
# of earning partial credit for a question in the event that   #
# your code solution is incorrect.                             #
#                                                              #
# The exam duration is 1.5 hours.                              #                                                             #                                                              #
# Submit your completed exam and generated files via Github    #
# using the same workflow that you have used to submit your    #
# class homework.                                              #
################################################################


# Question 1. What is the command line symbol that provides 
# a shortcut to your "home" directory on your system.  For 
# example, what symbol would you use in place of "x" in the 
# command "cd x" if you wanted to use the cd command to move 
# into your home directory:

# The '~' symbol represents the home directory


# Question 2. Write R code to assign the value 7 to a variable "x":

x <- 7


# Question 3. Write R code that subtracts 3 from the variable "x" 
# and assigns the results to a variable "y":

y <- x - 3


# Question 4. Assign the values 1, 23, 6, 2, 19, 7 to a vector:

z = c(1, 23, 6, 2, 19, 7)


# Question 5. Run the code `“four” < “five”`. Paste the output 
# from R into a comment and explain why you think it provided 
# that result: [Text Answer]

"four" < "five"

# [1] FALSE
# When provided with two character literals, the "<" logical operator cannot
# process their data type. Therefore, it takes the ASCII value of each character
# and compares the two strings. Here, for the first letter, "f" = "f", so the 
# operator moves to the next character. Since the ASCII of "i" < "o", the statement
# is false, hence the output

# Question 6. Write a for loop that loops through each element in
# the vector you created in your answer to Question 4 and prints
# each value to screen:

for(i in 1:6) {
  print(z[i]) 
  }


# Question 7. Assign the value 3 to a variable "x" and write
# a conditional statement that tests whether x is less than 5.  
# If it is, print "Yay!" to screen:

x <- 3

if(x <= 5) {
  print("Yay!") }
  


# Question 8. Download the "wine_enthusiast_rankings.csv" file from
# the "data" directory in the "Files" area of the course Canvas
# website and then write code to load it into a variable called "wine_revs":

wine_revs <- read.csv("~/sts115/data/wine_enthusiast_rankings.csv")


# Question 9.  Write code to determine the class of the "wine_revs"
# data object you created in Question 8 above:

class(wine_revs)


# Question 10. Write code that returns the column/variable
# names of the "wine_revs" object:

str(wine_revs)


# Question 11. Write code to load all observations from the
# "price" column/variable of the "wine_revs" object into
# a vector called "wine_prices":

wine_prices <- wine_revs$price


# Question 12. Subset the "wine_revs" object to create a new 
# data.frame named "wine_revs_truncated" that contains all 
# observations for only the numeric ID, Points, Price, Variety, 
# and Winery columns/variables in "wine_revs": 

wine_revs_truncated = wine_revs[c("X", "points", "price", "variety", "winery")]


# Question 13. Save the "wine_revs_truncated" that you created 
# in Question 12 to your course working  directory 
# as an RDS file named "wine_revs_truncated.rds":

save(wine_revs_truncated, file = "wine_revs_truncated.RDS")


# Question 14. Below is an R function that receives a single 
# argument (an integer) and returns the square root of that
# argument.  Write code (below the function) that calls the 
# function sending it the value 144 as its argument and assigns
# the returned result to a variable "z".  Note:  Be sure to run
# code of the function to load it into your environment before
# you try to call it in your answer or you won't be able to test
# your answer.

getSqrt <- function(argument_1) {
  retval <- sqrt(argument_1) 
  return(retval)
}

z <- getSqrt(144)


# Question 15. Write code that you would use to install the "fortunes"
# package onto your local machine and then load it into the working
# R environment:

install.packages("fortunes")

library("fortunes")

# Question 16. Why doesn't R automatically load every installed package when 
# it starts: [Text Answer]

# There are a lot of packages in R, and each one has its own memory requirements.
# Therefore, if all R packages were to automatically load, it would take a toll
# on the computer's memory, making it slow and/or causing it to crash. To prevent
# this from happening, the user loads the packages as they deem necessary


# Question 17. What command(s) create a repository and put that
# directory under git control:

# git add and git commit are used to put a file under version control


# Question 18. List an advantage and a disadvantage for each of the
# following data file formats: [Text Answer]
#   
#     a. RDS files
#
#     Advantage: RDS files can store non-tabular data and are easier to back up
#     Disadvantage: RDS is R-native and doesn't translate over well to other tools

#     b. CSV files
#     Advantage: CSV files are easily readable and highly accessible
#     Disadvantage: CSV files can read very few data types, making data interpretation harder




# Question 19. Discuss what statisticians mean when they talk about
# finding the "center" of a data set: [Text Answer]

# When statisticians talk about finding the "center" of a dataset, they
# talk about finding the mean of that dataset. The mean is the central value
# in the data taken by adding up all the values and dividing it by the total
# number of values. 



# Question 20.  Explore the "wine_revs" data object that you created in 
# Question 8 above and calculate some summary statistics. Include in your 
# answer the code that you used to generate the statistics and outputs,
# a text explanation of the statistics you generated, and an interpretation
# of what those statistics mean.
#
# [Code Answer]

summary(wine_revs)

# [Text Answer]
#
# For the numeric classes here are the descriptions: 
# Min: The lowest data point in the column
# Max: The highest data point in the column
# Median: The central value of the sorted column (also the 2nd Quartile)
# Mean: The average of all values in the column
# 1st Quartile: The value that represents the 25th percentile of the sorted data in the column
# 3rd Quartile: The value that represents the 75th percentile of the sorted sdata in the column
# NA's: Number of NA values in the column
#
# Per-column analysis
#
# X:
# Median = Mean
# This indicates that X simply contains numbers from 0 - max
#
# Points: 
# Points are between 80 and 100
# Mean is 88.45, median is 88.00. Since both are close there are almost no outliers
# 75% of values are less than 91
#
# Price:
# Min is 4, Max is 3300
# 3rd Quartile is 42, meaning 75% of the values are less than 42
# Has the most NA values with 8996