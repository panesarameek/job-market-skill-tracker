-- =========================================================
-- Job Market Skill-Demand Tracker
-- Ameek Singh Panesar
--
-- I wanted to know which tools entry-level Data Analyst, Business Analyst
-- and MIS jobs ask for, so I collected 100 postings (Sep-Oct 2026)
-- from job sites and stored them in MySQL.
--
-- How to run: open this file in MySQL Workbench and run the whole script.
-- It builds the tables, loads the data and runs the 10 queries at the bottom.
-- =========================================================

CREATE DATABASE IF NOT EXISTS job_tracker;
USE job_tracker;

-- start fresh so the script can be run again
DROP TABLE IF EXISTS job_skills;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS jobs;


-- ---------------------------------------------------------
-- TABLES
-- One job asks for many skills and one skill is asked for by many jobs,
-- so skills live in their own table and job_skills links the two.
-- ---------------------------------------------------------

CREATE TABLE jobs (
    job_id           INT PRIMARY KEY,
    title            VARCHAR(100),
    job_type         VARCHAR(20),     -- 'Job' or 'Internship'
    company          VARCHAR(150),
    city             VARCHAR(50),     -- blank if the posting gave no city
    salary_min       INT,             -- yearly rupees (internship = stipend x 12)
    salary_max       INT,
    duration_months  INT,             -- internships only
    source           VARCHAR(50),     -- site the posting was found on
    posted_date      DATE
);

CREATE TABLE skills (
    skill_id    INT PRIMARY KEY,
    skill_name  VARCHAR(50) UNIQUE
);

CREATE TABLE job_skills (
    job_id    INT,
    skill_id  INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);


-- ---------------------------------------------------------
-- DATA
-- Postings collected by hand into Excel (data/Job_Postings_Final.xlsx)
-- ---------------------------------------------------------

