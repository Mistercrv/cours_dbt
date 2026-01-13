-- on va creer le premier model à partir de notre seed greenit
-- attention au premier seed dans le dossier exemple 
-- pense a parler du schema dans exemple pour les test et le sujet sera traité plus tard
-- parler de la matérialisation 

with customers as (
SELECT
    "Customer ID" AS customer_id,
    Gender,
    Age,
    "Under 30" AS under_30,
    Senior,
    State,
    "Phone Number" AS phone_number,
    "Group" AS is_group,
    "Number of Customers in Group" AS group_size
FROM {{ref('snp_greenit')}}

)

select * from customers



-- toute leur montrer comment integer l'environnement de prod et l'environnement de dev 
-- faire tous les autres exemple en creant d'autre modeles
-- unn fois les exemple de modele terminé, parler de la matérialisation