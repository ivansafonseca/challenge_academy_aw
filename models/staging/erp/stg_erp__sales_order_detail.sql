/* Importing CTEs */
with
    sales_order_detail as (
        select *
        from {{ source('erp', 'salesorderdetail') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(salesorderid as int) as sales_order_fk
            , cast(salesorderdetailid as int) as sales_order_detail_pk
            --, cast(carriertrackingnumber as string) as carrier_trancking_number
            , cast(orderqty as int) as order_qty
            , cast(productid as int) as product_fk
            , cast(specialofferid as int) as spercial_offer_fk
            , cast(unitprice as float) as unit_price
            , cast(unitpricediscount as float) as unit_price_discount
            --, cast(rowguid as string) as row_guid
            --, cast(modifieddate as date) as modified_date
        from sales_order_detail
    )

select *
from renamed
