
  
    

create or replace transient table FY26_TASK_FORCE_HYODO.RAW.supplies
    
    
    
    as (with

supplies as (

    select * from FY26_TASK_FORCE_HYODO.RAW.stg_supplies

)

select * from supplies
    )
;


  