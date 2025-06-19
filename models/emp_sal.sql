{{config(materialized='table',
transient=false)}}

with empsal 
as (select e.emp_no,e.first_name as "emp_name",
s.salary,({{sal_anual('s.salary')}}) as sal_anual
 from
 {{source('sample','EMPLOYEES')}} e join
{{source('sample','SALARIES')}} s where e.emp_no=s.emp_no)

select * from empsal