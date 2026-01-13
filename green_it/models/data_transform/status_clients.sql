

with status_clients as (
    select
    customer_id as id_client,
    churn_label,
	churn_category as categorie_depart,
	churn_reason as raison_depart

from {{ ref('status') }}
)

select * from status_clients