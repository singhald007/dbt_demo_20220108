/* Marerized as table or view */
{{ config(materialized='view') }}

with source_data as (
select
       l_returnflag Item_return_flag,
       l_linestatus Item_status,
       sum(l_quantity) as sum_quantity,
       sum(l_extendedprice) as sum_base_price,
       sum(l_extendedprice * (1-l_discount)) as sum_discount_price,
       sum(l_extendedprice * (1-l_discount) * (1+l_tax)) as sum_tax_charges,
       avg(l_quantity) as average_quantity,
       avg(l_extendedprice) as average_price,
       avg(l_discount) as average_discount,
       count(*) as order_count
 from
       {{ref('trnf_lineitem_vw')}}
 where
       l_shipdate <= dateadd(day, -90, to_date('1998-12-01'))
 group by
       l_returnflag,
       l_linestatus
 order by
       l_returnflag,
       l_linestatus
)

select *
from source_data