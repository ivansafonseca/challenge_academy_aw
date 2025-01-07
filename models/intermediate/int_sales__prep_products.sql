with 
    category as (
            select *
            from {{ ref('stg_erp__category') }}
        )

    , subcategory as (
            select *
            from {{ ref('stg_erp__subcategory') }}
        )

    , product as (
            select *
            from {{ ref('stg_erp__product') }}
        )

    , enrich_products as (
            select
            PRODUCT.PRODUCT_PK
            , PRODUCT.PRODUCT_NAME
            , PRODUCT.PRODUCT_COLOR
            , PRODUCT.PRODUCT_SAFETY_STOCK_LEVEL
            , PRODUCT.PRODUCT_REORDER_POINT
            , PRODUCT.PRODUCT_STANDARD_COST
            , PRODUCT.PRODUCT_LIST_PRICE
            , PRODUCT.PRODUCT_DAYS_TO_MANUFACTURE
            , CATEGORY.CATEGORY_NAME
            , SUBCATEGORY.SUB_CATEGORY_NAME
            from product
            left join subcategory on product.sub_category_fk = subcategory.sub_category_pk
            left join category on subcategory.category_fk = category.category_pk
        )

select *
from enrich_products