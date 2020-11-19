with pull_request_review as (

    select *
    from {{ var('pull_request_review') }}

), fields as (

    select 
      pull_request_id,
      submitted_at,
      state,
      user_id
    from pull_request_review
)

select *
from fields