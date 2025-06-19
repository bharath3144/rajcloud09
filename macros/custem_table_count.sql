{% macro custom_table_count(table1, table2, table3) %}

    SELECT '{{ table1 }}' AS table_name, COUNT(*) AS total_count 
    FROM {{ table1 }}
    
    UNION ALL 
    
    SELECT '{{ table2 }}' AS table_name, COUNT(*) AS total_count 
    FROM {{ table2 }}
    
    UNION ALL 
    
    SELECT '{{ table3 }}' AS table_name, COUNT(*) AS total_count 
    FROM {{ table3 }}

{% endmacro %}