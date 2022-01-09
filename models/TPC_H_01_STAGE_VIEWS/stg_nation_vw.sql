/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select N_NATIONKEY, N_NAME,N_REGIONKEY, N_COMMENT 
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."NATION"
)

select *
from source_data


