/* Importing CTEs */
with
    product_source as (
        select *
        from {{ source('erp', 'product') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(productid as int) as product_pk
            , cast(name as string) as product_name
            , cast(productnumber as string) as product_number
            , cast(makeflag as boolean) as make_flag
            , cast(finishedgoodsflag as boolean) as finished_goods_flag
            , cast(color as string) as product_color
            , cast(safetystocklevel as int) as product_safety_stock_level
            , cast(reorderpoint as int) as product_reorder_point
            , cast(standardcost as numeric) as product_standard_cost
            , cast(listprice as numeric) as product_list_price
            , cast(size as string) as product_size
            , cast(sizeunitmeasurecode as string) as product_size_unit_measure_code
            , cast(weightunitmeasurecode as string) as product_weight_measure_code
            , cast(weight as float) as product_weight
            , cast(daystomanufacture as int) as product_days_to_manufacture
            , cast(productline as string) as product_product_line
            , cast(class as string) as class
            , cast(style as string) as style
            , cast(productsubcategoryid as int) as sub_category_fk
            , cast(productmodelid as int) as model_fk
            , cast(sellstartdate as date) as sell_start_date
            , cast(sellenddate as date) as product_sell_end_date
            , cast(discontinueddate as string) as product_discontinued_date
            , cast(rowguid as string) as product_row_guid
            , cast(modifieddate as date) as product_modified_date
        from product_source
    )

select *
from renamed
