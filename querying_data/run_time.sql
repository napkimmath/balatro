/* time is a little bit more difficult to work with
we are bringing it in as a string in the format HH:MM:SS -- so 18:00:00 instead of 6:00 PM
then we have to use parse time for bigquery to read it as a time instead of a string

https://cloud.google.com/bigquery/docs/reference/standard-sql/time_functions
https://cloud.google.com/bigquery/docs/reference/standard-sql/time_functions#parse_time */

SELECT
  run_id,
  TIME_DIFF(PARSE_TIME('%H:%M:%S', end_tmst), PARSE_TIME('%H:%M:%S', start_tmst), HOUR) AS game_hours,
  TIME_DIFF(PARSE_TIME('%H:%M:%S', end_tmst), PARSE_TIME('%H:%M:%S', start_tmst), MINUTE) AS game_minutes
FROM
  `played_data_views.bqv_run`
