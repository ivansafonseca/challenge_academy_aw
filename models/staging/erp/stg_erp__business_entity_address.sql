with
    business_entity_address as (
        select *
        from {{ source('erp', 'businessentityaddress') }}
    )

    , renamed as (
        select
        cast(BUSINESSENTITYID as int) as business_entity_pk
        , cast(ADDRESSID as int) as address_pk
        , cast(ADDRESSTYPEID as int) as address_type_fk
        --, cast(ROWGUID as string) as
        --, cast(MODIFIEDDATE as string) as
        from business_entity_address
    )

select *
from renamed