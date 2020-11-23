with repository as (

    select *
    from {{ ref('stg_github__repository_tmp') }}

), macro as (
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__repository_tmp')),
                staging_columns=get_repository_columns()
            )
        }}
        {% if var('repository_pass_through_columns') != [] %}
        ,
        {{ var('repository_pass_through_columns') | join (", ")}}

        {% endif %}
    from repository

), fields as (

    select 
      id as repository_id,
      full_name,
      private as is_private
    from macro
)

select *
from fields