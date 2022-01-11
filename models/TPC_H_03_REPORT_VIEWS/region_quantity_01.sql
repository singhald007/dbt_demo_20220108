/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select 
       R_NAME region,
sum(case when N_NAME = 'INDIA' then l_quantity end) as order_quantity_sum_india,
sum(case when N_NAME = 'CHINA' then l_quantity end) as order_quantity_sum_china,
sum(case when N_NAME = 'JAPAN' then l_quantity end) as order_quantity_sum_japan
 from
       {{ref('trnf_lineitem_vw')}}
 where
       l_shipdate <= dateadd(day, -90, to_date('1998-12-01')) and N_NAME in ('INDIA','CHINA', 'JAPAN')
 group by
       region
 order by
       region
)

select *
from source_data