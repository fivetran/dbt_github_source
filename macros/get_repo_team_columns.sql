{% macro get_repo_team_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "permission", "datatype": dbt_utils.type_string()},
    {"name": "repository_id", "datatype": dbt_utils.type_int()},
    {"name": "team_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
