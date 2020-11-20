/*
with issue as (

    select *
    from {{ var('issue') }}

), fields as (

    select 
      id as issue_id,
      body,
      closed_at,
      created_at,
      locked as is_locked,
      milestone_id,
      number as issue_number,
      pull_request as is_pull_request,
      repository_id,
      state,
      title,
      updated_at,
      user_id
    from issue
)

select *
from fields
*/
with source as (

    select *
    from {{ ref('stg_github__issue_tmp') }}

),

renamed as (

    select
    
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__issue_tmp')),
                staging_columns=get_issue_columns()
            )
        }}

        {% if var('issue_pass_through_columns') != [] %}
        ,
        {{ var('issue_pass_through_columns') | join (", ")}}

        {% endif %}

    from source

)

select * 
from renamed