/* Importing CTEs */
with
    currency as (
        select *
        from {{ source('erp', 'currency') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(currencycode as string) as currency_code
            , cast(name as string) as name
            --, cast(modifieddate as date) as modified_date
        from currency
    )

select *
from renamed
