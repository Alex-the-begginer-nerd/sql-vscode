WITH company_job_count as (
SELECT 
    company_dim.company_id,
    count(*)
FROM
    company_dim
inner join job_postings_fact as job_postings on job_postings.company_id = company_dim.company_id
GROUP BY 
    company_dim.company_id
)
SELECT
    count(job_id) as number_of_jobs,
    company_id,
case
    when count(job_id) < 10 then 'small'
    when count(job_id) between 10 and 50 then 'medium'
    when count(job_id) > 50 then 'large'
    END AS company_size
FROM
    job_postings_fact as job_postings
GROUP BY 
    company_id
    ORDER BY 
    number_of_jobs
    DESC
