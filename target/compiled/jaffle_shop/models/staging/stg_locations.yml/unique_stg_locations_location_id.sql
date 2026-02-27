
    
    

select
    location_id as unique_field,
    count(*) as n_records

from FY26_TASK_FORCE_HYODO.RAW.stg_locations
where location_id is not null
group by location_id
having count(*) > 1


