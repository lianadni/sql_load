Answer : Waht are the top skills based on salary ?
- look at the average salary associated with each skill for Data Analyst positions
- Focuses on role with specifiied salaries, regardless of location
- why ? it revelas how differens skills impact salary levels for sata analysts and helps identifiy the most financially rewarding skills to acquire or improve

select
    SKILLS_DIM.SKILLS,
    ROUND (AVG (job_postings_fact.salary_year_avg), 0) AS TOTAL_SALARY,
    COUNT (*) AS SKILL_COUNT
FROM JOB_POSTINGS_FACT
INNER JOIN SKILLS_JOB_DIM ON JOB_POSTINGS_FACT.JOB_ID = SKILLS_JOB_DIM.JOB_ID
INNER JOIN SKILLS_DIM ON SKILLS_JOB_DIM.SKILL_ID = SKILLS_DIM.SKILL_ID
WHERE JOB_POSTINGS_FACT.JOB_TITLE_SHORT = 'Data Analyst'
AND JOB_POSTINGS_FACT.SALARY_YEAR_AVG IS NOT NULL
AND JOB_POSTINGS_FACT.JOB_WORK_FROM_HOME = TRUE
GROUP BY SKILLS_DIM.SKILLS
ORDER BY skill_count DESC
limit 25