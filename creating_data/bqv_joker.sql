/* since our joker table is connected to a google sheet
the joker_first_available_id column will only be populated if that row is associated with a game
so we can use that to filter our view to only the rows we care about */

CREATE OR REPLACE VIEW
  `napkim-math.played_data_views.bqv_joker` AS (
  SELECT
    *
  FROM
    `napkim-math.played_data_raw.joker`
  WHERE
    joker_first_available_id IS NOT NULL )
