/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select b.PS_PARTKEY,b.PS_SUPPKEY,b.PS_AVAILQTY,b.PS_SUPPLYCOST,a.S_NAME,a.S_ADDRESS,a.S_PHONE,a.S_ACCTBAL,a.N_NAME, a.R_NAME,
c.P_NAME,c.P_MFGR,c.P_BRAND,c.P_TYPE,c.P_SIZE,c.P_CONTAINER,c.P_RETAILPRICE
from {{ ref('trnf_supplier_vw') }} a, {{ ref('stg_partsupp_vw') }} b, {{ ref('stg_part_vw') }} c
where a.S_SUPPKEY = b.PS_SUPPKEY and b.PS_PARTKEY = c.P_PARTKEY
)

select *
from source_data