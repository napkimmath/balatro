/* this query gets the average score and money, per ante */

SELECT
  ante_id,
  ROUND(AVG(round_score),2) AS avg_score,
  ROUND(AVG(ending_money),2) AS avg_money
FROM
  `napkim-math.played_data_views.bqv_round`
GROUP BY
  ante_id
ORDER BY
  ante_id asc;
