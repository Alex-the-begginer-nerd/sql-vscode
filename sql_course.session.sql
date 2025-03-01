CREATE TABLE first_quarter_jobs_and_corresponding_skills AS(
SELECT *
FROM
    job_and_corresponding_skill_march

UNION ALL

SELECT *
FROM
    job_and_corresponding_skill_february

UNION ALL

SELECT *
FROM
    job_and_corresponding_skill_january
)
