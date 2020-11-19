with issue_label as (

    select *
    from {{ var('issue_label') }}

), fields as (

    select 
      issue_id,
      label
    from issue_label
)

select *
from fields