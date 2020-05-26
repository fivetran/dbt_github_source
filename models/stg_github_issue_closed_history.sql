with issue_closed_history as (

    select *
    from {{ var('issue_closed_history') }}

), fields as (

    select 
      issue_id,
      updated_at,
      closed as is_closed
    from issue_closed_history
)

select *
from fields
