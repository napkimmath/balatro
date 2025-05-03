/* this code looks for how many times you've played wheel of fortune,
how many times you've been successful,
and the rate of success*/

SELECT
  COUNT(DISTINCT(run_consumable_id)) AS wheel_of_fortune_tries,
  COUNT(DISTINCT(
    IF
      (type_of_affected_card = 'Joker',run_consumable_id,NULL))) AS wheel_of_fortune_success,
  ROUND(
  SAFE_DIVIDE(COUNT(DISTINCT(
      IF
        (type_of_affected_card = 'Joker',run_consumable_id,NULL))), COUNT(DISTINCT(run_consumable_id))),4) AS wheel_of_fortune_success_pct
FROM
  `played_data_views.bqv_consumable`
WHERE
  LOWER(consumable_name) LIKE '%wheel of fortune%'
