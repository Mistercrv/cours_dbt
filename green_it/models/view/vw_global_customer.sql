 {{ config(
    materialized='view',
    schema='view'
    
) }}


with vw_global_customer as (

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
        ct.avg_monthly_gb,
        ct.monthly_charge,
        ct.total_charges,

        s.churn_label,
        s.churn_category,
        s.churn_reason
    FROM {{ ref('customers') }} c
    LEFT JOIN {{ ref('contrats') }} ct
        ON c.customer_id = ct.customer_id
    LEFT JOIN {{ ref('status') }} s
        ON c.customer_id = s.customer_id

)

select * from vw_global_customer