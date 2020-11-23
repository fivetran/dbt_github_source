{% macro get_issue_merged_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "actor_id", "datatype": dbt_utils.type_int()},
    {"name": "commit_sha", "datatype": dbt_utils.type_string()},
    {"name": "issue_id", "datatype": dbt_utils.type_int()},
    {"name": "merged_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
