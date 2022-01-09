/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select b.C_CUSTKEY,b.C_NAME,b.C_ADDRESS,b.C_PHONE,b.C_ACCTBAL,b.C_MKTSEGMENT,a.N_NAME, a.R_NAME
from {{ ref('trnf_nation_vw') }} a, {{ ref('stg_customer_vw') }} b
where a.N_NATIONKEY = b.C_NATIONKEY
)

select *
from source_data