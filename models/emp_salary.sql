{{config(materialized='table')}}

with emp as (select 
 emp_no,
 first_name emp_name 
 from {{source('sample','EMPLOYEES')}}),
 sal as 
 (select 
 emp_no,salary from {{source('sample','SALARIES')}}),
 final as (select emp.emp_no,emp.emp_name,sal.salary,{{sal_anual('sal.salary')}} as anual_sal from 
 emp join sal on emp.emp_no=sal.emp_no)

 select * from final