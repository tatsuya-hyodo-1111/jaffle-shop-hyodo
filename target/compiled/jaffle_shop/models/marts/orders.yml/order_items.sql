
-- Fixture for order_items
select 
    
        try_cast('1' as character varying(16777216))
     as order_item_id, 
    
        try_cast('1' as character varying(16777216))
     as order_id, try_cast(null as character varying(16777216)) as product_id, try_cast(null as TIMESTAMP_NTZ) as ordered_at, try_cast(null as character varying(16777216)) as product_name, try_cast(null as NUMBER(16,2)) as product_price, 
    
        try_cast('True' as BOOLEAN)
     as is_food_item, 
    
        try_cast('False' as BOOLEAN)
     as is_drink_item, try_cast(null as NUMBER(28,2)) as supply_cost
union all
select 
    
        try_cast('2' as character varying(16777216))
     as order_item_id, 
    
        try_cast('1' as character varying(16777216))
     as order_id, try_cast(null as character varying(16777216)) as product_id, try_cast(null as TIMESTAMP_NTZ) as ordered_at, try_cast(null as character varying(16777216)) as product_name, try_cast(null as NUMBER(16,2)) as product_price, 
    
        try_cast('False' as BOOLEAN)
     as is_food_item, 
    
        try_cast('True' as BOOLEAN)
     as is_drink_item, try_cast(null as NUMBER(28,2)) as supply_cost
union all
select 
    
        try_cast('3' as character varying(16777216))
     as order_item_id, 
    
        try_cast('2' as character varying(16777216))
     as order_id, try_cast(null as character varying(16777216)) as product_id, try_cast(null as TIMESTAMP_NTZ) as ordered_at, try_cast(null as character varying(16777216)) as product_name, try_cast(null as NUMBER(16,2)) as product_price, 
    
        try_cast('True' as BOOLEAN)
     as is_food_item, 
    
        try_cast('False' as BOOLEAN)
     as is_drink_item, try_cast(null as NUMBER(28,2)) as supply_cost