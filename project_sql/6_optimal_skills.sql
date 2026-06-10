Answer : What are the most optimal skills to learn (aka its high demand and high paying skills) ?
- identify skills in high demand and associated  with high average salaries for data analyst roles
- concentrate on remote positions with specified salaries
- why ? targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysts

with data_analyst_skills as (
select 
    skills_job_dim.skill_id,
    count (*) as skill_count
from skills_job_dim
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
where job_title_short = 'Data Analyst' 
and job_work_from_home = true
group by skill_id
),

top_salary_skills as (
select
    SKILLS_DIM.SKILLS as skill_name,
    skills_dim.skill_id,
    ROUND (AVG (job_postings_fact.salary_year_avg), 0) AS TOTAL_SALARY
FROM JOB_POSTINGS_FACT
INNER JOIN SKILLS_JOB_DIM ON JOB_POSTINGS_FACT.JOB_ID = SKILLS_JOB_DIM.JOB_ID
INNER JOIN SKILLS_DIM ON SKILLS_JOB_DIM.SKILL_ID = SKILLS_DIM.SKILL_ID
WHERE JOB_POSTINGS_FACT.JOB_TITLE_SHORT = 'Data Analyst'
AND JOB_POSTINGS_FACT.SALARY_YEAR_AVG IS NOT NULL
AND JOB_POSTINGS_FACT.JOB_WORK_FROM_HOME = TRUE
GROUP BY skills_dim.skills, skills_dim.skill_id

)


select
    data_analyst_skills.skill_id,
    data_analyst_skills.skill_count,
    top_salary_skills.total_salary,
    top_salary_skills.skill_name
from data_analyst_skills
inner join top_salary_skills on data_analyst_skills.skill_id = top_salary_skills.skill_id
order by skill_count desc, total_salary desc
limit 25

