/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select P_PARTKEY,P_NAME,P_MFGR,P_BRAND,P_TYPE,P_SIZE,P_CONTAINER,P_RETAILPRICE,P_COMMENT 
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."PART"
)

select *
from source_data


