
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_id
from FY26_TASK_FORCE_HYODO.RAW.stg_products
where product_id is null



  
  
      
    ) dbt_internal_test