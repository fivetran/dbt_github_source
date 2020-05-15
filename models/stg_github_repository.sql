with repository as (

    select *
    from {{ source('github', 'repository') }}

), fields as (

    select 
      id as repository_id,
      full_name,
      private as is_private
    from repository
)

select *
from fields