# Introduction 
Explore the data job market. Focusind on remote data analyst jobs, this project explores tpo-paying roles, in-demad skills and where high demand meets high salary.

🔍  **SQL queries?** check them out here: [project_sql folder](/project_sql/)
# Background
📜 This is my very first sql project, it was created with the help of Luke Barousse sql for data analytics guide.
# Tools I used
- 🛠️ **SQL** was the main tool for this project. It allowed me to perform the analysis of the database
- **PostgreSQL** the coosen database management system, ideal for handling the job posting data.
- **Visual Studio Code** My go-to for database management and executing SQL queries.
- **Chat gpt** used to make boring and repetitive work.
- **EXEL** used to define what were the most valuable skills.
- **GIT & Github** Essential for version control and sharing my SQL scripts and analysis, ensuring project tracking.
# ⚙️The Analysis
Each query for this project aimed to invistigate a specific aspect of data jobs market. Here is how I approached each question:
### 1.Top paying data Analyst jobs
```sql
SELECT 
    job_id,
    job_title,
    Job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg is not NULL
ORDER BY salary_year_avg DESC
limit 10
```
### 2.What skills do toppaying jobs require?
```sql
WITH top_paying_jobs as (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name as company_name
    FROM
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND
        salary_year_avg is not NULL
    ORDER BY salary_year_avg DESC
    limit 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
```
### 3.Demanded skills
- As well as sql, I used excel pivot table to determine top paying skill
```sql
select 
    skills,
    count(skills_job_dim.job_id) demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_work_from_home = true
GROUP BY skills
ORDER BY demand_count DESC
limit 5
```
### 4.What are the top paying skills?
```sql
select 
    skills,
    ROUND(AVG(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_work_from_home = true AND 
    salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
limit 25
```
### 5. What are the optimal skills?(Both in demand and high paying)
```sql
WITH skills_demand as (
    select 
        skills_dim.skills,
        skills_dim.skill_id,
        count(skills_job_dim.job_id) demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND 
        job_work_from_home = true AND
        salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
), average_salary AS (
    select 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg),0) as avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND 
        job_work_from_home = true AND 
        salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id
)
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
inner join average_salary on skills_demand.skill_id = average_salary.skill_id
ORDER BY 
    demand_count DESC,
    avg_salary DESC
LIMIT 25
```
# What I learned
- learned essential data nalayisis skills such as:
1) Sql syntaxis
2) Using chat gpt for repetitive tasks
3) Working on one project using different apps (Excel,Sql,etc)
# Conclusion
- The most optimal skills required to get data analyst job are:
1) 🥇 sql
2) 🥈 Excel
3) 🥉 Python
4) Tableu
5) Power Bi
