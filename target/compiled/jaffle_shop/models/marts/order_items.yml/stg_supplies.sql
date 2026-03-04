
-- Fixture for stg_supplies
select try_cast(null as character varying(32)) as supply_uuid, try_cast(null as character varying(16777216)) as supply_id, 
    
        try_cast('1' as character varying(16777216))
     as product_id, try_cast(null as character varying(16777216)) as supply_name, 
    
        try_cast('4.5' as NUMBER(16,2))
     as supply_cost, try_cast(null as BOOLEAN) as is_perishable_supply
union all
select try_cast(null as character varying(32)) as supply_uuid, try_cast(null as character varying(16777216)) as supply_id, 
    
        try_cast('2' as character varying(16777216))
     as product_id, try_cast(null as character varying(16777216)) as supply_name, 
    
        try_cast('3.5' as NUMBER(16,2))
     as supply_cost, try_cast(null as BOOLEAN) as is_perishable_supply
union all
select try_cast(null as character varying(32)) as supply_uuid, try_cast(null as character varying(16777216)) as supply_id, 
    
        try_cast('2' as character varying(16777216))
     as product_id, try_cast(null as character varying(16777216)) as supply_name, 
    
        try_cast('5.0' as NUMBER(16,2))
     as supply_cost, try_cast(null as BOOLEAN) as is_perishable_supply