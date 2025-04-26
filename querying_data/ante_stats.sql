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

/* how many times we played and skipped within an ante */

select ante_id, 
count(1) as total_times_played,
sum(case when played = 'Yes' then 1
else 0 end) as played_blind,
sum(case when played = 'No - Skipped' then 1
else 0 end) as skipped_blind,
sum(case when played = 'No - Defeated Prior to Blind' then 1
else 0 end) as skipped_defeated,
from `played_data_views.bqv_round`
where blind_name in ('Small Blind','Big Blind')
group by all
order by ante_id;
