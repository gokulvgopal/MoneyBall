# MoneyBall
Data Analysis Project based on the famous money-ball problem to find best three alternative players for the Oakland Athletics for the year 2002 using R language.

## Background
The Oakland Athletics' 2002 season was the team's 35th in Oakland, California. It was also the 102nd season in franchise history. The Athletics finished first in the American League West with a record of 103-59.

The Athletics' 2002 campaign ranks among the most famous in franchise history. Following the 2001 season, Oakland saw the departure of three key players (the lost boys). Billy Beane, the team's general manager, responded with a series of under-the-radar free agent signings. The new-look Athletics, despite a comparative lack of star power, surprised the baseball world by besting the 2001 team's regular season record. The team is most famous, however, for winning 20 consecutive games between August 13 and September 4, 2002.[1] The Athletics' season was the subject of Michael Lewis' 2003 book Moneyball: The Art of Winning an Unfair Game (as Lewis was given the opportunity to follow the team around throughout that season)

This project is based off the book written by Michael Lewis (later turned into a movie).

## Problem Statement
To ease the situation, we need to use data analytics to find the best three alternative players for Oakland Athletics. Although there can several combinations of best three players, certain factors to be kept in mind while we select the best three are:

    1. The total combined salary of the three players can not exceed 15 million dollars.
    2. Their combined number of At Bats (AB) needs to be equal to or greater than the lost players.
    3. Their mean OBP had to equal to or greater than the mean OBP of the lost players.
    
## Solution
This project is aimed to find one of the several combinations of players using R language. The result is going to be achieved in two ways:
    
    1. Brute Force: This method uses assumptions from player statistics to filter out inappropriate players. Then manually select three best players from the list of the top 15 alternative players.
    2. Generalized Form (in-progress): This technique will find all combinations of player staistfying the conditions and will sort the player combo in the order of performance statistics. The top three records will suggest best three combination of players that can make the team win the season.

## DataSet
There are two CSV files - Batting.csv and salary.csv taken from http://www.seanlahman.com/baseball-archive/statistics/
    
    1. Batting.csv - Contain player information, perfomance statistics across several years
    2. salary.csv - contain salary information for several years.
