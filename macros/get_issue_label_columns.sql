{% macro get_issue_label_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "label", "datatype": dbt.type_string()},
    {"name": "issue_id", "datatype": dbt.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