INSERT INTO jobs (job_id, title, job_type, company, city, salary_min, salary_max, duration_months, source, posted_date) VALUES
(1, 'Reporting Analyst', 'Job', 'American Express', 'Gurgaon', NULL, NULL, NULL, 'Foundit', NULL),
(2, 'Data Analyst', 'Job', 'Happy Square Outsourcing Services', 'Mumbai', 300000, 400000, NULL, 'Naukri', '2026-10-06'),
(3, 'Data Analyst', 'Job', 'Wipro Ltd.', 'Gurgaon', NULL, 400000, NULL, 'Indeed', '2026-09-21'),
(4, 'Business Analyst', 'Job', 'Blue Nector', 'Gurgaon', 300000, 420000, NULL, 'Internshala', '2026-10-05'),
(5, 'Data Analyst', 'Job', 'Agrim', 'Gurgaon', NULL, NULL, NULL, 'LinkedIn', '2026-10-04'),
(6, 'MIS Executive', 'Job', 'Aditya Birla Group', 'Bangalore', NULL, NULL, NULL, 'Indeed', '2026-09-28'),
(7, 'Reporting Analyst', 'Job', 'Cognizant', 'Hyderabad', 200000, 250000, NULL, 'Naukri', '2026-09-25'),
(8, 'Power BI Analyst', 'Job', 'Wyzmindz Solution', 'Bangalore', 250000, 300000, NULL, 'Naukri', '2026-10-01'),
(9, 'Power BI Analyst', 'Internship', 'SelfCode Academy', 'Lucknow', 180000, 240000, 1, 'Internshala', '2026-09-21'),
(10, 'MIS Executive', 'Job', 'Mounee Consulting Services Pvt Ltd', 'Gurgaon', 300000, NULL, NULL, 'Foundit', NULL),
(11, 'MIS Executive', 'Internship', 'SKB Exports', 'Kolkata', 60000, 84000, 2, 'Internshala', '2026-09-25'),
(12, 'Power BI Analyst', 'Job', 'McCormick & Company', 'Gurgaon', NULL, NULL, NULL, 'LinkedIn', '2026-10-08'),
(13, 'Data Analyst', 'Internship', 'Optimspace.in', 'Remote', 90000, 180000, 3, 'Indeed', '2026-09-30'),
(14, 'Business Analyst', 'Internship', 'Optimspace.in', 'Remote', 90000, 180000, 3, 'Indeed', '2026-09-30'),
(15, 'Reporting Analyst', 'Job', 'Invesco', 'Hyderabad', NULL, NULL, NULL, 'Naukri', '2026-09-20'),
(16, 'Power BI Analyst', 'Job', 'Macquarie Group', 'Hyderabad', NULL, NULL, NULL, 'Foundit', '2026-10-06'),
(17, 'MIS Executive', 'Job', 'Human Loops', 'Nagpur', 360000, 480000, NULL, 'Foundit', '2026-09-30'),
(18, 'Business Analyst', 'Internship', 'Innovation Technology', 'Jaipur', 60000, NULL, NULL, 'Indeed', '2026-10-04'),
(19, 'Data Analyst', 'Internship', 'Shanthi IT Solution', 'Chennai', 60000, 84000, NULL, 'Indeed', '2026-10-08'),
(20, 'Power BI Analyst', 'Job', 'Pyramid Global Technologies', 'Mohali', NULL, NULL, NULL, 'Indeed', '2026-10-05'),
(21, 'MIS Executive', 'Job', 'Tirupati Trading Co.', 'Siliguri', 180000, 300000, NULL, 'Indeed', NULL),
(22, 'Data Analyst', 'Job', 'Madrid Software Solution', 'Delhi', 300000, 420000, NULL, 'Glassdoor', '2026-10-09'),
(23, 'Data Analyst', 'Job', 'Swiggy', 'Gurgaon', 300000, 500000, NULL, 'Naukri', '2026-09-30'),
(24, 'Reporting Analyst', 'Job', 'Axis Bank', 'Mumbai', NULL, NULL, NULL, 'Naukri', NULL),
(25, 'Business Analyst', 'Internship', 'Envision Next LLP', 'Mumbai', 108000, 120000, 6, 'Internshala', '2026-10-18'),
(26, 'MIS Executive', 'Job', 'Talent Futures Services', 'Delhi', 216000, 300000, NULL, 'Glassdoor', '2026-10-21'),
(27, 'Data Analyst', 'Internship', 'EvoNexis', 'Remote', 180000, 300000, 3, 'Internshala', '2026-10-21'),
(28, 'Business Analyst', 'Job', 'FabHotels', 'Gurgaon', NULL, NULL, NULL, 'Indeed', '2026-09-30'),
(29, 'Power BI Analyst', 'Job', 'Impelsys', 'Bangalore', 700000, 900000, NULL, 'Glassdoor', '2026-10-14'),
(30, 'Data Analyst', 'Job', 'Aizin Learning Hub', 'Wayanad', 180000, 240000, NULL, 'Indeed', '2026-10-08'),
(31, 'Data Analyst', 'Internship', 'CareerNest', 'Remote', 180000, 240000, 1, 'Internshala', '2026-09-25'),
(32, 'MIS Analyst', 'Job', 'Scoutit', 'Delhi', NULL, NULL, NULL, 'LinkedIn', '2026-10-10'),
(33, 'Business Analyst', 'Job', 'Trusted Media Brands', 'Gurgaon', NULL, NULL, NULL, 'LinkedIn', '2026-10-07'),
(34, 'Data Analyst', 'Internship', 'Midbrains Technologies', 'Pune', 60000, 120000, NULL, 'Indeed', NULL),
(35, 'MIS Executive', 'Job', 'AM Insights', 'Gurgaon', 175000, 225000, NULL, 'Naukri', '2026-10-04'),
(36, 'MIS Executive', 'Job', 'Capital Placement Services', 'Gurgaon', 200000, 300000, NULL, 'Naukri', '2026-10-09'),
(37, 'Data Analyst', 'Job', 'ZipyPost', 'Gurgaon', 480000, 840000, NULL, 'HireDoor', '2026-09-30'),
(38, 'Business Analyst', 'Job', 'Oolka AI', 'Bangalore', 420000, 600000, NULL, 'HireDoor', '2026-10-09'),
(39, 'Power BI Developer', 'Job', 'Ample Softech System', 'Mumbai', 350000, 850000, NULL, 'Naukri', '2026-09-25'),
(40, 'MIS Analyst', 'Job', 'Aaditas HR Advisory', 'Mumbai', 300000, 400000, NULL, 'Naukri', '2026-10-08'),
(41, 'MIS Analyst', 'Job', 'Pineswift Technologies', 'Gurgaon', NULL, NULL, NULL, 'LinkedIn', '2026-10-01'),
(42, 'Power BI Developer', 'Job', 'Kiara Infotech', 'Noida', 500000, 700000, NULL, 'Glassdoor', '2026-10-10'),
(43, 'Power BI Analyst', 'Job', 'Episeio Business Solution', 'Bangalore', 150000, 250000, NULL, 'Indeed', NULL),
(44, 'MIS Analyst', 'Job', 'PCS Technology Ltd', 'Pune', 133764, 380964, NULL, 'Indeed', '2026-10-08'),
(45, 'Business Analyst', 'Internship', 'WeCredit', 'Delhi', 264000, NULL, NULL, 'HireDoor', '2026-09-29'),
(46, 'Business Analyst', 'Job', 'Tata 1Mg', 'Gurgaon', 480000, 840000, NULL, 'HireDoor', '2026-09-30'),
(47, 'Business Analyst', 'Internship', 'Accusoil Agri Technologies Pvt Ltd', 'Jaipur', 60000, 120000, 6, 'Indeed', NULL),
(48, 'Power BI Developer', 'Job', 'Vertoz', 'Mumbai', 400000, 700000, NULL, 'HireDoor', '2026-10-06'),
(49, 'Power BI Developer', 'Job', 'AR Xtlabs', 'Hyderabad', NULL, NULL, NULL, 'Naukri', '2026-10-08'),
(50, 'Data Analyst', 'Internship', 'Apport Software Solutions Pvt Ltd', 'Mumbai', 84000, 120000, 6, 'Internshala', '2026-10-05'),
(51, 'Data Analyst', 'Job', 'StarMaxx', 'Jaipur', 360000, 420000, NULL, 'HireDoor', '2026-09-30'),
(52, 'Business Analyst', 'Job', 'IndiaMART', 'Delhi', NULL, NULL, NULL, 'Naukri', '2026-10-01'),
(53, 'Data Analyst', 'Internship', 'Fin Maverick', 'Remote', 360000, NULL, 3, 'Internshala', '2026-10-15'),
(54, 'Data Analyst', 'Job', 'JASP Labs', 'Visakhapatnam', NULL, NULL, NULL, 'Indeed', NULL),
(55, 'Power BI Developer', 'Job', 'LeadSquared', 'Bangalore', NULL, NULL, NULL, 'Foundit', NULL),
(56, 'MIS Executive', 'Job', 'Incanus Technologies', 'Bangalore', 300000, 500000, NULL, 'Naukri', '2026-10-12'),
(57, 'Data Analyst', 'Internship', 'Talent Corner HR Services', 'Mumbai', 60000, NULL, 3, 'Internshala', '2026-10-09'),
(58, 'Power BI Developer', 'Job', 'Muller''s Solutions', 'Delhi', NULL, NULL, NULL, 'Foundit', NULL),
(59, 'MIS Executive', 'Job', 'Lactalis India', 'Mumbai', NULL, NULL, NULL, 'LinkedIn', '2026-10-02'),
(60, 'MIS Executive', 'Job', 'Moneyview', 'Delhi', 300000, 500000, NULL, 'Glassdoor', '2026-10-15'),
(61, 'Data Analyst', 'Job', 'Hostinger Internationals', 'Delhi', 300000, 375000, NULL, 'Glassdoor', '2026-10-12'),
(62, 'Reporting Analyst', 'Job', 'Intouch CS', 'Hyderabad', 200000, 500000, NULL, 'Naukri', '2026-10-15'),
(63, 'MIS Analyst', 'Job', 'Microland', 'Mumbai', 300000, 500000, NULL, 'Naukri', '2026-10-13'),
(64, 'MIS Analyst', 'Job', 'Delta 360 Services', 'Pune', 250000, 400000, NULL, 'Naukri', '2026-10-14'),
(65, 'Business Analyst', 'Internship', 'Cars24', 'Gurgaon', 480000, NULL, 6, 'HireDoor', '2026-10-04'),
(66, 'Business Analyst', 'Job', 'Kadel Labs', 'Bhopal', 240000, 360000, NULL, 'HireDoor', '2026-10-02'),
(67, 'Data Analyst', 'Internship', 'Red Balloon Aerospace', NULL, 300000, NULL, NULL, 'HireDoor', '2026-10-19'),
(68, 'Power BI Analyst', 'Job', 'Quantum Learnings', 'Mumbai', 250000, 500000, NULL, 'Naukri', '2026-10-08'),
(69, 'Data Analyst', 'Job', 'Nova Technologies', 'Gurgaon', 475000, 650000, NULL, 'Naukri', '2026-10-20'),
(70, 'MIS Analyst', 'Internship', 'Vecmocon Technologies', 'Gurgaon', NULL, NULL, 6, 'LinkedIn', '2026-10-10'),
(71, 'Data Analyst', 'Internship', 'Qubixo', 'Remote', 120000, 240000, 3, 'Internshala', '2026-10-18'),
(72, 'Reporting Analyst', 'Job', 'IntouchCX', 'Hyderabad', 200000, 500000, NULL, 'Naukri', '2026-10-16'),
(73, 'Data Analyst', 'Internship', 'FirstClub', 'Bangalore', 420000, 480000, NULL, 'HireDoor', '2026-10-08'),
(74, 'Business Analyst', 'Internship', 'Openhouse', 'Gurgaon', 300000, 360000, 6, 'Internshala', '2026-10-20'),
(75, 'Data Analyst', 'Internship', 'Backdropsource', 'Noida', 84000, 120000, 6, 'Glassdoor', '2026-10-02'),
(76, 'MIS Analyst', 'Job', 'Ambrane India', 'Delhi', 200000, 325000, NULL, 'Naukri', '2026-10-15'),
(77, 'MIS Executive', 'Job', 'Sleepy Owl Coffee Ltd', 'Delhi', 420000, 660000, NULL, 'Indeed', '2026-10-20'),
(78, 'Data Analyst', 'Job', 'IMPOS Global', 'Pune', 360000, 540000, NULL, 'HireDoor', '2026-09-21'),
(79, 'Business Analyst', 'Internship', 'Digihaat', 'Delhi', 300000, NULL, NULL, 'HireDoor', '2026-10-20'),
(80, 'Power BI Developer', 'Job', 'Dsoft Infotech', 'Ahmedabad', 300000, 350000, NULL, 'Naukri', '2026-10-16'),
(81, 'MIS Executive', 'Job', 'Zollowup Services Pvt Ltd', 'Delhi', 240000, 360000, NULL, 'Indeed', NULL),
(82, 'Data Analyst', 'Internship', 'Skillzenloop', 'Remote', 180000, 192000, 3, 'LinkedIn', '2026-10-20'),
(83, 'Data Analyst', 'Job', 'KS AI & Cloud Solution', 'Bangalore', 360000, 720000, NULL, 'HireDoor', '2026-10-13'),
(84, 'Data Analyst', 'Job', 'Sounce Retail Pvt Ltd', 'Mumbai', 120000, 180000, NULL, 'Indeed', '2026-10-24'),
(85, 'Business Analyst', 'Internship', 'FitPass', 'Delhi', 240000, 300000, NULL, 'HireDoor', '2026-10-19'),
(86, 'Power BI Analyst', 'Job', 'Duruva Finance', 'Thrissur', 300000, 400000, NULL, 'Naukri', '2026-10-17'),
(87, 'Power BI Developer', 'Job', 'Honeybee Tech Solutions', 'Pune', 300000, 600000, NULL, 'Naukri', '2026-10-22'),
(88, 'Business Analyst', 'Job', 'Inventia Technology', 'Noida', 360000, 480000, NULL, 'HireDoor', '2026-10-23'),
(89, 'Business Analyst', 'Internship', 'Weekday', 'Bangalore', 204000, 240000, 6, 'Internshala', '2026-10-23'),
(90, 'MIS Analyst', 'Job', 'Wahy Lab Solutions', 'Kochi', NULL, NULL, NULL, 'Glassdoor', '2026-10-18'),
(91, 'MIS Executive', 'Job', 'EnKash', 'Gurgaon', 350000, 450000, NULL, 'Internshala', '2026-10-23'),
(92, 'Power BI Analyst', 'Internship', 'The Agency Source', 'Delhi', 120000, 180000, 6, 'Internshala', '2026-10-19'),
(93, 'Data Analyst', 'Job', 'KodVix Technologies', 'Indore', 360000, 480000, NULL, 'HireDoor', '2026-10-23'),
(94, 'Reporting Analyst', 'Internship', 'Clean Science & Technology', 'Ghaziabad', 132000, NULL, 6, 'Indeed', '2026-10-22'),
(95, 'Business Analyst', 'Job', 'Genpact', 'Gurgaon', 400000, 650000, NULL, 'LinkedIn', '2026-10-21'),
(96, 'Data Analyst', 'Job', 'Kun Aerospace Pvt Ltd', 'Chennai', 144000, 216000, NULL, 'Indeed', '2026-10-24'),
(97, 'Reporting Analyst', 'Job', 'Bill Gosling Outsourcing', 'Gurgaon', NULL, NULL, NULL, 'LinkedIn', '2026-10-22'),
(98, 'Business Analyst', 'Job', 'OYO', 'Gurgaon', 300000, 450000, NULL, 'Naukri', '2026-10-23'),
(99, 'MIS Executive', 'Job', 'Delhivery', 'Coimbatore', 225000, 250000, NULL, 'Naukri', '2026-10-23'),
(100, 'Data Analyst', 'Internship', 'Welntern Pvt Ltd', 'Bhubaneswar', 120000, 240000, 6, 'Glassdoor', '2026-10-23');

