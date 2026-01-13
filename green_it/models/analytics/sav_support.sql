
with sav_support as (

select
    ctr.ctr_type,
    c.etat,

    count(distinct ctr.id_client) as nb_clients,
    avg(ctr.appel_sav) as avg_appel_sav,
    avg(ctr.appel_inter_min) as avg_appel_inter_min,
    avg(ctr.avg_data_mensuel) as avg_data_gb

from {{ ref('ctr_clients') }} ctr
join {{ ref('clients') }} c
    on ctr.id_client = c.id_client

group by ctr.ctr_type, c.etat

)

select * from sav_support