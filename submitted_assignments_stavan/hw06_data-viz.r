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


# 1. All of the questions in this homework use the Best in Show data set. 
#      The data is the file `dogs.rds`.
#   a. Load the data set and use R functions to inspect the number of 
#      columns, number of rows, names of columns, and column data types.
#      [code completion + comprehension]

dogs <- readRDS("~/sts115/data/dogs.rds")
str(dogs)
# We read in our dataset using readRDS. Then, using the "str" function, we notice
# there are 172 obs of 18 vars, implying there are 172 rows and 18 columns. The
# "str" function also displays the names and datatypes of the columns.

#   b. Make a scatter plot that shows the relationship between height and
#      weight. In 2-3 sentences, discuss any patterns you see in the plot.
#      [code completion + comprehension + interpretation]

library("ggplot2")
ggplot(dogs) + aes(x = height, y = weight) + geom_point()
# Taking height as our X-axis and weight as our Y-axis we plot the relationship
# between height and weight using ggplot. Upon looking at the graph, we notice
# that there is a directly proportional relationship between height and weight,
# i.e. the heavier the dog, the taller the dog

#   c. Set the color of the points in the scatter plot from part b to a single 
#      color of your choosing. (Tip: Choose a color from one of the sites 
#      shared in the lesson (e.g. https://coolors.co/palettes/trending))
#      [code completion + comprehension]

ggplot(dogs) + aes(x = height, y = weight) + geom_point(color = "#C1121F")
# Here, we set the color of the points in the scatter plot to a vibrant red from
# the website listed above. We input the color code in the "color" section of the
# geom_point() function to obtain the color of the points. 

# 2.
#   a. Make a bar plot that shows the number of dogs in each "group" of dogs.
#      [code completion + comprehension]

ggplot(dogs) + aes(x = group) + geom_bar()
# The geom_bar() function plots a bar graph based on the data. Since we have only
# fed it one column, it automatically assumes that we wish to calculate the 
# frequency of said column and it does so.

#   b. Are any groups much larger or smaller than the others? Describe what your 
#       visualization shows.
#      [interpretation]

# Although most of the data is more or less evenly distributed, non-sporting and
# toy dogs are a much smaller group compared to the other groups.

#   c. Fill in the bars based on the size of the dog, and set the position 
#       argument of the bar geometry to the one you think best communicates the 
#       data. Explain why you chose this position.
#      [code completion + comprehension + interpretation]

ggplot(dogs) + aes(x = group) + geom_bar(aes(fill = size), position = "dodge")
# Using the "aes()" function, we fill the bars based on size of the dog. I chose
# position "dodge" since it easily represents how many small, medium, and large
# dogs there are per group. 

# 3.
#   a. Which geometry function makes a histogram? Use the ggplot2 website or
#      cheat sheet to find out.
#      [code completion + comprehension]

# geom_histogram() is the function that can be used to make a histogram

#   b. Make a histogram of longevity for the dogs data. How long do most dogs
#      typically live? Explain in 1-2 sentences.
#      [code completion + comprehension + interpretation]

ggplot(dogs) + aes(x = longevity) + geom_histogram()
# Using the geom_histogram() to create a histogram based on a dog's longevity
# Based on our histogram, a majority of the longevity count is between
# 11 and 13 years

#   c. Inside the geometry function for histograms, play around with the bins
#      argument. (e.g. bins = 10, bins = 50). What do you think this is doing?
#      [code completion + comprehension]

ggplot(dogs) + aes(x = longevity) + geom_histogram(bins = 10)
ggplot(dogs) + aes(x = longevity) + geom_histogram(bins = 25)
ggplot(dogs) + aes(x = longevity) + geom_histogram(bins = 50)
#The bins argument is controlling how many intervals between plots on the 
#histogram. That is, how big is the interval included in a single plot. Using the
# bins function we can control how detailed we want our histogram to be

# 4.
#   a. Modify your plot from Question 1 so that the shape of the points is
#      determined by the "group" of the dog. [code completion + comprehension]

ggplot(dogs) + aes(x = height, y = weight, shape = group) + geom_point()

#   b. Do height and weight effectively separate the different groups of dogs?
#      In other words, are there clear boundaries between the groups in the
#      plot (as opposed to being mixed together)? Are some groups better
#      separated than others?
#      [interpretation]

# In the given scatterplot, we notice that terriers, toys, non-sporting, and hounds are
# grouped neatly while sporting and herding breeds are more scattered.