INSERT INTO skills (skill_id, skill_name) VALUES
(1, 'MS Excel'),
(2, 'SQL'),
(3, 'Power BI'),
(4, 'Python'),
(5, 'VBA'),
(6, 'Advanced Excel');

INSERT INTO job_skills (job_id, skill_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(5, 2),
(5, 4),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 2),
(7, 5),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(9, 1),
(9, 3),
(10, 1),
(11, 1),
(11, 6),
(12, 3),
(13, 1),
(13, 2),
(13, 4),
(14, 1),
(14, 3),
(15, 4),
(15, 3),
(15, 2),
(16, 3),
(16, 2),
(17, 1),
(17, 3),
(18, 1),
(18, 2),
(18, 3),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(20, 3),
(20, 2),
(21, 1),
(21, 2),
(21, 3),
(22, 1),
(22, 2),
(22, 3),
(23, 1),
(23, 2),
(24, 2),
(25, 2),
(26, 1),
(27, 1),
(27, 2),
(27, 3),
(27, 4),
(28, 1),
(28, 2),
(28, 3),
(28, 4),
(29, 3),
(29, 2),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(31, 1),
(32, 1),
(33, 1),
(33, 2),
(33, 3),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(35, 1),
(36, 1),
(37, 1),
(37, 2),
(37, 3),
(37, 4),
(38, 2),
(39, 3),
(40, 1),
(40, 3),
(41, 1),
(41, 3),
(42, 3),
(43, 4),
(43, 3),
(43, 2),
(44, 1),
(45, 3),
(45, 2),
(46, 1),
(46, 2),
(46, 4),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(48, 3),
(48, 4),
(49, 3),
(49, 2),
(50, 3),
(50, 2),
(50, 4),
(51, 1),
(51, 2),
(51, 3),
(52, 1),
(52, 2),
(52, 3),
(52, 4),
(53, 1),
(53, 4),
(54, 2),
(55, 2),
(55, 3),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(57, 3),
(57, 4),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(60, 2),
(60, 3),
(61, 1),
(61, 2),
(61, 3),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(63, 3),
(64, 1),
(64, 2),
(64, 3),
(65, 1),
(65, 2),
(65, 3),
(65, 4),
(66, 1),
(66, 2),
(67, 3),
(67, 4),
(68, 3),
(68, 4),
(68, 2),
(69, 1),
(69, 2),
(69, 3),
(70, 1),
(70, 3),
(71, 1),
(71, 2),
(71, 3),
(71, 4),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(73, 3),
(73, 4),
(74, 1),
(74, 2),
(74, 4),
(75, 1),
(75, 2),
(75, 3),
(76, 1),
(76, 2),
(76, 3),
(77, 1),
(77, 3),
(78, 1),
(78, 2),
(78, 4),
(79, 1),
(79, 2),
(79, 3),
(80, 3),
(81, 1),
(81, 2),
(81, 3),
(82, 1),
(82, 2),
(82, 3),
(82, 4),
(83, 2),
(83, 3),
(83, 4),
(84, 1),
(84, 2),
(84, 3),
(85, 1),
(85, 2),
(85, 3),
(86, 3),
(86, 2),
(86, 4),
(87, 3),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(90, 3),
(90, 4),
(91, 1),
(92, 3),
(92, 2),
(93, 1),
(93, 2),
(93, 3),
(94, 1),
(94, 2),
(94, 3),
(95, 1),
(95, 3),
(96, 1),
(96, 2),
(96, 3),
(97, 1),
(97, 2),
(97, 3),
(97, 4),
(98, 1),
(98, 2),
(98, 3),
(98, 4),
(99, 1),
(99, 2),
(99, 3),
(100, 1),
(100, 2),
(100, 3),
(100, 4);

