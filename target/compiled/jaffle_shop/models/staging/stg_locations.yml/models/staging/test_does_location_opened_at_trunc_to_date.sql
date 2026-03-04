with

 __dbt__cte__raw_stores as (

-- Fixture for raw_stores
select 
    
        try_cast('1' as character varying(16777216))
     as id, 
    
        try_cast('Vice City' as character varying(16777216))
     as name, 
    
        try_cast('2016-09-01T00:00:00' as TIMESTAMP_NTZ)
     as opened_at, 
    
        try_cast('0.2' as FLOAT)
     as tax_rate
union all
select 
    
        try_cast('2' as character varying(16777216))
     as id, 
    
        try_cast('San Andreas' as character varying(16777216))
     as name, 
    
        try_cast('2079-10-27T23:59:59.9999' as TIMESTAMP_NTZ)
     as opened_at, 
    
        try_cast('0.1' as FLOAT)
     as tax_rate
), source as (

    select * from __dbt__cte__raw_stores

),

renamed as (

    select

        ----------  ids
        id as location_id,

        ---------- text
        name as location_name,

        ---------- numerics
        tax_rate,

        ---------- timestamps
        date_trunc('day', opened_at) as opened_date

    from source

)

select * from renamed