#   c. How might you improve the readability of this graph in order to visualize
#      this potential relationship more clearly?
#      [interpretation]

# Using contrasting colors instead of symbols would improve visibility and will 
# improve readability

# 5. In a paragraph, answer the following questions for the “Best in Show” 
#    visualization (https://informationisbeautiful.net/visualizations/best-in-show-whats-the-top-data-dog/) 
#    that was built using the dogs dataset.
#    a. Who do you think is the intended audience for this data visualization? 
#        How do you think that could influence data collection, metrics calculations, 
#        and graphics choices?
#       [interpretation]

# The intended audience for this graphic is potential dog parents. This would mean that 
# the data visualization would be more simple and focused on what the dogs are like 
# to live with. Data collection would involve scores on cleanliness, ease of training
# and overall cost of maintenance.


#    b. Who/what is included in this data visualization and who is left out? 
#        What do you think the impact of that decision could be on conclusions drawn
#        from viewers of the data visualization? 
#       [interpretation]

# The score is based on intelligence, costs, longevity, grooming, ailments, and appetite
# and it is plotted against overall popularity, which creates four clearly labeled quadrants.
# What is left out is how convenient they are to live with, their physical requirements like walks
# and play time, and the space a dog needs. What one could draw from this visualization is 
# that certain breeds that were thought to be popular may not be so and
# breeds that are underrated get their chance to shine


#    c. What could the potential impact of this visualization be on those 
#       who are left-out? [interpretation]

# The categories left out might impact one's decision depending on space. For example, getting an active
# dog like a German Shepherd while living in an apartment might be inconvenient while getting a Shih Tzu
# as a guard dog might not be the best fit. 

# 6. Select your favorite data visualization from https://viz.wtf/ 
# (that was not featured during class or in the reader). 
#   a. Type the direct url to the viz you selected here:

# https://viz.wtf/post/636961771319672832/a-barrel-of-oil-itself-could-make-a-better-chart

#   b. Describe in a few sentences the "data story" you think that this visualization 
#       is trying to tell.

# This data visualization is trying to show us how far a barrell of oil can take everyday vehicles.
# This visualization gives us an appreciation for modern engineering while showcasing how much oil
# the world consumes on a daily basis. It also tells the story of how much oil derived from a
# barrel of crude oil is actually useful.

#   c. In a paragraph, what makes this a "bad" visualization? Evaluate the visualization 
#       based on the visualization principles and perception rules discussed in class 
#       (i.e., Gestalt principles, plot type, accessibility, critical reading, etc.), 
#       and suggest a few changes to improve the graphic.

# I believe this visualization does not sufficiently cover how much oil one barrel contains.
# Furthermore, although giving insights into different vehicles, it does not convey a larger 
# message about how much crude oil is being used up to run these vehicles. Of course, one could
# make the calculations themselves, but having that data in front of you makes a difference. 

#   d. Describe in 1-2 sentences one thing that this visualization actually already does well.

# The visualization does a good job of showcasing how the perspective of one barrel of oil varies
# depending on the mode of transport. While it means long distance for a motorcycle, it barely accounts for
# 1km for an airplane.


# 7. Look at the plot posted with this assignment on Canvas.
#    a. Identify the marks and channels in this plot. Write them out for this answer

# The marks in the plot are the points on the graph depicting longevity vs lifetime cost. 
# It also includes the different symbols used to depict different breeds
# The channels are the X and Y axes which are used to pinpoint the location of the marks. 
# Also the color of the marks depict different dog breeds

#    b. Write the code to generate this plot. (Hint: start with identifying the 
#        variables on each axis, then think about the types of channels).

ggplot(dogs) + aes(x = longevity, y = lifetime_cost, color = group, shape = group) + geom_point()

#    c. Propose 4 improvements to the plot based on best practices.

# 1. Use higher definition symbols
# 2. Make colors more contrasting (usage of light and dark)
# 3. Remove grid lines
# 4. Add a caption and title that summarizes plotted data

#    d. Modify the code to implement at least two of those changes.
ggplot(dogs) + aes(x = longevity, y = lifetime_cost, color = group, shape = group) + 
  geom_point() + theme(panel.grid = element_blank()) + labs(caption = "This is a plot of longevity vs lifetime cost. This plot helps us find a correlation between dogs that live longer and have a higher overall cost of maintenance")

