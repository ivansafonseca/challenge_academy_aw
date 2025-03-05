/* Importing CTEs */
with
    sales_order_header_sales_reason as (
        select *
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(salesorderid as int) as sales_order_fk
            , cast(salesreasonid as int) as sales_reason_fk
            , cast(modifieddate as date) as modified_date
        from sales_order_header_sales_reason
        qualify row_number() over (
            partition by sales_order_fk
            order by modified_date desc
        ) = 1 --deduplication added to get always one unique and most recent sales reason.
    )

select *
from renamed
