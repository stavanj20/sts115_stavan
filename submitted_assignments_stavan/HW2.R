my_data <- read.csv("~/sts115/hw02_R_intro/my_data.csv")

######################################################################
# 1. Interview 5 people from outside of STS115 and add their data to the “my_data” data 
# frame from class to create a new data frame called “our_data”. You will use this for the
# subsequent questions. (Please do not interview someone who a classmate has already
# interviewed. You can call, Zoom, etc. but you need to actually talk to other human
# beings to complete this assignment!)

interview_data <- data.frame(
response = c("Biotech", "Human Biology", "Computer Science", "Art History", "Landscape Architecture"),
major = c("BIS", "BIS", "ECS", "HIS", "LDA"),
study = c("Library 2nd Floor", "Peet's", "Kemper", "Chemistry Building", "Olson Hall"),
location = c("Thai Canteen", "My Burma", "Yang Kee Dumpling", "Cloud Forest Cafe", "G Street Wunderbar"),
pet = c("Woof", "Woof", "Woof", "Cats rule, dogs drool", "I prefer feathers or scales"),
distance.mi = c(2.5, 4, 2.5, 35, 0.5),
time.min = c(10, 17, 20, 90, 18)
)

our_data <- rbind(my_data, interview_data)

# 2. Come up with a yes/no or true/false question you’d have liked the survey to have
# asked. Make up these data for every subject in the survey, then create it as a logical
# vector and add it to the data frame.

# Question: is R fun?

our_data$RisFun <- c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE,
  TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE,
  TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE,
  TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE,
  TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE,
  FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE,
  FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE,
  TRUE)

# 3. Use a single function to return the class of each column in the data frame.

sapply(our_data, class)

# 4. Look up how to use the function `max`. Use it to calculate the longest commute
# distance and travel time.

max_distance <- max(our_data$distance.mi, na.rm = T)
max_time <- max(our_data$time.min, na.rm = T)

# 5. Calculate travel speed across subjects as miles per minute. Assign this to a new
# vector `mi.per.min` and add it to the data frame.

our_data$mi.per.min <- our_data$distance.mi / our_data$time.min

# 6. Use a function to return the total number of elements in mi.per.min.

length(our_data$mi.per.min)

# 7. Index/subset the vector `major` to get a new vector that contains the 3rd, 1st, and
# 9th elements (in that order).

major_subset <- our_data$major[c(3, 1, 9)]


# 8. R’s `[` indexing operator accepts several different types of indexes, not only positive
# whole numbers. For example, the operator accepts negative numbers as indexes. Using
# the vector `places`, try out three to five different negative indexes. Based on the results,
# what do you think the [ operator does with negative indexes?

#The '[' operator upon receiving a negative number as an index will remove that index from the resultant vector
#For example, -1 removes the first index and prints the rest, -20 removes the 20th index, and so on

# 9. Consider the R code `c(3, 3.1, “4”, -1, TRUE)`.
# a. WITHOUT running the code, what data type you think the result will have and why?

#The resultant data type would have the character datatype since R implicitly converts to the datatype
#that is higher up in the hierarchy and character is the highest in the order

# b. Now run the code to check whether your guess was correct. If it was not
# correct, explain what the actual data type is and why. If your guess was correct, write a
# new, different line of code that yields the same resulting data type.

print(class(c(3, 3.1, "4", -1, TRUE)))
print(class(c(31, FALSE, 0.48, 3.14, "U", "S", 29, TRUE)))

# 10. Run the code `“four” < “five”`. Paste the output from R into a comment and explain
# why you think it provided that result.

# [1] FALSE
# '<' is a logical operator, so it compared the two strings using the ASCII codes of the first non-common character
# Since the ASCII for 'o' is higher than that of 'i', "four" < "five" is false

# 11. There are several major mistakes in the data entered in class.
# a. Describe in complete sentences what at least 2 of the errors are. Make some
# guesses as to how those errors may have happened, and how they might affect
# analyses and/or re-use of these data.

# The first error I found is that similar responses have different names. For example, Memorial Union is written as
# either MU, mu, or the MU. Since computers are often case-sensitive, it can be tough to get a total count of the
# people who said the Memorial Union is their favorite study spot.

# The second error is that a few of the majors either have the same code. For example, Cognitive science, 
#Computer Science, and Computer Science and Engineering all have the code "ECS". This might cause issues with 
#linking the data

# b. Pretend the data frame was too big for you to view it manually. List specific
# function calls you could use in R to help you find these mistakes programmatically.

# We can find certain mistakes using the table() function to give us an overlay of the kind of data we are dealing with
# We can see here whether there's multiple entities that mean the same thing under different names as they would show up
# in the count. We can also use head() or tail() to get an idea of what our dataframe looks like