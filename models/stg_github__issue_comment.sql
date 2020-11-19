with issue_comment as (

    select *
    from {{ var('issue_comment') }}

), fields as (

    select 
      issue_id,
      user_id
    from issue_comment
)

select *
from fields