with 
    customer as (
            select *
            from {{ ref('stg_erp__customer') }}
        )

    , person as (
            select *
            from {{ ref('stg_erp__person') }}
        )

    , business_entity_contact as (
            select *
            from {{ ref('stg_erp__business_entity_contact') }}
        )
    , business_entity_address as (
            select *
            from {{ ref('stg_erp__business_entity_address') }}
        )
    , address as (
            select *
            from {{ ref('stg_erp__address') }}
        )
    , state_province as (
            select *
            from {{ ref('stg_erp__state_province') }}
        )
    , country_region as (
            select *
            from {{ ref('stg_erp__country_region') }}
        )

    , enrich_customer as (
            select
                customer.CUSTOMER_PK
                , person.BUSINESS_ENTITY_PK
                , person.PERSON_FULL_NAME
                , business_entity_contact.PERSON_PK
                , business_entity_address.ADDRESS_PK
                , address.ADDRESS_LINE_1
                , address.ADDRESS_LINE_2
                , address.ADDRESS_CITY
                , address.STATE_PROVINCE_FK
                , state_province.STATE_PROVINCE_CODE
                , state_province.COUNTRY_REGION_FK
                , state_province.STATE_PROVINCE_NAME
                , country_region.COUNTRY_REGION_NAME
            from customer
            left join business_entity_contact on customer.person_fk = business_entity_contact.person_pk
            left join person on business_entity_contact.business_entity_pk = person.business_entity_pk
            left join business_entity_address on person.business_entity_pk = business_entity_address.business_entity_pk
            left join address on business_entity_address.address_pk = address.address_pk
            left join state_province on address.state_province_fk = state_province.state_province_pk
            left join country_region on state_province.country_region_fk = country_region.country_region_pk
    )
select *
from enrich_customer