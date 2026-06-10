Question : what are the top paying data analyst jobs ?
- ientify the top 10 highest paying data analyst roles that are available  remotely
- focuses on job postings with specified salaries (remove nulls)
- why ? it highlight the top paying opportunities for data analysts, offering insights into employers

select 
  job_id,
  job_title_short,
  name as company_name,
  salary_year_avg,
  job_work_from_home,
  job_via
from job_postings_fact
left join company_dim 
on job_postings_fact.company_id = company_dim.company_id
where job_title_short = 'Data Analyst' 
  and salary_year_avg is not null
  and job_work_from_home = true
order by salary_year_avg desc
limit 10;