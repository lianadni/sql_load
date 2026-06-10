what skills are required for the top-paying data analyst jobs ?
- use the top 10 highest-paying data analayst jobs from first query
- add the specific skills required for these roles
- why ? it provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries

with top_jobs as (
  select 
  job_id,
  job_title_short,
  name as company_name,
  salary_year_avg
from job_postings_fact
left join company_dim 
on job_postings_fact.company_id = company_dim.company_id
where job_title_short = 'Data Analyst' 
  and salary_year_avg is not null
  and job_work_from_home = true
order by salary_year_avg desc
limit 10
)

select 
  top_jobs.*,
  skills_dim.skills
from top_jobs
inner join skills_job_dim on top_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order by top_jobs.salary_year_avg desc
;


select
  top_jobs.job_id,
  top_jobs.job_title_short,
  top_jobs.company_name,
  top_jobs.salary_year_avg,
  top_skills.skills
from top_jobs
left join top_skills on top_jobs.job_id = top_skills.job_id;



select * FROM TOP_SKILLS
where salary_year_avg is not null
order by salary_year_avg desc;

select 
    job_id,
    job_title_short,
    name as company_name,
    salary_year_avg,
    job_work_from_home,
    job_via
from job_postings_fact 