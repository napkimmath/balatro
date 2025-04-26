/* these are some stats to look at how often we played, skipped, or didn't get to a blind because we were already defeated */

select blind_name, 
count(1) as total_times_played,
sum(case when played = 'Yes' then 1
else 0 end) as played_blind,
sum(case when played = 'No - Skipped' then 1
else 0 end) as skipped_blind,
sum(case when played = 'No - Defeated Prior to Blind' then 1
else 0 end) as skipped_defeated,
from `played_data_views.bqv_round`
group by all
;

/* shows blinds that show up together in the same run the most */
select r1.blind_name, r2.blind_name, count(*) as blind_coexist
from `played_data_views.bqv_round` r1
cross join `played_data_views.bqv_round` r2
where r1.blind_name not in ('Small Blind','Big Blind')
AND r2.blind_name not in ('Small Blind','Big Blind')
and r1.blind_name <> r2.blind_name
and r1.run_id = r2.run_id
and r1.blind_name < r2.blind_name
group by all
order by 3 desc;
