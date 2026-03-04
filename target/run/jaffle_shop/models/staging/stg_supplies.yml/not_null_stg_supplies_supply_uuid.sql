
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select supply_uuid
from FY26_TASK_FORCE_HYODO.RAW.stg_supplies
where supply_uuid is null



  
  
      
    ) dbt_internal_test