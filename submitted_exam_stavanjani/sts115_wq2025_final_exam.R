############
# BEGINNING OF EXAM
# You have read the README file, pushed the exam files up to GitHub,
# and synced your repositories.

# Good job - move on to the next question!

############
# QUESTION 1 (5 points)
# The variable `events`, defined below, contains the dates for several
# important events in the 20th century. Write code to convert these dates 
# into R `Date` objects. Then, in a few sentences explain why using a 
# standardized date format is or isn't a good idea.

events = c("Fri August-15 in 1969", "Tue Jun-6 in 1944", "Sat Jan-1 in 2000")

# Code Answer:
rDates = fast_strptime(events, "%a %B-%d in %Y")
print(rDates)

#The fast_strptime function takes a string argument and, using relevant formatting
#given by the programmer, converts string literals into Rdate format. Here, we input
#the exact format of the string with the date and use the function to read and convert
#it to rDates

# Narrative Answer:

#Using a standardized date is a great idea. Dates are a form of data, and having
#a standardized date would make the transfer or sharing of that data simpler and easier.

############
# QUESTION 2 (15 points)
# 2.1. The variable `menu`, defined below, contains a string from a local
# restaurant's online menu. Use string processing to convert this string into a
# data frame with separate columns for 'item' and 'price'. Next, combine your
# data-frame with the data frame 'guads', below. This combined data frame should 
# have a populated column called 'restaurant' so it's clear which row came from 
# Mayas (the original 'menu' data) and which came from Taqueria Guadalajaras ('guads').

# Tip! Print the variable after you instantiate it and before you try to write 
# code to answer the rest of the question. This will help you to form a better 
# strategy for splitting the string. You can also use the Regex validator at 
# https://regex101.com/ to verify that your Regex works correctly before you 
# use it in your R code.

menu = "MAYAS
Street taco ......... 3.99
Crispy taco ........... 6.99
Potato taco .......... 4.99
Veggie burrito ........ 7.49
Regular ............. 13.99
Super ............... 15.99
Chimichanga ......... 14.00
Beans, rice & cheese .... 10.99"


guads = data.frame(
  type = c("Taco de camaron", "Taco de pescado", "Taco dorado","Veggie burrito", "Regular", "Super", "Super Giant", "Chimichanga", "Beans, rice & cheese"),
  price = c(3.99, 3.99, 4.29, 9.49, 8.99, 10.99, 20.99, 11.99, 5.99)
)



# Code Answer:



# Narrative Answer:

#Using the dplyr library, we can remove the dots in the Maya's menu string.
#Then, we can use Regex to index our string into a dataframe using functions
#like str_sub. Once our dataframe is ready, we can use functions like bind_rows
#to combine the two dataframes


# 2.2. Write code to generate a single data visualization to show the price by
# item per restaurant. In a few sentences, describe how your data visualization 
# may be easier to use than looking at the online menus when you and your friends 
# are deciding where to go for lunch.

# Code Answer:

ggplot(menu) + aes(x = item, y = price, label = item) + geom_point()


# Narrative Answer:

#Usually calculating the price of a meal becomes tough since all prices are not available
#at a glance, so having a graph in front means one can not only find the total meal cost
#but also whether the restaurant as a whole is expensive or not to go to. Since a graph
#gives a pretty good idea on average price


#############
# QUESTION 3 (15 points)
# Use the Cat Facts API documentation at 
# https://alexwohlbruck.github.io/cat-facts/docs/ to make a request to 
# the Cat Facts "facts" endpoint and retrieve 5 random facts about cats. 

# Note: you must properly construct the URL for your request by adding the 
# "endpoint" for your specific request as documented on the site to the 
# "base URL for all endpoints" which is also documented on the site.  
# All of the information that you need to construct a well-formed URL for your 
# request appears somewhere in the documentation, and you should be able to do 
# this using your knowledge of how URLs are constructed.

# Code Answer:
library("httr")
library("jsonlite")

#querying the API
response <- GET("https://cat-fact.herokuapp.com/facts/random?animal_type=cat&amount=5")

#processing the response and displaying it
bdy <- content(response, "text")
bdy_json <- fromJSON(bdy)
print(bdy_json$text)

#############
# QUESTION 4 (20 points)
# Wikipedia has a table of female Nobel Laureates at: 
# https://en.wikipedia.org/wiki/List_of_female_Nobel_laureates

