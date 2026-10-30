# Job Market Skill-Demand Tracker

I'm a fresher looking for Data Analyst and MIS roles, and I kept wondering which tools I should learn first. So I collected 100 real job postings, put them in a MySQL database, and used SQL to find out what employers ask for most.

## What the data looks like

* **100 postings:** 71 jobs and 29 internships
* **Roles:** Data Analyst, Business Analyst, MIS Executive, MIS Analyst, Power BI Analyst, Power BI Developer, Reporting Analyst
* **Sites:** Naukri, Indeed, HireDoor, Internshala, LinkedIn, Glassdoor, Foundit
* **Posted dates:** 20 Sep 2026 to 24 Oct 2026 (89 of the 100 postings showed a date)
* **Pay:** stored as yearly rupees. For internships I used the monthly stipend x 12. 21 postings did not list any pay, so those are left blank.
* **Skills I recorded for each posting:** MS Excel, SQL, Power BI, Python, VBA, Advanced Excel

I collected everything by hand into Excel first (`data/Job\_Postings\_Final.xlsx`), then loaded it into MySQL.

## How the database is built

```
jobs        (job\_id, title, job\_type, company, city, salary\_min, salary\_max,
             duration\_months, source, posted\_date)
skills      (skill\_id, skill\_name)
job\_skills  (job\_id, skill\_id)
```

One job asks for several skills, and one skill is asked for by many jobs. So skills sit in their own table, and `job\_skills` links the two.

## The 10 queries

|#|Question|SQL idea used|
|-|-|-|
|Q1|Quick check of the data|COUNT, CASE WHEN, MIN / MAX|
|Q2|Which skills are asked for the most?|JOIN, GROUP BY, subquery for the percent|
|Q3|Which skills are asked for together?|Self-join|
|Q4|How many postings need Excel, SQL and Power BI all together?|Subquery, HAVING|
|Q5|Average yearly pay by city (jobs)|WHERE, HAVING, COALESCE, AVG|
|Q6|Share of each job title asking for SQL, Power BI, Python|CASE WHEN inside COUNT(DISTINCT)|
|Q7|Do jobs and internships ask for different skills?|JOIN, GROUP BY on two columns|
|Q8|Average pay: jobs per year, internships per month|AVG, GROUP BY|
|Q9|How are job salaries spread out?|Subquery, CASE WHEN|
|Q10|Postings that ask for SQL but not Power BI|EXISTS / NOT EXISTS|

## What I found

* **Q2:** Excel is in 76 of the 100 postings, SQL in 74, Power BI in 69, and Python in 31. VBA and Advanced Excel showed up in only one posting each, which is too few to say anything about.
* **Q4:** 40 of the 100 postings ask for Excel, SQL and Power BI together.
* **Q3:** The most common pairs are Excel + SQL (55 postings), SQL + Power BI (54), and Excel + Power BI (50).
* **Q6:** 90% of the 30 Data Analyst postings ask for SQL and 57% ask for Python. For the 15 MIS Executive postings it is 40% for SQL, and none ask for Python.
* **Q7:** Python appears in 14 of the 29 internships (48%) but only 17 of the 71 jobs (24%).
* **Q8:** Jobs that listed pay average about 3.83 lakh a year (51 postings). Internships average about 16,400 a month (28 postings).
* **Q5:** By city, the average yearly pay for jobs is Bangalore 4.54 lakh (6 postings), Gurgaon 4.24 lakh (12), Mumbai 3.96 lakh (7), Pune 3.71 lakh (4), Delhi 3.51 lakh (7), Hyderabad 3.08 lakh (3). Each city has only a few postings, so treat this as rough.
* **Q9:** Of the 51 jobs with pay, 13 are under 3 LPA, 27 are between 3 and 5 LPA, and 11 are 5 LPA or above.
* **Q10:** 20 postings ask for SQL but not Power BI.

# **Results**

Q2: **Most in-demand skills\*\*

![Q2](Query%20Result/q2\_top\_skills.png)



Q4: **Postings needing Excel, SQL and Power BI together\*\*

![Q4](Query%20Result/q4\_all\_three.png)



Q6: **Share of each job title asking for each skill\*\*

![Q6](Query%20Result/q6\_title\_skill\_share.png)

## How to run it

1. Install MySQL and MySQL Workbench.
2. Open `sql/job_market_tracker.sql` in Workbench (File > Open SQL Script).
3. Run the whole script with the lightning-bolt button. It creates the `job_tracker` database, builds the three tables, loads the 100 postings and runs the 10 queries.
4. Click through the result tabs to see the output of each query.

It works on MySQL 5.7 and 8.

## Limits of this project

* 100 postings over about five weeks is a snapshot. It does not describe the whole job market.
* I only recorded six tools, so the skill ranking compares those tools only. Tools I did not record (for example Tableau) are not in the results.
* Pay averages use only postings that listed pay, and some city groups are small.
* I collected the postings by hand, so a few small entry mistakes are possible.

## Files

```
job-market-skill-tracker/
|-- README.md
|-- sql/job\_market\_tracker.sql      tables, data and the 10 queries
|-- data/job\_postings.csv           the data, readable in the browser
|-- data/Job\_Postings\_Final.xlsx    my original Excel sheet
|-- screenshots/                    query results from MySQL Workbench
```

Ameek Singh Panesar

