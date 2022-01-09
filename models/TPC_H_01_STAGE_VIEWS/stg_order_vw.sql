/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select O_ORDERKEY,O_CUSTKEY,O_ORDERSTATUS,O_TOTALPRICE,O_ORDERDATE,O_ORDERPRIORITY,O_CLERK,O_SHIPPRIORITY,O_COMMENT 
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
)

select *
from source_data


