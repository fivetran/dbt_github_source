with requested_reviewer_history as (

    select *
    from {{ ref('stg_github__requested_reviewer_history_tmp') }}

), macro as (
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__requested_reviewer_history_tmp')),
                staging_columns=get_requested_reviewer_history_columns()
            )
        }}
        {% if var('requested_reviewer_history_pass_through_columns') != [] %}
        ,
        {{ var('requested_reviewer_history_pass_through_columns') | join (", ")}}

        {% endif %}
    from requested_reviewer_history

), fields as (

    select 
      pull_request_id,
      created_at,
      requested_id,
      removed
    from macro
)

select *
from fields