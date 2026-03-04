
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  



select
    1
from FY26_TASK_FORCE_HYODO.RAW.orders

where not(order_items_subtotal = subtotal)


  
  
      
    ) dbt_internal_test