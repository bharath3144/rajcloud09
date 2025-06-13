{{ config(
    materialized='incremental',
    unique_key='emp_no',
    incremental_strategy='merge'
    
    
    
) }}

select * from {{source('sample','EMPLOYEES')}} 