/* since our playing_card table is connected to a google sheet
the card_first_available_id column will only be populated if that row is associated with a game
so we can use that to filter our view to only the rows we care about */

CREATE OR REPLACE VIEW
  `napkim-math.played_data_views.bqv_playing_card` AS (
  SELECT
    *
  FROM
    `napkim-math.played_data_raw.playing_card`
  WHERE
    card_first_available_id IS NOT NULL )
