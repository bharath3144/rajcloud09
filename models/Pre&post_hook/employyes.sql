{{ config(
    materialized="table",
    transient=false,
    pre_hook=[
        "select * from {{ this }}",
        "delete from {{ this }} where emp_no is null"
    ],
    post_hook="truncate table {{ source('sample','EMPLOYEES') }}"
) }}

with emp as (
    select * from {{ source('sample','EMPLOYEES') }}
)

select * from emp