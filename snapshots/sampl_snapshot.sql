{% snapshot sampl_snapshot %}

{{config(strategy='timestamp',
          unique_key='emp_no',
          updated_at='updated_at',
          invalidate_hard_deletes=True
)}}

select * from {{source('sample','EMPLOYEES')}}

{% endsnapshot %}