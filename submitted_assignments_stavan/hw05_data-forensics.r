# Directions:

# This file contains homework questions for the lecture on data forensics
# and statistics. Questions appear as comments in the file. 

# The first four questions are narrative only, meaning you can just write an
# answer and do not need to write computer code. For other questions, please 
# see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. What is Deviation a measure of? [comprehension]

#Deviation is the measure of how far a point is from the mean

# 2. What is Standard Deviation? [comprehension]

# Approximately the average distance of a point from the mean


# 3. Load the Craigslist data and then compute:

cl_data = read.csv("~/sts115/hw05_data-forensics/cl_rentals.csv")

#     a. The number of rows and columns. [code completion + comprehension]

nrow(cl_data)
ncol(cl_data)
#The nrow() and ncol() functions return the number of rows and number of columns in
#a dataframe respectively. Therefore, we can see there are 2987 rows and 20
#columns

#     b. The names of the columns. [code completion + comprehension]

colnames(cl_data)
#The colnames() function displays the names of the columns in our dataframe

#     c. A structural summary of the data. [code completion + comprehension]

str(cl_data)
#the str() function returns a detailed structural summary of our dataframe. It
#returns the names of the columns in our dataframe along with each one's class
#and a preview of the data in each column through a few examples

#     d. A statistical summary of the data. [code completion + comprehension]

summary(cl_data)
#The summary() function on the other hand returns a statistical summary, such as
#mean values of each column, minimum value, maximum value, and much more. 

# 4. The goal of this exercise is to compute the number of missing values in
#    every column of the Craigslist data.
#
#    a. Write a function called `count_na` that accepts a vector as input and
#       returns the number of missing values in the vector. Confirm that your
#       function works by testing it on a few vectors. 
#.      [code completion + comprehension]
#

count_na <- function(x) {
  res = sum(is.na(x))
  return(res)
}

v1 = c(11, NA, 13, NA, 15)
v2 = c(NA, 32, 64, NA, NA)
v3 = c(1, 2, 3, 4,5)

print(count_na(v1))
print(count_na(v2))
print(count_na(v3))
#The is.na() function returns a boolean output whether a value is NA or not. By
#applying the sum function on is.na(), we get the total number of NA values in 
#a vector. We then return this sum as our result of the function. It works for
#the values given above. 

#    b. Test your function on the `pets` column from the Craigslist data. The
#       result should be 14. If you get an error or a different result, try
#       part a again.
#       [code completion + comprehension]

cl_pets = cl_data$pets
print(count_na(cl_pets))
#We extract the pets column from the dataframe using the '$' operator. Upon
#running it through our function, it returns 14, which is our expected result
 
#    c. Use an apply function to apply your function to all of the columns in
#       the Craigslist data set. Include the result in your answer.
#       [code completion + comprehension]

lapply(cl_data, count_na)
#The lapply() function applies a function to every column in the dataframe. Upon
#applying our count_na() function to all columns, we notice the following
#title: 0, text: 0, latitude: 0, longitude: 3, city: 952, #date_posted: 0
#date_updated: 1801, price: 35, deleted: 0, sqft: 347, bedrooms: 10
#bathrooms: 10, pets: 14, laundry: 0, parking: 0, craigslist: 0, shp_place: 24
#shp_city: 650, shp_state: 3, shp_county: 3.

#    d. Which columns have 0 missing values? [comprehension]

#According to our results, the following columns have 0 NA values
#title, text, date_posted, deleted, laundry, parking, craigslist

# 5. What time period does this data cover? Hint: convert the `date_posted`
#    column to an appropriate data type, then use the `range` function.
#    [code completion + comprehension]

dates = cl_data$date_posted
dates = as.Date(dates)
range(dates)
#This data spans from the Jan 30th, 2021 to Mar 4th, 2021. We found this by
#converting our character array to dates using the as.Date function. We then
#use the range function, which returns the min and max of a vector.


# 6. Compute the mean price for each pets category. Based on the means, are
#    apartments that allow pets typically more expensive? Explain, being
#    careful to point out any subtleties in the result.
#    [code completion + comprehension + interpretation]

#pets = cl_data$pets
#price = cl_data$price
#
#n = 1
#none_price = c()
#d = 1
#dogs_price = c()
#c = 1
#cats_price = c()
#b = 1
#both_price = c()
#
#for(i in 1:length(pets)) {
#  if(is.na(pets[i]) == FALSE & is.na(price[i] == FALSE)) {
#    if(pets[i] == "none") {
#      none_price[n] = price[i]
#      n = n + 1 } else if(pets[i] == "dogs") {
#       dogs_price[d] = price[i]
#        d = d + 1 } else if(pets[i] == "cats") {
#          cats_price[c] = price[i]
#          c = c + 1 } else if(pets[i] == "both") {
#            both_price[b] = price[i]
#            b = b + 1 }}}
#
#print("None mean:", mean(none_price))
#print("Dogs mean:", mean(dogs_price))
#print("Cats mean:", mean(cats_price))
#print("Both mean:", mean(both_price))
#
#This code is giving me unexpected NA errors, but the idea was to create a vector 
#for the prices wherever it fit the condition and compute its mean. I added it 
#in to show my logic and thinking and

# 7. The `sort` function sorts the elements of a vector. For instance, try
#    running this code:
#
x = c(4, 5, 1)
sort(x)
#    
#    Another way to sort vectors is by using the `order` function. The order
#    function returns the indices for the sorted values rather than the values
#    themselves:
#
x = c(4, 5, 1)
order(x)
#
#    These can be used to sort the vector by subsetting:
#
x[order(x)]
#    
#    The key advantage of `order` over `sort` is that it can also be used to
#    sort one vector based on another, as long as the two vectors have the same
#    length.
#    
#    Create two vectors with the same length, and use one to sort the elements
#    of the other. Explain how it (should) work.
#    [code completion + comprehension]

x = c(15, 21, 9, 12, 3, 5, 2, 17)
y = c(4, 5, 1, 3, 7, 2, 6, 8)
x[y]
#Our second vector y represents the indices of first vector x. Therefore, when
#x is arranged according to y, its respective indices are printed, that is x[4],
#x[5], x[1], and so on. 

# 8. Use the `order` function to sort the rows of the Craigslist data set
#     based on the `sqft` column. [code completion + comprehension]

#     a. Compute a data frame that contains the city, square footage, and price
#        for the 5 largest apartments. [code completion + comprehension]



#     b. Do you think any of the 5 square footage values are outliers? Explain
#        your reasoning. [interpretation]
#
#     c. Do you think any of the 5 square footage values are erroneous
#        (incorrect in the data)? [interpretation]


