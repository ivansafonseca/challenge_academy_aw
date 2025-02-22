with
    person_source as (
        select *
        from {{ source('erp', 'person') }}
    )

    , renamed as (
        select
            cast(BUSINESSENTITYID as string) as business_entity_pk
            --, cast(PERSONTYPE as string) as
            --, cast(NAMESTYLE as string) as
            --, cast(TITLE as string) as person_title
                ,COALESCE(TITLE, '') || 
                CASE WHEN TITLE IS NOT NULL THEN ' ' ELSE '' END ||
                COALESCE(FIRSTNAME, '') || 
                CASE WHEN MIDDLENAME IS NOT NULL THEN ' ' ELSE '' END ||
                COALESCE(MIDDLENAME, '') || 
                CASE WHEN LASTNAME IS NOT NULL THEN ' ' ELSE '' END ||
                COALESCE(LASTNAME, '') || 
                CASE WHEN SUFFIX IS NOT NULL THEN ' ' ELSE '' END ||
                COALESCE(SUFFIX, '') as person_full_name
            --, cast(FIRSTNAME as string) as
            --, cast(MIDDLENAME as string) as
            --, cast(LASTNAME as string) as
            --, cast(SUFFIX as string) as
            --, cast(EMAILPROMOTION as string) as
            --, cast(ADDITIONALCONTACTINFO as string) as
            --, cast(DEMOGRAPHICS as string) as
            --, cast(ROWGUID as string) as
            --, cast(MODIFIEDDATE as string) as
            
        from person_source
    )

select *
from renamed