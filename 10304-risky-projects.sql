-- PostgreSQL
SELECT
    title,
    budget,
--     CEILING((end_date - start_date) / 365::float * project_salary_sum) AS prorated_employee_expense
    CEIL((end_date - start_date) / 365.0 * project_salary_sum) AS prorated_employee_expense
FROM linkedin_projects lp
JOIN
(SELECT
    project_id,
    SUM(salary) AS project_salary_sum
FROM linkedin_emp_projects lep
    JOIN linkedin_employees le
        ON lep.emp_id = le.id
GROUP BY project_id) project_salary
    ON lp.id = project_salary.project_id
WHERE (end_date - start_date) / 365.0 * project_salary_sum > budget