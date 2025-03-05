with total_sales_2011 as (
    select 
        round(sum(details.gross_sales), 2) as calculated_total_sales
    from {{ ref('fct_orders_details') }} details
    join {{ ref('fct_orders') }} orders 
        on details.sales_order_fk = orders.sales_order_pk
    where extract(year from orders.order_date) = 2011
)

select *
from total_sales_2011
where calculated_total_sales != 12646112.16