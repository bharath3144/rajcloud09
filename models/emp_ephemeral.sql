{{config(materialized='ephemeral')}}

WITH employee as

(select emp_no id,first_name employee_name,sex gender,hire_date joining_date
 from {{source('sample','EMPLOYEES')}}
 ),

sal as
(select emp_no id,salary from {{source('sample','SALARIES')}}
),

final as(
    select 
    employee.id,
    employee.employee_name,
    employee.gender,
    sal.salary,
    employee.joining_date,
    dense_rank() over (order by sal.salary desc) rank
from employee,sal 
where employee.id=sal.id)

select * from final