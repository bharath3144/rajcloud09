{{ config(materialized='table') }}

SELECT * 
FROM {{ source('sample', 'EMPLOYEES') }}