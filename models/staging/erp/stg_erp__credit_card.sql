/* Importing CTEs */
with
    credit_card as (
        select *
        from {{ source('erp', 'creditcard') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(creditcardid as int) as credit_card_pk
            , cast(cardtype as string) as card_type
            --, cast(cardnumber as string) as card_number
            --, cast(expmonth as string) as exp_month
            --, cast(expyear as string) as exp_year
            --, cast(modifieddate as string) as modified_date
        from credit_card
    )

select *
from renamed
