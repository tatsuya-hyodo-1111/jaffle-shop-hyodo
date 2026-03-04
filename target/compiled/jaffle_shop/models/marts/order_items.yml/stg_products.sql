
-- Fixture for stg_products
select 
    
        try_cast('1' as character varying(16777216))
     as product_id, try_cast(null as character varying(16777216)) as product_name, try_cast(null as character varying(16777216)) as product_type, try_cast(null as character varying(16777216)) as product_description, try_cast(null as NUMBER(16,2)) as product_price, try_cast(null as BOOLEAN) as is_food_item, try_cast(null as BOOLEAN) as is_drink_item
union all
select 
    
        try_cast('2' as character varying(16777216))
     as product_id, try_cast(null as character varying(16777216)) as product_name, try_cast(null as character varying(16777216)) as product_type, try_cast(null as character varying(16777216)) as product_description, try_cast(null as NUMBER(16,2)) as product_price, try_cast(null as BOOLEAN) as is_food_item, try_cast(null as BOOLEAN) as is_drink_item