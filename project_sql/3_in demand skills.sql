Find the count of the number if remote job postings per skill
- display the top 5 skills by their demand in remot jobs 
- include skill id, name and count of postings required the skill

with remote_job_skills as (
select
    skill_id,
    count(*) as skill_count
from skills_job_dim
inner join job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
where job_work_from_home = true 
and job_title_short = 'Data Analyst'
group by skill_id

)

select 
    remote_job_skills.skill_id,
    skills_dim.skills as skill_name,
    remote_job_skills.skill_count
from skills_dim
inner join remote_job_skills on skills_dim.skill_id = remote_job_skills.skill_id
order by skill_count desc
limit 5;
