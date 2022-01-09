/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select b.O_ORDERKEY,b.O_CUSTKEY,b.O_ORDERSTATUS,b.O_TOTALPRICE,b.O_ORDERDATE,b.O_ORDERPRIORITY,b.O_CLERK,b.O_SHIPPRIORITY,
a.C_NAME,a.C_ADDRESS,a.C_PHONE,a.C_ACCTBAL,a.C_MKTSEGMENT,a.N_NAME, a.R_NAME
from {{ ref('trnf_customer_vw') }} a, {{ ref('stg_order_vw') }} b
where a.C_CUSTKEY = b.O_CUSTKEY
)

select *
from source_data