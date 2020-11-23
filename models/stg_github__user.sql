with github_user as (

    select *
    from {{ ref('stg_github__user_tmp') }}

), macro as (
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__user_tmp')),
                staging_columns=get_user_columns()
            )
        }}
        {% if var('user_pass_through_columns') != [] %}
        ,
        {{ var('user_pass_through_columns') | join (", ")}}

        {% endif %}
    from github_user

), fields as (

    select
      id as user_id,
      login as login_name,
      name,
      bio,
      company
    from macro
)

select *
from fields