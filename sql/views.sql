CREATE or REPLACE VIEW woba_versus_expected AS
SELECT
	player_name, woba, xwoba, woba_xwoba_diff,
	CASE
		WHEN woba_xwoba_diff > 0.015 THEN 'Overperforming'
		WHEN woba_xwoba_diff < -0.015 THEN 'Underperforming'
		ELSE 'Neutral performance'
	END AS performance
FROM player_stats;



CREATE OR REPLACE VIEW batted_ball_data AS
SELECT
	player_name, woba, xwoba, hard_hit_percent, barrel_batted_rate, avg_best_speed, avg_hyper_speed,
	(
		xwoba * 0.45
		+ (hard_hit_percent / 100.0) * 0.25
		+ (barrel_batted_rate / 100.0) * 0.2
		+ (COALESCE(avg_best_speed, 0) / 115.0) * 0.1
		
	) AS batted_ball_score
FROM player_stats;


CREATE or REPLACE VIEW player_analysis AS
SELECT
	ps.*,
	bbd.batted_ball_score,
	wve.performance
FROM player_stats ps
JOIN batted_ball_data bbd USING(player_name)
JOIN woba_versus_expected wve USING(player_name);
	