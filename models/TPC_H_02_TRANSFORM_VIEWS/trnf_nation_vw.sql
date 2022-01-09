/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select a.N_NATIONKEY, a.N_NAME, b.R_NAME
from {{ ref('stg_nation_vw') }} a, {{ ref('stg_region_vw') }} b
where a.N_REGIONKEY = b.R_REGIONKEY
)

select *
from source_data