CREATE table job_and_corresponding_skill_march as (
SELECT
    required_skills.job_id,
    company_id,
    job_posted_month,
    skill_id,
    skills
FROM
    job_posting_month_march
FULL JOIN required_skills ON job_posting_month_march.job_id = required_skills.job_id
)