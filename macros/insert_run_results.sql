{% macro insert_run_results() %}
{% set run_results = load_result('run_results.json').results %}
{% for result in run_results %}
INSERT INTO dbtdemo.dbt_run_results (
    node_id,
    node_name,
    node_type,
    status,
    execution_time,
    invocation_id
) VALUES (
    '{{ result.node.unique_id }}',
    '{{ result.node.name }}',
    '{{ result.node.resource_type }}',
    '{{ result.status }}',
    '{{ result.execution_time }}',
    '{{ invocation_id }}'
);
{% endfor %}
{% endmacro %}
