/* creating a view so we can look every time to see what's changed
since our data is connected through google sheets, it'll update automatically every time we query
additionally, since we use views to query, they use the most up-to-date information as well 

this view currently looks at the most common tags that have appeared, as well as their descriptions
*/


CREATE OR REPLACE VIEW
  `napkim-math.insights_views.bqv_most_common_tags` AS (
  SELECT
    r.tag_name,
    t.tag_benefit,
    COUNT(*) AS count_of_tags
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
    3 DESC,
    1 ASC )
