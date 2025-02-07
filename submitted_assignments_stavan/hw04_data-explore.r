# Directions:

# This file contains homework questions for the lecture on working with files
# and data exploration. Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. Write out the file extension and explain what it means for the following
#    files: [comprehension]
#
#       a. `myscript.py`
#       This is a relative path that simply calls myscript.py from its directory
#
#       b. `/home/arthur/images/selfie.jpg`
#       This means that selfie.jpg is in the images folder, which is in the 
#       arthur folder, which is in our home directory (root directory)
#
#       c. `~/Documents/data.csv`
#       The symbol '~' means our home directory, so this path means that data.csv
#       is in the Documents folder stored in our home directory


# 2. Which command line utility can be used to determine the type of a file? 
# [code completion]

#ls

# 3. Why is it a bad idea to explicitly call the `setwd` function within an R
#    script? [comprehension]

#setwd() sets the working directory for your R script. Therefore, calling
#setwd() in a script makes the code less portable and confusing for other
#collaborators.


# 4. List one advantage and one disadvantage for each of these formats:
# [comprehension]
#   
#     a. RDS files
#
#     b. CSV files

# a. RDS files
# Advantage: RDS reads in faster and takes up less memory
# Disadvantage: Often not tabular, making it harder for humans to read

# b. CSV files
# Advantage: Human-readable and more versatile
# Disadvantage: Only accepts two-dimensional values


# 5. Why doesn't R automatically load every installed package when it starts?
# [comprehension]

#Our computers have a limited amount of memory and storage. Since each R package
#takes up memory space, loading in all R packages would create extra stress on
#the memory and things might not run as smooth if not crash.

# 6. Load the dogs data from the `dogs.rds` file provided in lecture.

dogs = readRDS("~/sts115/best_in_show/dogs.rds")

#     a. How many missing values are in the `height` column? 
#       [code completion + comprehension]

sum(is.na(dogs$height))
# Here, the is.na() function returns a boolean output whether the column height
# has the value NA or not. The sum() function converts those boolean values to 0's
# and 1's and adds them up, resulting in the number of NA's present
#
#     b. Think of a strategy to check the number of missing values in every
#        column using no more than 3 lines of code. Hint: think about last
#        week's lecture. Explain your strategy in words. 
#       [code completion + comprehension]


table(is.na(dogs))
#The table() function returns a logical output whether a value is true or false based
#on the condition. In this case, the condition is the is.na() function, which checks
#whether a value is NA or not. Since we apply the is.na() function to our dataset,
#it checks every column and returns the number of NA values.

#
#     c. Which column has the most missing values? Try to solve this by
#        implementing your strategy from part b. If that doesn't work, you can
#        use the `summary` function to get the number of missing values in each
#        column as well as a lot of other information (we'll discuss this
#        function more next week).
#       [code completion + comprehension]

#Our strategy above checks every column, but returns NA values as a total rather 
#than a breakdown for each column, so it is not suitable to find which column 
#has the most NA values

summary(dogs)
#The summary function returns column-based statistics, including how many NA values
#a column has. Using this function, we notice that the "weight" column has the most
#NA values with 86.

# 7. Use indexing to get the subset of the dogs data which only contains large
#    dogs that are good with kids (the category `high` in the `kids` column
#    means good with kids). [code completion + comprehension]

dogs[dogs$size == "large" & dogs$kids == 'high', c("breed")]
#here, we index the rows by condition and the columns by name. Therefore, I chose
#size and kids as my columns using the '$' operator and set a boolean condition
#to accept values if the size is large and the kids rating is high. I then printed
#out the breed of the dog by selecting the column 'breed'.


# 8. With the dogs data:
#
#     a. Write the condition to test which dogs need daily grooming (the result
#        should be a logical vector). Does it contain missing values? 
#       [code completion + comprehension]

dogs$grooming == "daily"
#This line of code creates a boolean list of whether the dogs require daily grooming
#or not. It does contain missing values represented by 'NA'
#
#     b. Use the condition from part a to get the subset of all rows containing
#        dogs that need daily grooming. How many rows are there?
#       [code completion + comprehension]

groomDailySub = dogs[dogs$grooming == "daily", c("breed")]
length(groomDailySub)
#In this code, we use the condition where we pick the grooming column from the dogs
#dataset and check for values that are "daily". Then, we use the length() function to
#find the count of rows.#There are 83 rows.

#
#     c. Use the `table` function to compute the number of dogs in each
#        grooming category. You should see a different count than in part b for
#        daily grooming. What do you think is the reason for this difference?
#       [code completion + interpretation]   

table(dogs$grooming == "daily")
#Using the table function, we get a logical output of how many dogs need daily 
#grooming and how many do not. We get a different output since while the subset
#does not account for NA values and takes them in, the table function inherently
#accounts for NA values, marking them false
#
#
#     d. Enclose the condition from part a in a call to the `which` function,
#        and then use it to get the subset of all rows containing dogs that
#        need daily grooming. Now how many rows are there? Does the number of
#        rows agree with the count in part c?
#       [code completion + comprehension]

length(which(dogs$grooming == "daily"))
#By calling the which() function we find the row numbers of the dogs that need
#daily grooming. We then use the length function which outputs the size of the
#vector. It returns 23, which means there are 23 rows, therefore aligning 
#with the count in part c.


# 9. Compute a table that shows the number of dogs in each grooming category
#    versus size. Does it seem like size is related to how often dogs need to
#    be groomed? Explain your reasoning. [code completion + interpretation]

table(dogs$grooming, dogs$size)
#The table() function creates a table that displays the grooming against 
#the size of the dog (i.e. how much grooming does each size of dog need).
#Here, we see that the grooming is distributed more or less evenly across
#different sizes, therefore establishing that there is no direct correlation
#between size and grooming.

# 10. Compute the number of dogs in the `terrier` group in two different ways:
#
#     a. By making a table from the `group` column. 
#       [code completion + comprehension]

table(dogs$group == "terrier")
#Using the table() function, we get a logical output of how many values are true
#or false that the breed is a terrier. Here, we notice that there are 28 terriers.

#
#     b. By getting a subset of only terriers and counting the rows.
#       [code completion + comprehension]

terriersSub = dogs[dogs$group == "terrier", c("breed")]
length(terriersSub)
#Here, we get a subset of the breeds that classify as a terrier as per the group
#We then output the length of that subset to get the final count. We have 28 terriers
#here as well

#
#     c. Computing the table is simpler (in terms of code) and provides more
#        information. In spite of that, when would indexing (approach b) be more
#        useful? [comprehension + interpretation]

#Taking approach a is simpler to code. However, it is only useful if you are computing
#the number of values of a condition. If we wanted to know more information (say the
#breed of the terrier), it would be more convenient to do so using the subset method
#as the subset itself would return the actual values in the dataset


