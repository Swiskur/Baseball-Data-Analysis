# Baseball-Data-Analysis

This project analyzes hitter performance by comparing player statistics with their expected stats.
The goal is to identify hitters that overperform and underperform based on their expected metrics and batted ball quality.

---

## Workflow
Data cleaning using Python
Database storage using PostgreSQL to create a table, multiple views, and making queries to perform analysis
Created data visualizations using Power BI

---

## Tools
Python
Pandas
PostgreSQL
SQL
Power BI
Git & Github


---

## Data Processing/Cleaning
- Cleaned and structured the raw csv file from Baseball Savant using Pandas
- I created metrics that measured:
- wOBA - xwOBA difference
- SLG - xSLG difference
- OBP - xOBP difference


---

## SQL Database

- Built a PostgreSQL database to store the cleaned dataset
- Created multiple SQL queries and views for a variety of analysis

--- 

## SQL Views:
## wOBA vs xwOBA View
-  Identifies overperforming, underperforming, and neutral hitters based on wOBA vs xwOBA difference

## Batted Ball Score View
-Created a batted ball score formula to measure player performance based on xWOBA and other batted ball metrics. 
- The batted ball score used weighted metrics to create a hitter score.
- This includes xwOBA at 45%, hard hit % at 25%, barrel rate at 20%, and exit velocity to make up the final 10%.

## Player Analysis
- The third view was created to have a full player analysis combining key metrics from the other views.

## SQL Queries
I created 10 different SQL queries that all serve a purpose of player analysis such as finding metric leaders, overperforming and underperforming players, using the created views, ranking players, etc.

---

## Power BI Data Visualization
- Developed an interactive dashboard that inclused a Scatter plot comparing wOBA vs xwOBA
- Bar charts measuring the Top 10 hitters by batted ball score, the top 10 overperforming hitters, and the top 10 underperforming hitters.
- KPI cards for key performance metrics


---

## Key insights

- The project identified players that are outperforming and underperforming their expected metrics
- It  highlights undervalued hitters that could be looked at for breakout potential.
- Demonstrates the relationship between batted ball metrics and production


---

## Future improvements
- I hope to expand the project to featuring more advanced metrics such as WAR, wRC+, as well as expanding on more seasons and adding predictive modeling.


---

## Author
Schaefer Wiskur

