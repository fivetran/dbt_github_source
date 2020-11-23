with issue_assignee as (

    select *
    from {{ ref('stg_github__issue_assignee_tmp') }}

), macro as (

        issue_id,
        user_id,
        _fivetran_synced
    from issue_assignee

), fields as (

    select 
      issue_id,
      user_id
    from macro
)

select *
from fields