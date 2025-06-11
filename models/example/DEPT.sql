{{config(materialized='table')}}

with dept as

(select * from {{source('abc','DEPT')}} )

select * from dept