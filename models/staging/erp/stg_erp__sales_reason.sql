/* Importing CTEs */
with
    sales_reason as (
        select *
        from {{ source('erp', 'salesreason') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(salesreasonid as int) as sales_reason_pk
            , cast(name as string) as name
            , cast(reasontype as string) as reason_type
            , cast(modifieddate as date) as modified_date
        from sales_reason
    )

select *
from renamed
