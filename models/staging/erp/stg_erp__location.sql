with
    location_source as (
        select *
        from {{ source('erp', 'location') }}
    ),

    renamed as (
        select
            cast("locationid" as int) as location_pk,
            cast("name" as string) as location_name,
            cast("costrate" as float) as location_contraste,
            cast("availability" as int) as location_availability,
            cast("modifieddate" as date) as location_modified_date
        from location_source
    )

select *
from renamed
