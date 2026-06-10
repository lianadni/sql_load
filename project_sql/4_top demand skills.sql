Question : What are the most in-demand skills for data analysts ?
- join job postings to inner join table similar to query 2
- identify the top 5 in- demand skills for data analyst
- focus on all job postings.
- why ? retrieves the top 5 skills with the highest demand in job market,
 providing insights into th emost valuable skills for job seekers.

with data_analyst_skills as (
select 
    skills_job_dim.skill_id,
    count (*) as skill_count
from skills_job_dim
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
where job_title_short = 'Data Analyst' 
and job_work_from_home = true
group by skill_id
)

select
    data_analyst_skills.*,
    skills_dim.skills as skill_name
from data_analyst_skills
inner join skills_dim on data_analyst_skills.skill_id = skills_dim.skill_id
order by skill_count desc
limit 5;
