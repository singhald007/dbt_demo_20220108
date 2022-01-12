/* Marerized as table or view */
{{ config(materialized='view') }}
with source_data as (
select
s_acctbal,
s_name,
n_name,
p_partkey,
p_mfgr,
s_address,
s_phone,
s_comment
from
{{ ref('trnf_lineitem_vw') }} 
where
p_partkey = ps_partkey
and s_suppkey = ps_suppkey
and p_size = 22
and p_type like '%STANDARD PLATED BRASS'
and s_nationkey = n_nationkey
and n_regionkey = r_regionkey
and r_name = 'AMERICA'
and ps_supplycost = (
select
min(ps_supplycost)
from
partsupp, supplier,
nation, region
where
p_partkey = ps_partkey
and s_suppkey = ps_suppkey
and s_nationkey = n_nationkey
and n_regionkey = r_regionkey
and r_name = 'AMERICA'
)
order by
s_acctbal desc,
n_name,
s_name,
p_partkey	                            
)

select *
from source_data