-- ---------------------------------------------------------
-- ANALYSIS QUERIES
-- Pay columns are yearly rupees (internship stipend x 12), so
-- any pay query is filtered by job_type or split by it.
-- ---------------------------------------------------------

-- Q1. Quick check of the data: how many postings, how many are jobs vs
--     internships, how many have a date, and how many have no pay listed.
SELECT COUNT(*) AS total_postings,
       SUM(CASE WHEN job_type = 'Job' THEN 1 ELSE 0 END) AS jobs,
       SUM(CASE WHEN job_type = 'Internship' THEN 1 ELSE 0 END) AS internships,
       COUNT(posted_date) AS with_date,
       MIN(posted_date) AS earliest,
       MAX(posted_date) AS latest,
       SUM(CASE WHEN salary_min IS NULL AND salary_max IS NULL THEN 1 ELSE 0 END) AS no_pay_listed
FROM jobs;


-- Q2. Which skills are asked for the most?
--     job_skills only has ids, so I join it to skills to get the names,
--     make one group per skill, and count the rows in each group.
--     pct_of_postings = skill count / total postings x 100.
SELECT s.skill_name,
       COUNT(*) AS postings,
       ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM jobs), 1) AS pct_of_postings
FROM job_skills js
JOIN skills s ON js.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY postings DESC;


