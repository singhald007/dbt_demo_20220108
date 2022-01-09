/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select a.L_ORDERKEY,a.L_PARTKEY,a.L_SUPPKEY,a.L_LINENUMBER,a.L_QUANTITY,a.L_EXTENDEDPRICE,a.L_DISCOUNT,a.L_TAX,a.L_RETURNFLAG,a.L_LINESTATUS,a.L_SHIPDATE,a.L_COMMITDATE,a.L_RECEIPTDATE,a.L_SHIPINSTRUCT,a.L_SHIPMODE,
       b.O_CUSTKEY,b.O_ORDERSTATUS,b.O_TOTALPRICE,b.O_ORDERDATE,b.O_ORDERPRIORITY,b.O_CLERK,b.O_SHIPPRIORITY,b.C_NAME,b.C_ADDRESS,b.C_PHONE,b.C_ACCTBAL,b.C_MKTSEGMENT,b.N_NAME, b.R_NAME,
       c.PS_AVAILQTY,c.PS_SUPPLYCOST,c.S_NAME,c.S_ADDRESS,c.S_PHONE,c.S_ACCTBAL,c.P_NAME,c.P_MFGR,c.P_BRAND,c.P_TYPE,c.P_SIZE,c.P_CONTAINER,c.P_RETAILPRICE
from {{ ref('stg_lineitem_vw') }} a, {{ ref('trnf_order_vw') }} b, {{ ref('trnf_partsupp_vw') }} c
where a.L_ORDERKEY = b.O_ORDERKEY and a.L_PARTKEY = c.PS_PARTKEY and a.L_SUPPKEY = c.PS_SUPPKEY
)

select *
from source_data