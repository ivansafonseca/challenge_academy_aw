with
    inventory_source as (
        select *
        from {{ source('erp', 'productinventory') }}
    ),

    renamed as (
        select
            cast(PRODUCTID as int) as product_fk
            , cast(LOCATIONID as int) as location_fk
            , cast(SHELF as string) as inventory_shelf
            , cast(BIN as int) as inventory_bin
            , cast(QUANTITY as int) as inventory_quantity
            , cast(ROWGUID as string) as inventory_row_guid
            , cast(MODIFIEDDATE as date) as inventory_modified_date
        from inventory_source
    )

select *
from renamed
