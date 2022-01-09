/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select PS_PARTKEY,PS_SUPPKEY,PS_AVAILQTY,PS_SUPPLYCOST,PS_COMMENT 
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."PARTSUPP"
)

select *
from source_data


