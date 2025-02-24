/* Importing CTEs */
with
    employee_department_history_source as (
        select *
        from {{ source('erp', 'employeedepartmenthistory') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(businessentityid as string) as business_entity_pk
            , cast(departmentid as string) as department_pk
            --, cast(shiftid as string) as shift_id
            --, cast(startdate as string) as start_date
            --, cast(enddate as string) end_date
            , cast(modifieddate as string) as modified_date
        from employee_department_history_source
    )

select *
from renamed
