with
    sub_category_source as (
        select *
        from {{ source('erp', 'productsubcategory') }}
    )

    , renamed as (
        select
            cast(PRODUCTSUBCATEGORYID as int) as sub_category_pk
            , cast(PRODUCTCATEGORYID as int) as category_fk
            , cast(NAME as string) as sub_category_name
            , cast(ROWGUID as string) as category_row_guid
            , cast(MODIFIEDDATE as date) as category_modified_date
        from sub_category_source
    )

select *
from renamed