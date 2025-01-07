with
    product_source as (
        select *
        from {{ source('erp', 'product') }}
    )

    , renamed as (
        select
            cast(PRODUCTID as int) as product_pk
            , cast(NAME as string) as product_name
            , cast(PRODUCTNUMBER as string) as product_number
            , cast(MAKEFLAG as boolean) as product_make_flag
            , cast(FINISHEDGOODSFLAG as boolean) as product_finished_goods_flag
            , cast(COLOR as string) as product_color
            , cast(SAFETYSTOCKLEVEL as int) as product_safety_stock_level
            , cast(REORDERPOINT as int) as product_reorder_point
            , cast(STANDARDCOST as float) as product_standard_cost
            , cast(LISTPRICE as float) as product_list_price
            , cast(SIZE as string) as product_size
            , cast(SIZEUNITMEASURECODE as string) as product_size_unit_measure_code
            , cast(WEIGHTUNITMEASURECODE as string) as product_weight_measure_code
            , cast(WEIGHT as float) as product_weight
            , cast(DAYSTOMANUFACTURE as int) as product_days_to_manufacture
            , cast(PRODUCTLINE as string) as product_product_line
            , cast(CLASS as string) as product_class
            , cast(STYLE as string) as product_style
            , cast(PRODUCTSUBCATEGORYID as int) as sub_category_fk
            , cast(PRODUCTMODELID as int) as model_fk
            , cast(SELLSTARTDATE as date) as product_sell_start_date
            , cast(SELLENDDATE as date) as product_sell_end_date
            , cast(DISCONTINUEDDATE as string) as product_discontinued_date
            , cast(ROWGUID as string) as product_row_guid
            , cast(MODIFIEDDATE as date) as product_modified_date
        from product_source
    )

select *
from renamed