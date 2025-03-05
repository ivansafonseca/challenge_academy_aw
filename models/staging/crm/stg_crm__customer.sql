/* Importing CTEs */
with
    customer_source as (
        select *
        from {{ source('crm', 'customer') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(customerid as int) as customer_pk
            , cast(personid as int) as person_fk
            , cast(storeid as string) as store_fk
            , cast(territoryid as string) as territory_fk
            --, cast(rowguid as string)
            , cast(modifieddate as timestamp) as modified_date
        from customer_source
    )

select *
from renamed
