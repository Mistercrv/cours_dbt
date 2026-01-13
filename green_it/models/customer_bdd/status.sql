with status as (
    SELECT
        "Customer ID" AS customer_id,
        "Churn Label" AS churn_label,
        "Churn Category" AS churn_category,
        "Churn Reason" AS churn_reason
    from {{ref ('snp_greenit')}}

)

select * from status