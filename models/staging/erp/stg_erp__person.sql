/* Importing CTEs */
with
    person_source as (
        select *
        from {{ source('erp', 'person') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(businessentityid as string) as business_entity_pk
            --, cast(persontype as string) as
            --, cast(namestyle as string) as
            --, cast(title as string) as person_title
            , coalesce(title, '')
            || case when title is not null then ' ' else '' end
            || coalesce(firstname, '')
            || case when middlename is not null then ' ' else '' end
            || coalesce(middlename, '')
            || case when lastname is not null then ' ' else '' end
            || coalesce(lastname, '')
            || case when suffix is not null then ' ' else '' end
            || coalesce(suffix, '') as person_full_name
            --, cast(firstname as string) as
            --, cast(middlename as string) as
            --, cast(lastname as string) as
            --, cast(suffix as string) as
            --, cast(emailpromotion as string) as
            --, cast(additionalcontactinfo as string) as
            --, cast(demographics as string) as
            --, cast(rowguid as string) as
            --, cast(modifieddate as string) as

        from person_source
    )

select *
from renamed
