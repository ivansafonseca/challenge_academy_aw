/* Importing CTEs */
with
    dim_products as (
        select *
        from {{ ref('int_sales__prep_customer') }}
    )
/* Calling the int to be ready for analysis */
select *
from dim_products
