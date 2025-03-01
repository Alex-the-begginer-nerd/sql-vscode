SELECT
    job_schedule_type,
    salary_year_avg , 
    salary_hour_avg ,
    job_posted_date::DATE,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
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
    job_posted_date > '2023-06-30'
