/* Importing CTEs */
with
    sales_order_header as (
        select *
        from {{ source('erp', 'salesorderheader') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(salesorderid as int) as sales_order_pk
            --, cast(revisionnumber as int) as revision_number
            , cast(orderdate as date) as order_date
            , cast(duedate as date) as due_date
            , cast(shipdate as date) as ship_date
            , cast(status as string) as order_status
            , cast(onlineorderflag as boolean) as online_order_flag
            --, cast(purchaseordernumber as string) as purchase_order_number
            , cast(accountnumber as string) as account_number
            , cast(customerid as int) as customer_fk
            , cast(salespersonid as int) as sales_person_fk
            , cast(territoryid as int) as territory_fk
            , cast(billtoaddressid as int) as bill_to_address_fk
            , cast(shiptoaddressid as int) as ship_to_address_fk
            , cast(shipmethodid as int) as ship_method_fk
            , cast(creditcardid as int) as credit_card_fk
            --, cast(creditcardapprovalcode as int) as credit_card_approval_code
            , cast(currencyrateid as int) as currency_rate_fk
            , cast(subtotal as float) as sub_total
            , cast(taxamt as float) as tax_amt
            , cast(freight as float) as freight
            , cast(totaldue as float) as total_due
            --, cast(comment as string) as comment
            --, cast(rowguid as string) as row_guid
            , cast(modifieddate as date) as modified_date
        from sales_order_header
    )

select *
from renamed
