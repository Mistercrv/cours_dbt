

with clients as (
    select
        customer_id as id_client,
        case
            when gender = 'male' then 'M'
            when gender in ('female', 'femelle') then 'F'
            when gender = 'prefer not to say' then 'X'
            else 'X'
        end as genre,
        age,
        under_30 as moins_30,
        senior,
        state as etat,
        phone_number as phone,
        is_group,
        group_size

    from {{ ref('customers') }}

)

select * from clients