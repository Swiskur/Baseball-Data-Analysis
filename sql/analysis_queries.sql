
-- Top 10 Expected Hitters based on Batted Ball Data
SELECT player_name, xwoba, sweet_spot_percent, hard_hit_percent, barrel_batted_rate
FROM player_stats
ORDER BY xwoba DESC
LIMIT 10;

--Top 10 avg exit-velocity
SELECT player_name, barrel_batted_rate, hard_hit_percent, avg_best_speed, avg_hyper_speed
FROM player_stats
ORDER BY avg_hyper_speed DESC
LIMIT 10;

-- Top 10 OBP, along with data based on plate discipline
SELECT player_name, bb_percent, k_percent, on_base_percent, xobp
FROM player_stats
ORDER BY on_base_percent DESC
LIMIT 10;

--Finding best hitters that have largest differences in real data versus expected for quality hitters
SELECT player_name, slg_percent, xslg, slg_xslg_diff, on_base_percent, xobp, obp_xobp_diff, batting_avg, xba
FROM player_stats
WHERE xwoba > 0.320
AND woba_xwoba_diff < 0
ORDER BY obp_xobp_diff ASC;

-- Selecting the hitters that have a woba better than league average among qualified hitters
SELECT player_name, woba, xwoba, avg_table.avg_woba
FROM player_stats,
	(SELECT AVG(woba) AS avg_woba
	FROM player_stats
) avg_table
WHERE woba > avg_table.avg_woba
ORDER BY woba DESC;

-- Finding Most Drastic Overperformers and Underperformers
SELECT *
FROM (
	SELECT player_name, woba, xwoba, woba_xwoba_diff, 'Overperforming' AS category
	FROM player_stats
	ORDER BY woba_xwoba_diff DESC
	LIMIT 10
) over_q

UNION ALL

SELECT *
FROM(

	SELECT player_name, woba, xwoba, woba_xwoba_diff, 'Underperforming' AS category
	FROM player_stats
	ORDER BY woba_xwoba_diff ASC
	LIMIT 10
	
) under_q;

--Calling view that shows batted_ball_data with an overall weighted batted_ball_score
SELECT * 
FROM batted_ball_data
ORDER BY batted_ball_score DESC;

--Calling a view that creates categories for 'Overperforming', 'Underperforming', & 'Neutral Performance'
SELECT * 
FROM woba_versus_expected
ORDER BY woba_xwoba_diff DESC;

--Uses Rank function to show the rankings for xwoba
SELECT player_name, xwoba, RANK() OVER(ORDER BY xwoba DESC) AS xwoba_rank
FROM player_stats;

--Selects all from master data set
Select * 
FROM player_analysis
ORDER BY batted_ball_score DESC;