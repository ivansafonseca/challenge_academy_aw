with
    category_source as (
        select *
        from {{ source('erp', 'productcategory') }}
    )

    , renamed as (
        select
            cast(PRODUCTCATEGORYID as int) as category_pk
            , cast(NAME as string) as category_name
            , cast(ROWGUID as string) as category_row_guid
            , cast(MODIFIEDDATE as date) as category_modified_date
        from category_source
    )

select *
from renamed