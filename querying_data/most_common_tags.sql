/* this query returns the tags that show up the most frequently

the first query just has a count by the tag name
the second joins to the tag reference table to bring back the description as well
the third checks what percent of the time I skip a blind to get a certain tag
*/

SELECT tag_name, count(*) AS count_of_tags
FROM `napkim-math.played_data_views.bqv_round`
WHERE blind_name is not null
AND tag_name is not null
GROUP BY ALL
ORDER BY 2 desc, 1 asc
;

SELECT r.tag_name, t.tag_benefit, count(*) AS count_of_tags
FROM `napkim-math.played_data_views.bqv_round` AS r
INNER JOIN `reference_tables.tag_reference` t
USING (tag_name)
WHERE r.blind_name is not null
AND r.tag_name is not null
GROUP BY ALL
ORDER BY 3 desc, 1 asc;

SELECT
  r.tag_name,
  t.tag_benefit,
  COUNT(*) AS count_of_tags,
  SUM(
  IF
    (played = 'No - Skipped',1,0)) AS count_of_tags_skipped,
  100*ROUND(SAFE_DIVIDE(SUM(
      IF
        (played = 'No - Skipped',1,0)),COUNT(*)),4) AS pct_skipped
FROM
  `napkim-math.played_data_views.bqv_round` AS r
INNER JOIN
  `reference_tables.tag_reference` t
USING
  (tag_name)
WHERE
  r.blind_name IS NOT NULL
  AND r.tag_name IS NOT NULL
GROUP BY
  ALL
ORDER BY
  5 DESC,
  1 ASC
