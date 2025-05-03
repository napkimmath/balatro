/* this code looks to see how many jokers you've purchased out of al hte jokers */

SELECT
  COUNT(DISTINCT(ref.joker_name)) AS total_jokers,
  COUNT(DISTINCT(joker.joker_name)) AS jokers_purchased
FROM
  `reference_tables.joker_reference` ref
LEFT JOIN
  `played_data_views.bqv_joker` joker
USING
  (joker_name)
