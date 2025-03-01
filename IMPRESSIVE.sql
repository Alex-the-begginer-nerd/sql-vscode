CREATE TABLE job_posting_month_march as ( 
select 
    job_id,
    company_id,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month
FROM
    march_jobs
)
limit 10