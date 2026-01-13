
with ctr_clients as (

    select
        customer_id as id_client,
        account_length_months as ctr_nbre_mois,
        contract_type as ctr_type,
        payment_method as ctr_paiement,
        local_calls as appel_local,
        local_mins as appel_local_min,
        intl_calls as appel_inter,
        intl_mins as appel_inter_min,
        intl_active as appel_inter_active,
        intl_plan as appel_inter_plan,
        extra_intl_charges as frais_inter,
        avg_monthly_gb as avg_data_mensuel,
        unlimited_data_plan as data_illimite,
        extra_data_charges as extra_frais_data,
        customer_service_calls as appel_sav,
        monthly_charge as facture_mensuelle,
        total_charges as total_facture

    from {{ ref('contrats') }}

)

select * from ctr_clients