-- Q3. Which skills are asked for together?
--     I join job_skills to itself on the same job_id, so every row gets paired
--     with the other skills of that job. The "<" keeps each pair only once
--     (SQL + Excel, not also Excel + SQL).
SELECT s1.skill_name AS skill_1,
       s2.skill_name AS skill_2,
       COUNT(*) AS postings_together
FROM job_skills a
JOIN job_skills b ON a.job_id = b.job_id AND a.skill_id < b.skill_id
JOIN skills s1 ON a.skill_id = s1.skill_id
JOIN skills s2 ON b.skill_id = s2.skill_id
GROUP BY s1.skill_name, s2.skill_name
ORDER BY postings_together DESC;


-- Q4. How many postings want Excel, SQL and Power BI all at once?
--     Inside: keep only those three skills, group by posting, and keep the
--     postings that matched all 3. Outside: count them.
SELECT COUNT(*) AS postings_needing_all_three
FROM (
    SELECT js.job_id
    FROM job_skills js
    JOIN skills s ON js.skill_id = s.skill_id
    WHERE s.skill_name IN ('MS Excel', 'SQL', 'Power BI')
    GROUP BY js.job_id
    HAVING COUNT(*) = 3
) AS matched;


-- Q5. Average yearly pay by city (jobs only).
--     WHERE filters rows before grouping (jobs with a city and some pay).
--     HAVING filters groups after counting (cities with at least 3 postings).
--     COALESCE uses salary_max when salary_min is blank, and the other way round,
--     so a posting with only one number still counts.
SELECT city,
       COUNT(*) AS postings_with_pay,
       ROUND(AVG((COALESCE(salary_min, salary_max) + COALESCE(salary_max, salary_min)) / 2)) AS avg_yearly_pay
