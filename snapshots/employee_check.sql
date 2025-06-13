{% snapshot employee_check %}

{{config(strategy='check',
         unique_key='emp_no',
         check_cols=['emp_no','first_name'],
         invalidate_hard_deletes=True
)}}

select * from {{source('sample','EMPLOYEE')}}

{% endsnapshot %}