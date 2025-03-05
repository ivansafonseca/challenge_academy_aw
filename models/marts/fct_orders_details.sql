/* Importing CTEs */
with
    fct_orders_details as (
        select *
        from {{ ref('int_sales__prep_order_details') }}
    )
/* Calling the int to be ready for analysis */
select *
from fct_orders_details
