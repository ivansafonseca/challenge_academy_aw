/* Importing CTEs */
with
    employee as (
        select
            business_entity_pk
            , job_title
            , modified_date
        from {{ ref('stg_erp__employee') }}
    )

    , person as (
        select
            business_entity_pk
            , person_full_name as employee_full_name
        from {{ ref('stg_crm__person') }}
    )

    , employee_department_history as (
        select
            business_entity_pk
            , department_pk
            , modified_date
        from {{ ref('stg_erp__employee_department_history') }}
        , qualify row_number() over (
            partition by business_entity_pk
            order by modified_date desc
        ) = 1
    )

    , department as (
        select
            department_pk
            , department_name
            , group_name
        from {{ ref('stg_erp__department') }}
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
    , enrich_employee as (
        select distinct
            employee.business_entity_pk
            , person.employee_full_name
            , employee.job_title
            , department.department_name
            , department.group_name
            , address.address_line_1
            , address.address_line_2
            , address.address_city
            , address.postal_code
            , state_province.state_province_name
            , country_region.country_region_name
        from employee
        left join person on employee.business_entity_pk = person.business_entity_pk
        left join business_entity_address on person.business_entity_pk = business_entity_address.business_entity_pk
        left join address on business_entity_address.address_fk = address.address_pk
        left join state_province on address.state_province_fk = state_province.state_province_pk
        left join country_region on state_province.country_region_fk = country_region.country_region_pk
        left join
            employee_department_history
            on employee.business_entity_pk = employee_department_history.business_entity_pk
        left join department on employee_department_history.department_pk = department.department_pk
    )

select *
from enrich_employee
