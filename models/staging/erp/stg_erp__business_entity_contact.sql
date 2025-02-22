with
    business_entity_contact_source as (
        select *
        from {{ source('erp', 'businessentitycontact') }}
    )

    , renamed as (
        select
        cast(BUSINESSENTITYID as int) as business_entity_pk
        , cast(PERSONID as int) as person_pk
        , cast(CONTACTTYPEID as int) as contact_type_fk
        --, cast(ROWGUID as string) as
        --, cast(MODIFIEDDATE   as string) as
        from business_entity_contact_source
    )

select *
from renamed