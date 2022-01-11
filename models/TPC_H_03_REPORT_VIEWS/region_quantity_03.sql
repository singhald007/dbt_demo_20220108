/* Marerized as table or view */
{{ config(materialized='view') }}
{%- set N_NAME = ['INDIA','CHINA', 'JAPAN'] -%}

with source_data as (
select 
       R_NAME region,
{% for N_NAME in N_NAME %}
sum(case when N_NAME = '{{N_NAME}}' then l_quantity end) as order_quantity_sum_{{N_NAME}}
{%- if not loop.last %},{% endif -%}
{% endfor %}
 from
       {{ref('trnf_lineitem_vw')}}
 where
       l_shipdate <= dateadd(day, -90, to_date('1998-12-01')) and N_NAME in ('INDIA','CHINA', 'JAPAN')
 group by region
 order by region
)

select *
from source_data