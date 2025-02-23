/* Importing CTEs */
with
    customer as (
        select 
            customer_pk
            , person_fk
            , modified_date
        from {{ ref('stg_crm__customer') }}
        where person_fk is not null
    )

    , person as (
        select 
            business_entity_pk
            , person_full_name
        from {{ ref('stg_crm__person') }}
    )

    , business_entity_address as (
        select 
            business_entity_pk
            , address_fk
        from {{ ref('stg_crm__business_entity_address') }}
    )

    , address as (
        select 
            address_pk
            , address_line_1
            , address_line_2
            , address_city
            , postal_code
            , state_province_fk
        from {{ ref('stg_crm__address') }}
    )

    , state_province as (
        select 
            state_province_pk
            , state_province_code
            , state_province_name
            , country_region_fk
        from {{ ref('stg_crm__state_province') }}
    )

    , country_region as (
        select 
            country_region_pk
            , country_region_name
        from {{ ref('stg_crm__country_region') }}
    )
    
    /* Joining tables */
    , enrich_customer as (
        select distinct
            customer.customer_pk
            , person.business_entity_pk
            , person.person_full_name
            , address.address_line_1
            , address.address_line_2
            , address.address_city
            , address.postal_code
            , state_province.state_province_name
            , country_region.country_region_name
        from customer
        left join person on customer.person_fk = person.business_entity_pk
        left join business_entity_address on person.business_entity_pk = business_entity_address.business_entity_pk
        left join address on business_entity_address.address_fk = address.address_pk
        left join state_province on address.state_province_fk = state_province.state_province_pk
        left join country_region on state_province.country_region_fk = country_region.country_region_pk
        , qualify row_number() over (
                partition by customer.person_fk
                order by customer.modified_date desc
        ) = 1
    )

select *
from enrich_customer
