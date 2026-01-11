
 {{ config(
    materialized='view',
    schema='view'
    
) }}

with contrats as (
    select 
        "Customer ID" AS customer_id,
        "Account Length (in months)" AS account_length_months,
        "Contract Type" AS contract_type,
        "Payment Method" AS payment_method,
        "Local Calls" AS local_calls,
        "Local Mins" AS local_Mins,
        "Intl Calls" AS intl_calls,
        "Intl Mins" AS intl_mins,
        "Intl Active" AS intl_active,
        "Intl Plan" AS intl_plan,
        "Extra International Charges" AS extra_intl_charges,
        "Avg Monthly GB Download" AS avg_monthly_gb,
        "Unlimited Data Plan" AS unlimited_data_plan,
        "Extra Data Charges" AS extra_data_charges,
        "Customer Service Calls" AS customer_service_calls,
        "Monthly Charge" AS monthly_charge,
        "Total Charges" AS total_charges
    from  {{ ref("snp_greenit") }}
    where dbt_valid_to is null

)

select * from contrats

