/* Importing CTEs */
with
    countryregion as (
        select *
        from {{ source('crm', 'countryregion') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(countryregioncode as string) as country_region_pk
            , cast(name as string) as country_region_name
            --, cast(modifieddate as string) as
        from countryregion
    )

select *
from renamed
