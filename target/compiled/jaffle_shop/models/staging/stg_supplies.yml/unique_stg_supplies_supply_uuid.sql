
    
    

select
    supply_uuid as unique_field,
    count(*) as n_records

from FY26_TASK_FORCE_HYODO.RAW.stg_supplies
where supply_uuid is not null
group by supply_uuid
having count(*) > 1


