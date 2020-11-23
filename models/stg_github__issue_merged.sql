with issue_merged as (

    select *
    from {{ ref('stg_github__issue_merged_tmp') }}

), macro as (
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__issue_merged_tmp')),
                staging_columns=get_issue_merged_columns()
            )
        }}
        {% if var('issue_merged_pass_through_columns') != [] %}
        ,
        {{ var('issue_merged_pass_through_columns') | join (", ")}}

        {% endif %}
    from issue_merged

), fields as (

    select 
      issue_id,
      merged_at
    from macro
)

select *
from fields