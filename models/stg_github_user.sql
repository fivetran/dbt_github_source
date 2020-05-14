with user as (

    select *
    from {{ source('github', 'user') }}

), fields as (

    select
      id as user_id,
      login as login_name,
      name,
      bio,
      company
    from user
)

select *
from fields