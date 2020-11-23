{% macro get_pull_request_review_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "body", "datatype": dbt_utils.type_string()},
    {"name": "commit_sha", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "pull_request_id", "datatype": dbt_utils.type_int()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "submitted_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "user_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
