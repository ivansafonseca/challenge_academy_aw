/* Importing CTEs */
with
    fct_orders as (
        select *
        from {{ ref('int_sales__prep_orders') }}
    )
/* Calling the int to be ready for analysis */
select *
from fct_orders
