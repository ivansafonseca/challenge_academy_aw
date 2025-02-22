with
    state_province as (
        select *
        from {{ source('erp', 'stateprovince') }}
    )

    , renamed as (
        select
            cast(STATEPROVINCEID as string) as state_province_pk
            , cast(STATEPROVINCECODE as string) as state_province_code
            , cast(COUNTRYREGIONCODE as string) as country_region_fk
            --, cast(ISONLYSTATEPROVINCEFLAG as string) as
            , cast(NAME as string) as state_province_name
            , cast(TERRITORYID as string) as territory_pk
            --, cast(ROWGUID as string) as
            --, cast(MODIFIEDDATE as string) as
        from state_province
    )

select *
from renamed