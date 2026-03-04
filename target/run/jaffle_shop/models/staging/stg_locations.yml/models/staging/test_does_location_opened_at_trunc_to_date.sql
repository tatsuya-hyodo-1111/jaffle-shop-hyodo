-- Build actual result given inputs
with dbt_internal_unit_test_actual as (
  select
    location_id,location_name,tax_rate,opened_date, 'actual' as "actual_or_expected"
  from (
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
  ) _dbt_internal_unit_test_actual
),
-- Build expected result
dbt_internal_unit_test_expected as (
  select
    location_id, location_name, tax_rate, opened_date, 'expected' as "actual_or_expected"
  from (
    select 
    
        try_cast('1' as character varying(16777216))
     as location_id, 
    
        try_cast('Vice City' as character varying(16777216))
     as location_name, 
    
        try_cast('0.2' as FLOAT)
     as tax_rate, 
    
        try_cast('2016-09-01' as TIMESTAMP_NTZ)
     as opened_date
union all
select 
    
        try_cast('2' as character varying(16777216))
     as location_id, 
    
        try_cast('San Andreas' as character varying(16777216))
     as location_name, 
    
        try_cast('0.1' as FLOAT)
     as tax_rate, 
    
        try_cast('2079-10-27' as TIMESTAMP_NTZ)
     as opened_date
  ) _dbt_internal_unit_test_expected
)
-- Union actual and expected results
select * from dbt_internal_unit_test_actual
union all
select * from dbt_internal_unit_test_expected