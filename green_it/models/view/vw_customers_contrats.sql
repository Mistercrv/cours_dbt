
 {{ config(
    materialized='view',
    schema='view'
    
) }}

with  vw_customers_contrats as (
SELECT
    c.customer_id,
    c.gender,
    c.age,
    c.state,
    c.is_group,
    c.group_size,
    ct.contract_type,
    ct.payment_method,
    ct.account_length_months,
    ct.monthly_charge,
    ct.total_charges,
    ct.unlimited_data_plan
FROM {{ ref('customers') }} c
LEFT JOIN {{ ref('contrats') }} ct
    ON c.customer_id = ct.customer_id

)

select * from vw_customers_contrats