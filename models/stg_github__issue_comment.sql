with issue_comment as (

    select *
    from {{ ref('stg_github__issue_comment_tmp') }}

), macro as (
    select
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__issue_comment_tmp')),
                staging_columns=get_issue_comment_columns()
            )
        }}
        {% if var('issue_comment_pass_through_columns') != [] %}
        ,
        {{ var('issue_comment_pass_through_columns') | join (", ")}}

        {% endif %}
    from issue_comment

), fields as (

    select 
      issue_id,
      user_id
    from macro
)

select *
from fields