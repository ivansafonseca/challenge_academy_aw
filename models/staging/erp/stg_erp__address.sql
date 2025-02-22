with
    business_entity_address as (
        select *
        from {{ source('erp', 'address') }}
    )

    , renamed as (
        select
        cast(ADDRESSID as int) as address_pk
        , cast(ADDRESSLINE1 as string) as address_line_1
        , cast(ADDRESSLINE2 as string) as address_line_2
        , cast(CITY as string) as address_city
        , cast(STATEPROVINCEID as int) as state_province_fk
        --, cast(POSTALCODE as string) as
        --, cast(SPATIALLOCATION as string) as
        --, cast(ROWGUID as string) as
        --, cast(MODIFIEDDATE as string) as
        from business_entity_address
    )

select *
from renamed