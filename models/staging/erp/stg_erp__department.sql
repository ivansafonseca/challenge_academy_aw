/* Importing CTEs */
with
    employee_department_history_source as (
        select *
        from {{ source('erp', 'department') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(departmentid as string) as department_pk
            , cast(name as string) as department_name
            , cast(groupname as string) as group_name
            --, cast(modifieddate as string) as modified_date
        from employee_department_history_source
    )

select *
from renamed
