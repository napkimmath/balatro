/* how many total jokers need to be unlocked and how many we've unlocked */

WITH
  joker_unlock AS (
  SELECT
    TRIM(unnested_jokers) AS unlocked_jokers
  FROM
    `played_data_views.bqv_run`
  INNER JOIN
    UNNEST(SPLIT(joker_name_unlock,',')) AS unnested_jokers
  WHERE
    joker_name_unlock IS NOT NULL )
SELECT
  COUNT(DISTINCT(ref.joker_name)) AS total_jokers,
  COUNT(DISTINCT(joker.unlocked_jokers)) AS jokers_unlocked
FROM
  `reference_tables.joker_reference` ref
LEFT JOIN
  joker_unlock joker
ON
  ref.joker_name = joker.unlocked_jokers
WHERE
  LOWER(ref.joker_unlock) NOT LIKE '%available from start%';

/* the list of jokers that still need to be unlocked, and their lock conditions */

WITH
  joker_unlock AS (
  SELECT
    TRIM(unnested_jokers) AS unlocked_jokers
  FROM
    `played_data_views.bqv_run`
  INNER JOIN
    UNNEST(SPLIT(joker_name_unlock,',')) AS unnested_jokers
  WHERE
    joker_name_unlock IS NOT NULL )
SELECT
  ref.joker_name,
  ref.joker_unlock
FROM
  `reference_tables.joker_reference` ref
LEFT JOIN
  joker_unlock joker
ON
  ref.joker_name = joker.unlocked_jokers
WHERE
  LOWER(ref.joker_unlock) NOT LIKE '%available from start%'
  AND joker.unlocked_jokers IS null;
