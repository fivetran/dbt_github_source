with requested_reviewer_history as (

    select *
    from {{ var('requested_reviewer_history') }}

), fields as (

    select 
      pull_request_id,
      created_at,
      requested_id,
      removed
    from requested_reviewer_history
)

select *
from fields