with issue_assignee as (

    select *
    from {{ ref('stg_github__issue_assignee_tmp') }}

), macro as (
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__issue_assignee_tmp')),
                staging_columns=get_issue_assignee_columns()
            )
        }}
        -- {% if var('issue_assignee_pass_through_columns') != [] %}
        -- ,
        -- {{ var('issue_assignee_pass_through_columns') | join (", ")}}

        -- {% endif %}
    from issue_assignee

), fields as (

    select 
      issue_id,
      user_id
    from macro
)

select *
from fields