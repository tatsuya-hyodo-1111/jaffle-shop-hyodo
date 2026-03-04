
  
    

create or replace transient table FY26_TASK_FORCE_HYODO.RAW.locations
    
    
    
    as (with

locations as (

    select * from FY26_TASK_FORCE_HYODO.RAW.stg_locations

)

select * from locations
    )
;


  