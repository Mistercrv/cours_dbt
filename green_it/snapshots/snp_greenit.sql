{% snapshot snp_greenit %}

{{
    config(
        target_database='dev',
        target_schema='snapshots',
        strategy='check',
        check_cols='all',
        unique_key='"Customer ID"'
    )
}}

select *
from {{ ref("greenit") }}

{% endsnapshot %}



 -- le schema a creer
-- soit check verifie si les donnees d'une ou plusieur colonne on change, 
--autre strategy timestimpe qui peut nous dire sur une colonne a quelle moment la ligne a ete MAJ
-- sur l'ensemble des colonne on peut chosir les colonne 
-- pour differencier les ligne 
-- les snp n'aiment pas trop les espace en les nom ajouter  les double cote 
-- faire une visualisation du lineage 
-- faut regarder le snp sur duckbd
-- utiliser dbt snapshot pour l'execution