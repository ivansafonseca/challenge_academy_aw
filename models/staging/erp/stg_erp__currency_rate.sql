/* Importing CTEs */
with
    currency_rate as (
        select *
        from {{ source('erp', 'currencyrate') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(currencyrateid as int) as currency_rate_pk
            , cast(currencyratedate as date) as currency_rate_date
            , cast(fromcurrencycode as string) as from_currency_code
            , cast(tocurrencycode as string) as to_currency_code
            , cast(averagerate as numeric) as average_rate
            , cast(endofdayrate as numeric) as end_of_day_rate
            --, cast(modifieddate as date) as modified_date
        from currency_rate
    )

select *
from renamed
