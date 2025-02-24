/* Importing ctes */
with
    state_province as (
        select *
        from {{ source('crm', 'stateprovince') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(stateprovinceid as string) as state_province_pk
            , cast(stateprovincecode as string) as state_province_code
            , cast(countryregioncode as string) as country_region_fk
            --, cast(isonlystateprovinceflag as string) as
            , cast(name as string) as state_province_name
            , cast(territoryid as string) as territory_pk
            --, cast(rowguid as string) as
            --, cast(modifieddate as string) as
        from state_province
    )

select *
from renamed
