
with facturation as (
    select
        ctr_type,
        count(distinct id_client) as nb_clients,
        round(avg(facture_mensuelle),3) as avg_facture_mensuelle,
        round(sum(total_facture),2) as ca_total,

        round(avg(appel_local_min),0) as avg_appel_local_min,
        round(avg(avg_data_mensuel),0) as avg_data_gb

    from {{ ref('ctr_clients') }}
    group by ctr_type
)

select * from facturation