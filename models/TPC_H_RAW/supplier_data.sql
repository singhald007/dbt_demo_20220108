/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select S_SUPPKEY,S_NAME,S_ADDRESS,S_NATIONKEY,S_PHONE,S_ACCTBAL,S_COMMENT 
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."SUPPLIER"
)

select *
from source_data


