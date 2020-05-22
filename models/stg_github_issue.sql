with issue as (

    select *
    from {{ var('issue') }}

), fields as (

    select 
      id as issue_id,
      body,
      closed_at,
      created_at,
      locked as is_locked,
      milestone_id,
      number as issue_number,
      pull_request as is_pull_request,
      repository_id,
      state,
      title,
      updated_at,
      user_id
    from issue
)

select *
from fields