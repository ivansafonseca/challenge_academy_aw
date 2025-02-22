with
    category_source as (
        select *
        from {{ source('erp', 'productcategory') }}
    )

    , renamed as (
        select
            cast(productcategoryid as int) as category_pk
            , cast(name as string) as category_name
            , cast(rowguid as string) as category_row_guid
            , cast(modifieddate as date) as category_modified_date
        from category_source
    )

select *
from renamed
