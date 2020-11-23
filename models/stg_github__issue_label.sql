with issue_label as (

    select *
    from {{ ref('stg_github__issue_label_tmp') }}

), macro as (
    select
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__issue_label_tmp')),
                staging_columns=get_issue_label_columns()
            )
        }}
        {% if var('issue_label_pass_through_columns') != [] %}
        ,
        {{ var('issue_label_pass_through_columns') | join (", ")}}

        {% endif %}
    from issue_label

), fields as (

    select 
      issue_id,
      label
    from macro
)

select *
from fields