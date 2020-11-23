with pull_request as (

    select *
    from {{ ref('stg_github__pull_request_tmp') }}

), macro as (
    select
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__pull_request_tmp')),
                staging_columns=get_pull_request_columns()
            )
        }}
        {% if var('pull_request_pass_through_columns') != [] %}
        ,
        {{ var('pull_request_pass_through_columns') | join (", ")}}

        {% endif %}
    from pull_request

), fields as (

    select 
      id as pull_request_id,
      issue_id,
      head_repo_id,
      head_user_id
    from macro
)

select *
from fields