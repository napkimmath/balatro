/* since our round table is connected to a google sheet
the blind_name column will only be populated if that row is associated with a game
so we can use that to filter our view to only the rows we care about */

CREATE OR REPLACE VIEW
  `napkim-math.played_data_views.bqv_round` AS (
  SELECT
    *
  FROM
    `napkim-math.played_data_raw.round`
  WHERE
    blind_name IS NOT NULL )
