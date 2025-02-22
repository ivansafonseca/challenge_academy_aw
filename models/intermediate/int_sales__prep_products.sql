/* Importing CTEs */
with
    category as (
        select 
            category_pk
            , category_name
        from {{ ref('stg_erp__category') }}
    )

    , subcategory as (
        select 
            sub_category_pk
            , sub_category_name
            , category_fk
        from {{ ref('stg_erp__subcategory') }}
    )

    , product as (
        select 
            product_pk
            , product_name
            , product_number
            , make_flag
            , finished_goods_flag
            , product_color
            , product_safety_stock_level
            , product_reorder_point
            , product_standard_cost
            , product_list_price
            , product_days_to_manufacture
            , sell_start_date
            , class
            , style
            , sub_category_fk
        from {{ ref('stg_erp__product') }}
    )
    
    /* Joining tables */
    , enrich_products as (
        select
            product.product_pk
            , product.product_name
            , product.product_number
            , product.make_flag
            , product.finished_goods_flag
            , product.product_color
            , product.product_safety_stock_level
            , product.product_reorder_point
            , product.product_standard_cost
            , product.product_list_price
            , product.product_days_to_manufacture
            , product.sell_start_date
            , product.class
            , product.style
            , category.category_name
            , subcategory.sub_category_name
        from product
        left join subcategory on product.sub_category_fk = subcategory.sub_category_pk
        left join category on subcategory.category_fk = category.category_pk
    )

select *
from enrich_products