FROM jobs
WHERE job_type = 'Job'
  AND city IS NOT NULL
  AND (salary_min IS NOT NULL OR salary_max IS NOT NULL)
GROUP BY city
HAVING COUNT(*) >= 3
ORDER BY avg_yearly_pay DESC;


-- Q6. What share of each job title asks for SQL, Power BI and Python?
--     CASE WHEN picks the postings that have the skill, COUNT(DISTINCT ...)
--     counts each posting once, and I divide by the postings of that title.
--     Only titles with 5 or more postings are shown.
SELECT j.title,
       COUNT(DISTINCT j.job_id) AS postings,
       ROUND(COUNT(DISTINCT CASE WHEN s.skill_name = 'SQL'      THEN j.job_id END) * 100 / COUNT(DISTINCT j.job_id)) AS pct_sql,
       ROUND(COUNT(DISTINCT CASE WHEN s.skill_name = 'Power BI' THEN j.job_id END) * 100 / COUNT(DISTINCT j.job_id)) AS pct_power_bi,
       ROUND(COUNT(DISTINCT CASE WHEN s.skill_name = 'Python'   THEN j.job_id END) * 100 / COUNT(DISTINCT j.job_id)) AS pct_python
FROM jobs j
JOIN job_skills js ON j.job_id = js.job_id
JOIN skills s ON js.skill_id = s.skill_id
GROUP BY j.title
HAVING COUNT(DISTINCT j.job_id) >= 5
ORDER BY postings DESC;


