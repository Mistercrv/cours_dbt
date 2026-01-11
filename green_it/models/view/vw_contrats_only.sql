
 {{ config(
    materialized='view',
    schema='view'
    
) }}

with vw_contrats_only as (



SELECT
    customer_id,
    contract_type,
    payment_method,
    account_length_months,
    local_calls,
    local_mins,
    intl_calls,
    intl_mins,
    avg_monthly_gb,
    unlimited_data_plan,
    extra_data_charges,
    monthly_charge,
    total_charges
FROM {{ ref('contrats') }}

)

select * from   vw_contrats_only