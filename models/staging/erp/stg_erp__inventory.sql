/* Importing CTEs */
with
    inventory_source as (
        select *
        from {{ source('erp', 'productinventory') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(productid as int) as product_fk
            , cast(locationid as int) as location_fk
            , cast(shelf as string) as inventory_shelf
            , cast(bin as int) as inventory_bin
            , cast(quantity as int) as inventory_quantity
            , cast(rowguid as string) as inventory_row_guid
            , cast(modifieddate as date) as inventory_modified_date
        from inventory_source
    )

select *
from renamed
