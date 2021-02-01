{% macro get_team_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "org_id", "datatype": dbt_utils.type_int()},
    {"name": "parent_id", "datatype": dbt_utils.type_int()},
    {"name": "privacy", "datatype": dbt_utils.type_string()},
    {"name": "slug", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
