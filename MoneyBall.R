# In year 2001, three significant players left the team: 'giambja01', 'damonjo01', 'saenzol01'
# Our objective is to find the best three alternative players that satisfy the following condition that are required to win the game:
# 1. The total combined salary of the three players can not exceed 15 million dollars.
# 2. Their combined number of At Bats (AB) needs to be equal to or greater than the lost players.
# 3. Their mean OBP had to equal to or greater than the mean OBP of the lost players.


# Loading Libraries
library(ggplot2)
library(dplyr)

# loading data sets 
# batting.csv contains the player information
# salaries.csv contains the salary information of each player
# both these data sets contain information on several players for several years
batting <- read.csv('Batting.csv')
salary <- read.csv('Salaries.csv')

# EDA
# Visualizing the sample data and structure of the batting data
print(head(batting))
print(str(batting))

# For selecting the best players we need three performance measure parameters: Batting Average, On Base Percentage, Sluggin Percentage
# Their formulas are available in the following links:
# 1. Batting Average: https://en.wikipedia.org/wiki/Batting_average
# 2. On Base Percentage: http://en.wikipedia.org/wiki/On-base_percentage
# 3. Slugging Percentage: http://en.wikipedia.org/wiki/Slugging_percentage

batting$BA <- batting$H / batting$AB
batting$OBP = (batting$H+batting$BB+batting$HBP)/(batting$AB+batting$BB+batting$HBP+batting$SF)
batting['X1B'] = batting['H']-batting['X2B']-batting['X3B']-batting['HR']
batting$SLG = (batting$X1B + 2*batting$X2B + 3*batting$X3B + 4*batting$HR)/batting$AB

# Visualizing the structure of the batting data with newly added columns
print(str(batting))
# Checking the summary of the salary data set
print(summary(salary))

# Since salary has data since year 1985, we have to filter out older records from batting data set.
batting <- subset(batting, yearID > 1985)

# Combining both the data set based on player id & year id and printing summary of new data frame
combo <- merge(batting, salary, by=c('playerID','yearID'))
print(summary(combo))

# Making a dataframe of the players who left the team to find out the mean OBP, salary, total AB from year 2001.
lost_players = subset(combo, playerID %in% c('giambja01', 'damonjo01', 'saenzol01'))
lost_players = subset(lost_players, yearID == '2001')
lost_players = subset(lost_players, select = c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB'))
mean.lost.player <- round(mean(lost_players$OBP), digits = 3)
ab.lost.player <- sum(lost_players$AB)
money <- 15000000
print(paste(mean.lost.player, ab.lost.player , money))

# Since max bugest is 15M, selecting a player with more than that is not impossible. Filtering out such players.
combo = subset(combo, salary < 15000000)

# Brutal Method
# Assuming that minimum OBP of each alternative OBP should be greater than 0
# Salary can not be more than 8M and AB has to be greater than 1st quadrant
best.alt.player <- filter(combo, salary < 8000000, OBP > 0, AB > 179, AB <=716, yearID == '2001')
# Select top 15 players who statisty above condition
best.three.player <- head(arrange(select(best.alt.player,playerID, salary, OBP, AB), desc(OBP)), n=15)
print(best.three.player)

#best three players - one possible combination
print(best.three.player[2:4,])

