--issue_assignee table columns
{% macro get_issue_assignee_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "issue_id", "datatype": dbt_utils.type_int()},
    {"name": "user_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}

--issue_closed_history table columns
{% macro get_issue_closed_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "actor_id", "datatype": dbt_utils.type_int()},
    {"name": "closed", "datatype": "boolean"},
    {"name": "commit_sha", "datatype": dbt_utils.type_string()},
    {"name": "issue_id", "datatype": dbt_utils.type_int()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}

--issue_comment table columns
{% macro get_issue_comment_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "body", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "issue_id", "datatype": dbt_utils.type_int()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "user_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}

--issue_label table columns
{% macro get_issue_label_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "label", "datatype": dbt_utils.type_string()},
    {"name": "issue_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}

--issue_merged table columns
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

--issue table columns
{% macro get_issue_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "body", "datatype": dbt_utils.type_string()},
    {"name": "closed_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "locked", "datatype": "boolean"},
    {"name": "milestone_id", "datatype": dbt_utils.type_int()},
    {"name": "number", "datatype": dbt_utils.type_int()},
    {"name": "pull_request", "datatype": "boolean"},
    {"name": "repository_id", "datatype": dbt_utils.type_int()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "user_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}

--pull_request_review table columns
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

--pull_request table columns
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

--repository table columns
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

--requested_reviewer_history table columns
{% macro get_requested_reviewer_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "actor_id", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "pull_request_id", "datatype": dbt_utils.type_int()},
    {"name": "removed", "datatype": "boolean"},
    {"name": "requested_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}

--user table columns
{% macro get_user_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "bio", "datatype": dbt_utils.type_string()},
    {"name": "blog", "datatype": dbt_utils.type_string()},
    {"name": "company", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "hireable", "datatype": "boolean"},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "location", "datatype": dbt_utils.type_string()},
    {"name": "login", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "site_admin", "datatype": "boolean"},
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}