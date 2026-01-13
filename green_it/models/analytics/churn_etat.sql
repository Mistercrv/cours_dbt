with  churn_etat as (

    select
    c.genre,
    c.etat,
    ctr.ctr_type,

    count(*) as nb_clients,
    sum(case when s.churn_label = 'Yes' then 1 else 0 end) as nb_churn,
    round(
        sum(case when s.churn_label = 'Yes' then 1 else 0 end)::decimal
        / count(*),
        2
    ) as taux_churn


from {{ ref('clients') }} c
join {{ ref('ctr_clients') }} ctr
    on c.id_client = ctr.id_client
join {{ ref('status_clients') }} s
    on c.id_client = s.id_client
group by c.genre, c.etat, ctr.ctr_type

) 

select * from churn_etat