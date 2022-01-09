/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select C_CUSTKEY,C_NAME,C_ADDRESS,C_NATIONKEY,C_PHONE,C_ACCTBAL,C_MKTSEGMENT,C_COMMENT 
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER"
)

select *
from source_data


