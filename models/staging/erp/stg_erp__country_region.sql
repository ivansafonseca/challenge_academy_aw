with
    countryregion as (
        select *
        from {{ source('erp', 'countryregion') }}
    )

    , renamed as (
        select
            cast(COUNTRYREGIONCODE as string) as country_region_pk
            , cast(NAME as string) as country_region_name
            --, cast(MODIFIEDDATE as string) as
        from countryregion
    )

select *
from renamed