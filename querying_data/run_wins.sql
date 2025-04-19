/*this query captures how many times we played and won each deck and stake */

SELECT
  deck_name,
  stake_name,
  COUNT(1) AS times_played,
  SUM(CASE
      WHEN win IS TRUE THEN 1
      ELSE 0
  END
    ) AS wins
FROM
  `napkim-math.played_data_views.bqv_run`
GROUP BY
  ALL;
