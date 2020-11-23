{% macro get_repository_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "archived", "datatype": "boolean"},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "default_branch", "datatype": dbt_utils.type_string()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "fork", "datatype": "boolean"},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "homepage", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "language", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "owner_id", "datatype": dbt_utils.type_int()},
    {"name": "private", "datatype": "boolean"}
] %}

{{ return(columns) }}

{% endmacro %}
