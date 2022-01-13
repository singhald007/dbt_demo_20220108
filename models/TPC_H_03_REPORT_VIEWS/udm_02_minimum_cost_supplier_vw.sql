/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select distinct
a.r_name Region,
a.n_name country,
a.P_NAME part_name,
a.p_size part_size,
a.p_type part_type,
a.p_mfgr manufacturer,
a.s_name supplier_name,
a.s_address supplier_address,
a.s_phone supplier_phone,
a.s_acctbal cost
from
{{ ref('trnf_lineitem_vw') }} a 
where
a.r_name = 'ASIA'
and a.ps_supplycost = (
select
min(b.ps_supplycost)
from
{{ ref('trnf_lineitem_vw') }} b
where
a.r_name = 'ASIA'
)
order by
1 desc,
2,
3,
4	                            
)

select *
from source_data