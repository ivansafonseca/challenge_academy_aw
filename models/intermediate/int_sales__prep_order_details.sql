/* Importing CTEs */
with
    sales_order_detail as (
        select 
            sales_order_detail_pk
            , sales_order_fk
            , product_fk
            , order_qty
            , unit_price
            , unit_price_discount
            , order_qty * unit_price as gross_sales
            , (order_qty * unit_price) * (1 - unit_price_discount) as net_sales
            , (order_qty * unit_price) * unit_price_discount as total_discount
        from {{ ref('stg_erp__sales_order_detail') }}
    )

    /* Joining with fact_sales_header */
    , enrich_orders_datils as (
        select
            sales_order_detail.sales_order_detail_pk
            , sales_order_detail.sales_order_fk
            , sales_order_detail.product_fk
            , sales_order_detail.order_qty
            , sales_order_detail.unit_price
            , sales_order_detail.unit_price_discount
            , sales_order_detail.gross_sales
            , sales_order_detail.total_discount
            , sales_order_detail.net_sales
        from sales_order_detail
    )

select *
from enrich_orders_datils
