{{config(materialized='table', transient=false)}}

SELECT 
    id,
    employee_name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
FROM {{ref('Employees')}}
QUALIFY rank <= 10
