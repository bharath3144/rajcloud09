{{ config(
    materialized='incremental',
    unique_key='emp_no',
    incremental_strategy='insert+overwrite'
    
    
    
) }}

select * from {{source('sample','EMPLOYEES')}} 