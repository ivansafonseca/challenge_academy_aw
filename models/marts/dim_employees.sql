/* Importing CTEs */
with
    dim_products as (
        select *
        from {{ ref('int_hr__prep_employees') }}
    )
/* Calling the int to be ready for analysis */
select *
from dim_products
