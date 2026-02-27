with

source as (

    select * from FY26_TASK_FORCE_HYODO.RAW.raw_customers

),

renamed as (

    select

        ----------  ids
        id as customer_id,

        ---------- text
        name as customer_name

    from source

)

select * from renamed