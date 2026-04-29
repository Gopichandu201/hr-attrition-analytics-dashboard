-- Total employee count
SELECT COUNT(*) AS total_employees FROM hr_comma_sep;

-- Count by department
SELECT department, COUNT(*) AS count
FROM hr_comma_sep
GROUP BY department
ORDER BY count DESC;

-- Count by salary level
SELECT salary, COUNT(*) AS count
FROM hr_comma_sep
GROUP BY salary
ORDER BY count DESC;

-- Overall attrition rate
SELECT 
    ROUND(AVG('left') * 100, 2) AS attrition_rate_pct
FROM hr_comma_sep;

-- Attrition rate by department
SELECT 
    department,
    COUNT(*) AS total,
    SUM('left') AS left_count,
    ROUND(AVG('left') * 100, 2) AS attrition_rate_pct
FROM hr_comma_sep
GROUP BY department
ORDER BY attrition_rate_pct DESC;

-- Attrition by salary level
SELECT 
    salary,
    ROUND(AVG('left') * 100, 2) AS attrition_rate_pct
FROM hr_comma_sep
GROUP BY salary
ORDER BY attrition_rate_pct DESC;

-- Average satisfaction and evaluation by department
SELECT 
    department,
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction,
    ROUND(AVG(last_evaluation), 2)    AS avg_evaluation
FROM hr_comma_sep
GROUP BY department
ORDER BY avg_satisfaction;

-- Employees with low satisfaction who left
SELECT *
FROM hr_comma_sep
WHERE satisfaction_level < 0.3 AND 'left' = 1;

-- Compare satisfaction: stayed vs left
SELECT 
    'left',
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction,
    ROUND(AVG(last_evaluation), 2)    AS avg_evaluation,
    ROUND(AVG(average_montly_hours), 0) AS avg_monthly_hours
FROM hr_comma_sep
GROUP BY 'left';

-- Average monthly hours by number of projects
SELECT 
    number_project,
    ROUND(AVG(average_montly_hours), 0) AS avg_hours,
    COUNT(*) AS employee_count
FROM hr_comma_sep
GROUP BY number_project
ORDER BY number_project;

-- Overworked employees (>250 hrs/month) who left
SELECT department, COUNT(*) AS overworked_and_left
FROM hr_comma_sep
WHERE average_montly_hours > 250 AND 'left'= 1
GROUP BY department
ORDER BY overworked_and_left DESC;

-- Accident rate by department
SELECT 
    department,
    ROUND(AVG(work_accident) * 100, 2) AS accident_rate_pct
FROM hr_comma_sep
GROUP BY department
ORDER BY accident_rate_pct DESC;

-- Promotion rate vs attrition
SELECT 
    promotion_last_5years,
    COUNT(*) AS total,
    ROUND(AVG('left') * 100, 2) AS attrition_rate_pct
FROM hr_comma_sep
GROUP BY promotion_last_5years;

-- Attrition by years spent at company
SELECT 
    time_spend_company,
    COUNT(*) AS total,
    SUM('left') AS left_count,
    ROUND(AVG('left') * 100, 2) AS attrition_rate_pct
FROM hr_comma_sep
GROUP BY time_spend_company
ORDER BY time_spend_company;

