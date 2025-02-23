/* Importing CTEs */
with
    business_entity_address as (
        select *
        from {{ source('erp', 'businessentityaddress') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(businessentityid as int) as business_entity_pk
            , cast(addressid as int) as address_fk
            , cast(addresstypeid as int) as address_type_fk
        --, cast(rowguid as string) as
        --, cast(modifieddate as string) as
        from business_entity_address
    )

select *
from renamed
