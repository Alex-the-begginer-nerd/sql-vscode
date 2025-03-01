CREATE TABLE required_skills as (
SELECT
    job_id,
    skills_dim.skill_id,
    skills_dim.skills
FROM
    skills_job_dim 
FULL JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
)
limit 10000
SELECT * 
FROM   
    job_posting_month_march
LIMIT 10