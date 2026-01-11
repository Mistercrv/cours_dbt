
 {{ config(
    materialized='view',
    schema='view'
    
) }}

with vw_customers_status as (
    

    SELECT
        c.customer_id,
        c.gender,
        c.age,
        c.state,
        s.churn_label,
        s.churn_category,
        s.churn_reason
    FROM {{ ref('customers') }} c
    LEFT JOIN {{ ref('status') }} s
        ON c.customer_id = s.customer_id


)

select * from vw_customers_status