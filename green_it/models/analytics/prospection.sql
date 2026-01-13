with prospection as (
    

select
    c.id_client,
    c.genre,
    c.age,
    c.is_group,
    c.group_size,
    ctr.ctr_type,
    ctr.ctr_paiement,
    ctr.facture_mensuelle,
    ctr.total_facture,
    s.categorie_depart,
    s.raison_depart

from {{ ref('clients') }} c
left join {{ ref('ctr_clients') }} ctr
    on c.id_client = ctr.id_client
left join {{ ref('status_clients') }} s
    on c.id_client = s.id_client
where s.raison_depart is null

)

select * from prospection