/* Marerized as table or view */
{{ config(materialized="view") }}

with
    source_data as (
        select
            c_custkey,
            c_name,
            c_address,
            c_nationkey,
            c_phone,
            c_acctbal,
            c_mktsegment,
            c_comment
        from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER"
    )

select *
from source_data
