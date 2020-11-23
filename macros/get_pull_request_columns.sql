{% macro get_pull_request_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "base_label", "datatype": dbt_utils.type_string()},
    {"name": "base_ref", "datatype": dbt_utils.type_string()},
    {"name": "base_repo_id", "datatype": dbt_utils.type_int()},
    {"name": "base_sha", "datatype": dbt_utils.type_string()},
    {"name": "base_user_id", "datatype": dbt_utils.type_int()},
    {"name": "head_label", "datatype": dbt_utils.type_string()},
    {"name": "head_ref", "datatype": dbt_utils.type_string()},
    {"name": "head_repo_id", "datatype": dbt_utils.type_int()},
    {"name": "head_sha", "datatype": dbt_utils.type_string()},
    {"name": "head_user_id", "datatype": dbt_utils.type_int()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "issue_id", "datatype": dbt_utils.type_int()},
    {"name": "merge_commit_sha", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
