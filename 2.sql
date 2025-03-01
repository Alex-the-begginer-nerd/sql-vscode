SELECT 
    job_title_short,
    job_id,
    salary_year_avg,
    salary_hour_avg,
CASE 
    WHEN salary_hour_avg BETWEEN 10 and 12 then 'mid' 
    WHEN salary_hour_avg > 15 THEN 'high'
    when salary_year_avg BETWEEN 90000 and 100000 THEN 'mid'
    WHEN salary_year_avg > 100000 THEN 'high'
    ELSE 'low'
END AS salary_rating
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    salary_hour_avg is not NULL OR
    job_title_short = 'Data Analyst' AND
    salary_year_avg is not NULL
ORDER BY salary_hour_avg DESC ,
salary_year_avg desc