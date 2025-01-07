with
    dim_products as (
        select *
        from {{ ref('int_sales__prep_products') }}
    )

select *
from dim_products