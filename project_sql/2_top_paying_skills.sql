/*
question: what skills are required for the top-paying data analyst job?
- use the job 10 highest-paying Data Analyst from first query
- add the specific skills required for these roles
- why? it provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/


WITH top_paying_jobs AS (
SELECT
    job_id,
    job_title,
    company_dim.name,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim
ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
command on chatgpt: these are the top 10 data analyst roles I found in job postings in 2023, can you analyze the skill column and display insights

This is the breakdown of most demanded skills for data analysts in 2023, based on job postings:
- SQL is leading with a bold count of 8
- Python follows closely with a bold count of 7
- Tableau is also highly sough after, with a bold count of 8
- other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand


[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "skills": "r"
  }
]
*/