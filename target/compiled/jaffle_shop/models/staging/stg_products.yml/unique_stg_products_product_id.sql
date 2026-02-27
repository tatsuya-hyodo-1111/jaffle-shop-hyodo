
    
    

select
    product_id as unique_field,
    count(*) as n_records

from FY26_TASK_FORCE_HYODO.RAW.stg_products
where product_id is not null
group by product_id
having count(*) > 1


