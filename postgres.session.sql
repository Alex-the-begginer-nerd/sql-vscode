SELECT
    job_schedule_type,
    salary_year_avg , 
    salary_hour_avg ,
    job_posted_date::DATE 
    EXTRACT(MOUNTH FROM )
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
    OR
    salary_hour_avg IS NOT NULL
GROUP BY
    job_schedule_type,
    salary_year_avg,
    salary_hour_avg,
    job_posted_date
HAVING
    job_posted_date > 2023-01-01 00:00:00;