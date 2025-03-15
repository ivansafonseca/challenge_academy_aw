/* Importing CTEs */
with
    sales_order_header as (
        select 
            sales_order_pk
            , order_date
            , due_date
            , ship_date
            , order_status
            , online_order_flag
            , account_number
            , customer_fk
            , sales_person_fk
            , territory_fk
            , bill_to_address_fk
            , ship_to_address_fk
            , ship_method_fk
            , credit_card_fk
            , sub_total
            , tax_amt
            , freight
            , total_due
            , currency_rate_fk
            , modified_date
        from {{ ref('stg_erp__sales_order_header') }}
    )

    , currency_rate as (
        select 
            currency_rate_pk
            , from_currency_code
            , to_currency_code
            , average_rate
        from {{ ref('stg_erp__currency_rate') }}
    )

    , sales_order_header_sales_reason as (
        select 
            sales_order_fk
            , sales_reason_fk
        from {{ ref('stg_erp__sales_order_header_sales_reason') }}
    )

    , sales_reason as (
        select 
            sales_reason_pk
            , name as reason_name
            , reason_type
        from {{ ref('stg_erp__sales_reason') }}
    )

    , credit_card as (
        select
            credit_card_pk
            , card_type
        from {{ ref('stg_erp__credit_card') }}
    )

    /* Joining tables */
    , enrich_orders as (
        select
            sales_order_header.sales_order_pk
            , sales_order_header.order_date
            , sales_order_header.due_date
            , sales_order_header.ship_date
            , sales_order_header.order_status
            , sales_order_header.online_order_flag
            , sales_order_header.account_number
            , sales_order_header.customer_fk
            , sales_order_header.sales_person_fk
            , sales_order_header.territory_fk
            , sales_order_header.bill_to_address_fk
            , sales_order_header.ship_to_address_fk
            , sales_order_header.ship_method_fk
            , sales_order_header.sub_total
            , sales_order_header.tax_amt
            , sales_order_header.freight
            , sales_order_header.total_due
            , currency_rate.from_currency_code
            , currency_rate.to_currency_code
            , currency_rate.average_rate
            , credit_card.card_type
            , sales_reason.reason_name
            , sales_reason.reason_type
            , sales_order_header.modified_date
        from sales_order_header
        left join currency_rate on sales_order_header.currency_rate_fk = currency_rate.currency_rate_pk
        left join sales_order_header_sales_reason on sales_order_header.sales_order_pk = sales_order_header_sales_reason.sales_order_fk
        left join sales_reason on sales_order_header_sales_reason.sales_reason_fk = sales_reason.sales_reason_pk
        left join credit_card on sales_order_header.credit_card_fk = credit_card.credit_card_pk
    )

select *
from enrich_orders
