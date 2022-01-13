/* Marerized as table or view */
{{ config(materialized='table') }}

with source_data as (
select
       R_NAME region,
       N_NAME country,
       sum(l_quantity) as sum_qty,
       sum(l_extendedprice) as sum_base_price,
       sum(l_extendedprice * (1-l_discount)) as sum_disc_price,
       sum(l_extendedprice * (1-l_discount) * (1+l_tax)) as sum_charge,
       avg(l_quantity) as avg_qty,
       avg(l_extendedprice) as avg_price,
       avg(l_discount) as avg_disc,
       count(*) as count_order
 from
       {{ref('trnf_lineitem_vw')}}
 where
       l_shipdate <= dateadd(day, -90, to_date('1998-12-01'))
 group by
       region,
       country
 order by
       region,
       country
)

select *
from source_data