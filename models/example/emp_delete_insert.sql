{{ config(
    materialized='incremental',
    unique_key='emp_no',
    incremental_strategy='delete+insert'
    
    
    
) }}

select * from {{source('sample','EMPLOYEES')}} 