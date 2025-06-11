{{config(materialized='view',transient=false)}}

WITH employee AS (
    SELECT 
        id AS emp_no,
        employee_name,
        salary 
    FROM {{ref('Employees')}}
), 

deptman AS (
    SELECT 
        dept_no,
        emp_no 
    FROM {{source('sample','DEPT_MANAGER')}}
), 

dept AS (
    SELECT 
        dept_no,
        dept_name 
    FROM {{source('sample','DEPARTMENTS')}}
), 

final AS (
    SELECT 
        e.emp_no,
        e.employee_name,
        e.salary,
        COALESCE(d.dept_name,'General'),
        DENSE_RANK() over(partition by d.dept_name order by e.salary desc) rank
    FROM employee e 
    left JOIN deptman dm ON e.emp_no = dm.emp_no
   left  JOIN dept d ON dm.dept_no = d.dept_no
)

SELECT * FROM final



