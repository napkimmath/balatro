/* since our shop table is connected to a google sheet
the round_id column will only be populated if that row is associated with a game
so we can use that to filter our view to only the rows we care about */

CREATE OR REPLACE VIEW
  `napkim-math.played_data_views.bqv_shop` AS (
  SELECT
    *
  FROM
    `napkim-math.played_data_raw.shop`
  WHERE
    round_id IS NOT NULL )
