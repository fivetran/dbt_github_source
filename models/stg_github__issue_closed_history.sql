with issue_closed_history as (

    select *
    from {{ ref('stg_github__issue_closed_history_tmp') }}

), macro as (
    select
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__issue_closed_history_tmp')),
                staging_columns=get_issue_closed_history_columns()
            )
        }}
        {% if var('issue_closed_history_pass_through_columns') != [] %}
        ,
        {{ var('issue_closed_history_pass_through_columns') | join (", ")}}

        {% endif %}
    from issue_closed_history

), fields as (

    select 
      issue_id,
      updated_at,
      closed as is_closed
    from macro
)

select *
from fields