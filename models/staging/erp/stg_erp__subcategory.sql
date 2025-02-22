with
    sub_category_source as (
        select *
        from {{ source('erp', 'productsubcategory') }}
    )

    , renamed as (
        select
            cast(productsubcategoryid as int) as sub_category_pk
            , cast(productcategoryid as int) as category_fk
            , cast(name as string) as sub_category_name
            , cast(rowguid as string) as category_row_guid
            , cast(modifieddate as date) as category_modified_date
        from sub_category_source
    )

select *
from renamed
