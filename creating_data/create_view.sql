/* 
this creates a view from our google sheet where we have data 

NOTE: since it's stored as a view, it will be dynamic
this allows us to automatically query the most up-to-date data from our google sheet
*/

CREATE OR REPLACE VIEW
  `napkim-math.played_data.run_view` AS (
  SELECT
    *
  FROM
    `napkim-math.played_data.run`
  WHERE
    win IS NOT NULL )
