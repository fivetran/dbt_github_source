with pull_request_review as (

    select *
    from {{ ref('stg_github__pull_request_review_tmp') }}

), macro as (
    select
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__pull_request_review_tmp')),
                staging_columns=get_pull_request_review_columns()
            )
        }}
        {% if var('pull_request_review_pass_through_columns') != [] %}
        ,
        {{ var('pull_request_review_pass_through_columns') | join (", ")}}

        {% endif %}
    from pull_request_review

), fields as (

    select 
      pull_request_id,
      submitted_at,
      state,
      user_id
    from macro
)

select *
from fields