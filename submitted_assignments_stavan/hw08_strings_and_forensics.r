# Directions:

# This file contains homework questions for the lecture on data visualization.
# Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

library(stringr)

# Write a R code snippet that uses regular expressions to find all occurrences of 
# dates in the string variable text that are in the format "dd/mm/yyyy" and replace 
# them with the format "yyyy-mm-dd". The text variable contains multiple dates in 
# the "dd/mm/yyyy" format interspersed with other text. For example, if text is 
# "The event was held on 23/04/2021 and the next event will be on 05/10/2022.", 
# the output should be "The event was held on 2021-04-23 and the next 
# event will be on 2022-10-05.".
#
# Ensure your code dynamically handles the text variable, meaning it should work 
# for any string input following the mentioned pattern. Use relevant functions from 
# the stringr package, any other package, or base R for your solution. 
# [Code completion + comprehension]

s <- "The event was held on 23/04/2021 and the next event will be on 05/10/2022."
s <- str_replace_all(s, "(\\d{2})/(\\d{2})/(\\d{4})", "\\3-\\2-\\1")
print(s)

#The str_replace_all function analyzes the string, finds instances that match the
#parameter and replaces each instance with the replace parameter. We use the '/'
#character to separate the three segments (month, date, year). We then use the escape character \\d
#to capture integer-type text. The number signifies how many integers to capture. We then display them 
#using the escape codes for groups (group 3 = year, group 2 = date, group 1 = month) with the - separating. 
#the values. Once replaced, we display it using a print statement

# Write an R code snippet that assigns the string "I am here.  Am I alive" to
# a variable "x" and uses an Escape Sequence to put a newline between the two
# sentences. [Code completion + comprehension]

x <- "I am here.\nAm I alive"
message(x)

#\n is the escaoe sequence that creates a new line after its invocation. However, 
#this does not work with the print statement, which is why we must use the message
#statement to print our values

# Write an R code snippet that assigns the following string to the variable "y:"
#
# She said, "Hi!"
# [Code completion + comprehension]

y = "She said, \"Hi\""
message(y)

#We use the escape sequence to print quotation marks since using quotation marks directly
#would contradict our print statement. Since print will print out the slashes, we use message
#to print y

# [TEXT ANSWER] Explain what a Text Encoding is:
# [Comprehension]

#Text encoding is the mapping of characters to specific number codes to allow the computer
#to store character data in numerical form. Some popular encodings include ASCII and Unicode

# Write an R code snippet that creates a vector of all containing the words in the string, 
# "He wanted to say hello but was afraid".  Then use the stringr library to locate any 
# occurrences of the string "hello" in your vector.
# [Code completion + interpretation]

#Splitting the string into individual words
x <- "He wanted to say hello but was afraid"
result = str_split(x, " ")

#Turning resultant list into a vector
result <- unlist(result)

#counting the number of times "hello" occurs
c=0
for (word in result) {
  if(word=="hello") {
    c = c+1
  }
}

print(c)

# Section "15.7 Corpus Analytics" of the reader contains a tutorial on performing
# corpus analytics on a Document Term Matrix of 19th Century novels.  A Document Term
# Matrix is a matrix that contains information about the number of times that a work 
# appears in each text in a corpus.  In class, we calculated the word frequencies for
# the novel _Wuthering Heights_.  There "data" folder in the Files area of Canvas for 
# this course contains a file names dtm.rds which holds this type of count information
# for every normalized text in the collection of novels we worked with in class. 
# 
#     First, download that file to your course working directory.   

#reading in our rds and csv files
dtm <- readRDS("~/sts115/data/dtm.rds")
manifest <- read.csv("~/sts115/data/C19_novels_manifest.csv", row.names = 1)
cleaned_corpus <- readRDS("~/sts115/data/C19_novels_cleaned.rds")


#     Then, recreate a working version of the code in section 15.8 of the reader below.
#     Note that before you can use the code in that section you will need to read 
#     dtm.rds file into the dtm variable so that the data ih the DTM is available to
#     the rest of the code.
# [Code completion + interpretation]

#importing our libraries
library("tidyverse")
library("tm")
library("tokenizers")

#Transforming dtm into a matrix, then a dataframe
term_counts <- as.matrix(dtm)
term_counts <- data.frame(sort(colSums(term_counts), decreasing = TRUE))
term_counts <- cbind(newColName = rownames(term_counts), term_counts)
colnames(term_counts) <- c("term", "count")

#Plot the top 50 terms in the entire corpus
ggplot(term_counts[1:50, ]) +
  aes(x = fct_reorder(term, -count), y = count) +
  geom_bar(stat = "identity") +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)
  ) +
  labs(
    title = "Top 50 words in 18 Nineteenth-Century Novels",
    x = "Word",
    y = "Count"
  )

#finding tf-idf scores for dtm
dtm_tfidf <- DocumentTermMatrix(
  cleaned_corpus,
  control = list(weighting = weightTfIdf)
)
dtm_tfidf$dimnames$Docs <- manifest$title

#converting from dtm to matrix to dataframe
tfidf_counts <- as.matrix(dtm_tfidf)
tfidf_counts <- data.frame(sort(colSums(tfidf_counts), decreasing = TRUE))
tfidf_counts <- cbind(newColName = rownames(tfidf_counts), tfidf_counts)
colnames(tfidf_counts) <- c("term", "tfidf")

#plotting the top 50 tf-idf scores
ggplot(data = tfidf_counts[1:50, ]) +
  aes(x = fct_reorder(term, -tfidf), y = tfidf) +
  geom_bar(stat = "identity") +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)
  ) +
  labs(
    title = "Words with the 50-highest TF-IDF scores in 18 Nineteenth-Century Novels",
    x = "Word",
    y = "TF-IDF"
  )

#converting tfidf to a dataframe
tfidf_df <- as.matrix(dtm_tfidf)
tfidf_df <- as.data.frame(t(tfidf_df))
colnames(tfidf_df) <- manifest$title

#Words with highest tf-idf score from the book "Dracula"
ordering <- order(tfidf_df$Dracula, decreasing = TRUE)
rownames(tfidf_df[ordering[1:50], ])

#Words with highest tf-idf score from the book "Frankenstein"
ordering <- order(tfidf_df$Frankenstein, decreasing = TRUE)
rownames(tfidf_df[ordering[1:50], ])

#Words with highest tf-idf score from the book "Sense and Sensibility"
ordering <- order(tfidf_df$SenseandSensibility, decreasing = TRUE)
rownames(tfidf_df[ordering[1:50], ])