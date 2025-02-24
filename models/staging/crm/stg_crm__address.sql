/* Rmporting CTEs */
with
    business_entity_address as (
        select *
        from {{ source('crm', 'address') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(addressid as int) as address_pk
            , cast(addressline1 as string) as address_line_1
            , cast(addressline2 as string) as address_line_2
            , cast(city as string) as address_city
            , cast(stateprovinceid as int) as state_province_fk
            , cast(postalcode as string) as postal_code
            --, cast(spatiallocation as string) as
            --, cast(rowguid as string) as
            --, cast(modifieddate as string) as
            from business_entity_address
    )

select *
from renamed
