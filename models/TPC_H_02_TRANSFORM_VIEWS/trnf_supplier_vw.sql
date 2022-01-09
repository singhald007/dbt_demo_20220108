/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select b.S_SUPPKEY,b.S_NAME,b.S_ADDRESS,b.S_PHONE,b.S_ACCTBAL,a.N_NAME, a.R_NAME
from {{ ref('trnf_nation_vw') }} a, {{ ref('stg_supplier_vw') }} b
where a.N_NATIONKEY = b.S_NATIONKEY
)

select *
from source_data