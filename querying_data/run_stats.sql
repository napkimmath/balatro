/* this query gets averages for run stats, such as cards played and rerolls */

SELECT
  round(AVG(cards_played),2) AS avg_cards,
  round(AVG(cards_discarded),2) AS avg_discards,
  round(AVG(cards_purchased),2) AS avg_purchased,
  round(AVG(times_rerolled),2) AS avg_rerolls,
  round(AVG(new_discoveries),2) AS avg_new_discoveries
FROM
  `napkim-math.played_data_views.bqv_run`;
