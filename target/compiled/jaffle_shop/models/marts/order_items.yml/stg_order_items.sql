
-- Fixture for stg_order_items
select try_cast(null as character varying(16777216)) as order_item_id, 
    
        try_cast('1' as character varying(16777216))
     as order_id, 
    
        try_cast('1' as character varying(16777216))
     as product_id
union all
select try_cast(null as character varying(16777216)) as order_item_id, 
    
        try_cast('2' as character varying(16777216))
     as order_id, 
    
        try_cast('2' as character varying(16777216))
     as product_id
union all
select try_cast(null as character varying(16777216)) as order_item_id, 
    
        try_cast('2' as character varying(16777216))
     as order_id, 
    
        try_cast('2' as character varying(16777216))
     as product_id