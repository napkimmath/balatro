/* return everything from the run table*/
SELECT *
FROM `napkim-math.played_data_raw.run` ;

/* return everything from the run table where the win column isn't null (the rows we care about) */
SELECT *
FROM `napkim-math.played_data_raw.run` 
WHERE win is not null;

/* return everything from the run table that was in one of the first three runs */
SELECT *
FROM `napkim-math.played_data_raw.run` 
WHERE run_id <= 3;

/* return everything from the run table where we played at white stake difficulty */
SELECT *
FROM `napkim-math.played_data_raw.run` 
WHERE stake_name = 'White Stake';

/* return everything from the run table where we did NOT play at white stake difficulty */
SELECT *
FROM `napkim-math.played_data_raw.run` 
WHERE stake_name <> 'White Stake'; -- you can also use != as not equal to
