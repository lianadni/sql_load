with job_postings_q1 as (
    SELECT
        salary_year_avg,
        job_id,
        extract (quarter from job_posted_date) as quarter
    from job_postings_fact
    where extract (quarter from job_posted_date) = 1  
)

select 
skills_dim.skills,
    skills_dim.type
from job_postings_q1
left join skills_job_dim on 
job_postings_q1.job_id = skills_job_dim.job_id
left join skills_dim on
skills_job_dim.skill_id = skills_dim.skill_id

UNION ALL 

select 
    skills_dim.skills,
    skills_dim.type
from job_postings_q1
join skills_job_dim on 
job_postings_q1.job_id = skills_job_dim.job_id
left join skills_dim on
skills_job_dim.skill_id = skills_dim.skill_id
where job_postings_q1.salary_year_avg > 70000;