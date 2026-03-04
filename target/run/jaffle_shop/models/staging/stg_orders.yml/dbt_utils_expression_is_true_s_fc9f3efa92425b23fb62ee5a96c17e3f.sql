
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  



select
    1
from FY26_TASK_FORCE_HYODO.RAW.stg_orders

where not(order_total - tax_paid = subtotal)


  
  
      
    ) dbt_internal_test