# Write code that scrapes the page to get a data frame with the 
# year, name, country, and category for each laureate. You DO NOT need to worry
# about cleaning up the text to remove footnotes, parenthetical notes, 
# dual countries, or dual categories for this question.


# Code Answer:
library("rvest")
library("xml2")

#read our webpage
wiki_url = "https://en.wikipedia.org/wiki/List_of_female_Nobel_laureates"
wiki_doc = read_html(wiki_url)

#find all tables in the webpage
tables = xml_find_all(wiki_doc, "//table")

#The table we want is sortable on the link, so let's extract sortable tables
tab = xml_find_all(tables, "//*[contains(@class, 'sortable')]")

#display our table
laureates = html_table(tab, fill = TRUE)
laureates = laureates[[1]]
print(laureates)

######################################
# QUESTION 5 (20 points)
# The file `nobel_laureates_messy.rds` (included in the zip file you downloaded 
# that contains this exam file) contains a data frame with information about 
# female Nobel Laureates, scraped from Wikipedia. 

# 5.1. This new data frame is terribly messy. One issue is that while each row 
# corresponds to one laureate,  the `Laureate` column sometimes contains a 
# parenthetical note in addition to the laureate's name. Separate the name of 
# each laureate from these notes, so that the name is alone in the `Laureate` 
# column, and the note is stored in a new column called `Note`.

# Make sure there are no parentheses in the text in the `Note` column. For rows
# where there is no note, the value of the note should be `NA` or the empty 
# string `""` (either is acceptable, but don't use a mix of both).  This question 
# will require you to apply various skills that we learned in this course, 
# including manipulating the columns of a data frame and using regular expressions
# to identify substrings within a string.  

# Hint: The question asks you to apply computational operations across all 
# rows/observations in the data frame.  There are several ways to apply the same 
# function to all observations in R.  Before you begin coding, think about 
# how you will accomplish this iteration.  
                                                                                                        

# Code Answer:
# Load necessary library
library(dplyr)

nobel_df = readRDS("~/sts115/submitted_exam_stavanjani/nobel_laureates_messy.rds")

#For this question, we can use the dplyr library again to identify parenthesis. 
#using parenthesis as markers we can create substrings and replace them with 
#the text of just the authors.

# 5.2. What is something else you noticed about this data frame that should be
# cleaned before it is used in an analysis?

# Narrative Answer:
#There are often more than one country names in the dataset when there are winners
#from more than one country. This could interfere when counting the number of laureates
#per country since R would take the string literal as one value.



##############
# QUESTION 6 (25 points)
# For this question you will need add the carData package to your environment.
# Next, run this code: 
demo <- carData::MplsDemo

# 6.1. In a paragraph, describe what 'demo' is about and define the variables 
# it contains. Include an explanation of how you determined your answers.

# Narrative Answer:

#The 'demo' dataset contains the demography of a city. It contains variables such as
#neighborhood, population, race, income, and college status. I found this out by using
#the 'summary' function of R as shown above


# 6.2. Investigate this dataset and provide a short answer to the questions below.

# a. How many rows and columns are in the data set?
# Narrative Answer: 

#There are 84 rows and 8 columns

# b. What are the names and classes of the columns in the data set?
# Narrative Answer: 

#neighborhood: character
#population: numeric
#white: numeric
#black: numeric
#foreignBorn: numeric
#hhIncome: numeric
#poverty: numeric
#collegeGrad: numeric

# c. How many missing values are in each column?
# Narrative Answer: 
#There are no missing values

#Upon checking for missing values, we notice that there are none. Therefore, 
#each column has no missing values

# d. How many missing values are in the data set in total?
# Narrative Answer: 
#There are no missing values


# Code Answer: Add any code here that you wrote to help you answer questions a-d above.
str(demo)
print(demo)
summary(demo)
nrow(demo)
ncol(demo)
is.na(demo)


# 6.3. Write code to help you identify any outliers in 'demo'. You can use 
# statistics or plotting to determine your answer. Return the index of any 
# outliers you discover.

# Code Answer
library(ggplot2)
ggplot(demo, aes(x = population)) + geom_boxplot()
#We can create boxplots like these for each column to find the outliers

# 6.4. Write a question to investigate using this data. Then, write code to 
# generate a data visualization that helps address your question.

# Your research question:

# "Does having a college degree impact the household income in this town?"


# Code Answer
ggplot(demo) + aes(x = collegeGrad, y = hhIncome) + geom_point()


#############
# END OF EXAM
# Save and push your exam files to GitHub.
#############

# Congratulations, you're done! We wish you a restful spring break.