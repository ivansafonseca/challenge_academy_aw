/* Importing CTEs */
with
    employee_source as (
        select *
        from {{ source('erp', 'employee') }}
    )
    /* Renaming and casting */
    , renamed as (
        select
            cast(businessentityid as int) as business_entity_pk
            --, cast(nationalidnumber as int) as
            --, cast(loginid as int) as
            , cast(jobtitle as string) as job_title
            --, cast(birthdate as date) as
            --, cast(maritalstatus as string) as
            --, cast(gender as string) as
            , cast(hiredate as date) as hire_date
            --, cast(salariedflag as boolean) as
            --, cast(vacationhours as string) as
            --, cast(sickleavehours as string) as
            , cast(currentflag as boolean) as current_flag
            --, cast(rowguid as string) as
            , cast(modifieddate as timestamp) as modified_date
            --, cast(organizationnode as string) as
        from employee_source
    )

select *
from renamed