-- Q7. Do jobs and internships ask for different skills?
--     Same join as Q2, but grouped by job_type as well.
SELECT j.job_type,
       s.skill_name,
       COUNT(*) AS postings
FROM job_skills js
JOIN jobs j ON js.job_id = j.job_id
JOIN skills s ON js.skill_id = s.skill_id
GROUP BY j.job_type, s.skill_name
ORDER BY j.job_type, postings DESC;


-- Q8. Average pay for jobs (per year) and internships (per month).
--     Internship pay is stored as stipend x 12, so dividing by 12 gives
--     the monthly stipend back.
SELECT job_type,
       COUNT(*) AS postings_with_pay,
       ROUND(AVG((COALESCE(salary_min, salary_max) + COALESCE(salary_max, salary_min)) / 2)) AS avg_yearly_pay,
       ROUND(AVG((COALESCE(salary_min, salary_max) + COALESCE(salary_max, salary_min)) / 2) / 12) AS avg_monthly_pay
FROM jobs
WHERE salary_min IS NOT NULL OR salary_max IS NOT NULL
GROUP BY job_type;


-- Q9. How are job salaries spread out? (3 pay bands)
--     The inner query works out one mid-point salary per job. The outer query
--     puts each job in a band with CASE WHEN and counts the bands.
SELECT CASE WHEN mid_pay < 300000 THEN '1. Under 3 LPA'
            WHEN mid_pay < 500000 THEN '2. 3 to 5 LPA'
            ELSE '3. 5 LPA and above' END AS pay_band,
       COUNT(*) AS postings
FROM (
    SELECT (COALESCE(salary_min, salary_max) + COALESCE(salary_max, salary_min)) / 2 AS mid_pay
    FROM jobs
    WHERE job_type = 'Job'
      AND (salary_min IS NOT NULL OR salary_max IS NOT NULL)
) AS job_pay
GROUP BY pay_band
ORDER BY pay_band;


-- Q10. How many postings ask for SQL but not Power BI?
--      For each posting, the first inner query checks "has SQL?" and the
--      second checks "has no Power BI?". A posting is counted only if both are true.
SELECT COUNT(*) AS sql_but_no_power_bi
FROM jobs j
WHERE EXISTS (
        SELECT 1
        FROM job_skills js
        JOIN skills s ON js.skill_id = s.skill_id
        WHERE js.job_id = j.job_id AND s.skill_name = 'SQL')
  AND NOT EXISTS (
        SELECT 1
        FROM job_skills js
        JOIN skills s ON js.skill_id = s.skill_id
        WHERE js.job_id = j.job_id AND s.skill_name = 'Power BI');
