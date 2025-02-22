with
    customer_source as (
        select *
        from {{ source('erp', 'customer') }}
    )

    , renamed as (
        select
            cast(CUSTOMERID as int) as customer_pk
            , cast(PERSONID as int) as person_fk
            , cast(STOREID as string) as store_fk
            , cast(TERRITORYID as string) as territory_fk
            --, cast(ROWGUID as string)
            --, cast(MODIFIEDDATE as string)
            
        from customer_source
    )

select *
from renamed