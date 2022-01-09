/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select R_REGIONKEY,R_NAME,R_COMMENT 
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."REGION"
)

select *
from source_data


