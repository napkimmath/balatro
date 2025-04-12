/* 
this creates a table from our google sheet where we have data 

NOTE: since it's stored as a table, it will be static, not dynamic. 
for dynamic data, create a view
*/

CREATE OR REPLACE TABLE
  `napkim-math.played_data.run_table` AS (
  SELECT
    *
  FROM
    `napkim-math.played_data.run`
  WHERE
    win IS NOT NULL )
