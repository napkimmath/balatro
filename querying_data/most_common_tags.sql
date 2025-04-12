/* this query returns the tags that show up the most frequently */

SELECT r.tag_name, t.tag_benefit, count(*) AS count_of_tags
FROM `napkim-math.played_data.round` AS r
INNER JOIN `reference_tables.tag_reference` t
USING (tag_name)
WHERE r.blind_name is not null
AND r.tag_name is not null
GROUP BY ALL
ORDER BY 3 desc, 1 asc
