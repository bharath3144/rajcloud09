{% snapshot emp_snapshot %}

{{config(strategy='timestamp',
         unique_key='emp_no',
         updated_at='updated_at',
         target_schema='snapshot',
         invalidate_hard_deletes=True
                             
 )}}

select * from {{source('sample','EMPLOYEE')}}

     {% endsnapshot %}                  
