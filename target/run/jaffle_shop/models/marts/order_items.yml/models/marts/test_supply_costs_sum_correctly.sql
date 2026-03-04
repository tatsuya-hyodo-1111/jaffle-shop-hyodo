-- Build actual result given inputs
with dbt_internal_unit_test_actual as (
  select
    order_id,product_id,supply_cost, 'actual' as "actual_or_expected"
  from (
    with

 __dbt__cte__stg_order_items as (

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
),  __dbt__cte__stg_orders as (

-- Fixture for stg_orders
select 
    
        try_cast('1' as character varying(16777216))
     as order_id, try_cast(null as character varying(16777216)) as location_id, try_cast(null as character varying(16777216)) as customer_id, try_cast(null as NUMBER(38,0)) as subtotal_cents, try_cast(null as NUMBER(38,0)) as tax_paid_cents, try_cast(null as NUMBER(38,0)) as order_total_cents, try_cast(null as NUMBER(16,2)) as subtotal, try_cast(null as NUMBER(16,2)) as tax_paid, try_cast(null as NUMBER(16,2)) as order_total, try_cast(null as TIMESTAMP_NTZ) as ordered_at
union all
select 
    
        try_cast('2' as character varying(16777216))
     as order_id, try_cast(null as character varying(16777216)) as location_id, try_cast(null as character varying(16777216)) as customer_id, try_cast(null as NUMBER(38,0)) as subtotal_cents, try_cast(null as NUMBER(38,0)) as tax_paid_cents, try_cast(null as NUMBER(38,0)) as order_total_cents, try_cast(null as NUMBER(16,2)) as subtotal, try_cast(null as NUMBER(16,2)) as tax_paid, try_cast(null as NUMBER(16,2)) as order_total, try_cast(null as TIMESTAMP_NTZ) as ordered_at
),  __dbt__cte__stg_products as (

-- Fixture for stg_products
select 
    
        try_cast('1' as character varying(16777216))
     as product_id, try_cast(null as character varying(16777216)) as product_name, try_cast(null as character varying(16777216)) as product_type, try_cast(null as character varying(16777216)) as product_description, try_cast(null as NUMBER(16,2)) as product_price, try_cast(null as BOOLEAN) as is_food_item, try_cast(null as BOOLEAN) as is_drink_item
union all
select 
    
        try_cast('2' as character varying(16777216))
     as product_id, try_cast(null as character varying(16777216)) as product_name, try_cast(null as character varying(16777216)) as product_type, try_cast(null as character varying(16777216)) as product_description, try_cast(null as NUMBER(16,2)) as product_price, try_cast(null as BOOLEAN) as is_food_item, try_cast(null as BOOLEAN) as is_drink_item
),  __dbt__cte__stg_supplies as (

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
), order_items as (

    select * from __dbt__cte__stg_order_items

),


orders as (

    select * from __dbt__cte__stg_orders

),

products as (

    select * from __dbt__cte__stg_products

),

supplies as (

    select * from __dbt__cte__stg_supplies

),

order_supplies_summary as (

    select
        product_id,

        sum(supply_cost) as supply_cost

    from supplies

    group by 1

),

joined as (

    select
        order_items.*,

        orders.ordered_at,

        products.product_name,
        products.product_price,
        products.is_food_item,
        products.is_drink_item,

        order_supplies_summary.supply_cost

    from order_items

    left join orders on order_items.order_id = orders.order_id

    left join products on order_items.product_id = products.product_id

    left join order_supplies_summary
        on order_items.product_id = order_supplies_summary.product_id

)

select * from joined
  ) _dbt_internal_unit_test_actual
),
-- Build expected result
dbt_internal_unit_test_expected as (
  select
    order_id, product_id, supply_cost, 'expected' as "actual_or_expected"
  from (
    select 
    
        try_cast('1' as character varying(16777216))
     as order_id, 
    
        try_cast('1' as character varying(16777216))
     as product_id, 
    
        try_cast('4.5' as NUMBER(28,2))
     as supply_cost
union all
select 
    
        try_cast('2' as character varying(16777216))
     as order_id, 
    
        try_cast('2' as character varying(16777216))
     as product_id, 
    
        try_cast('8.5' as NUMBER(28,2))
     as supply_cost
union all
select 
    
        try_cast('2' as character varying(16777216))
     as order_id, 
    
        try_cast('2' as character varying(16777216))
     as product_id, 
    
        try_cast('8.5' as NUMBER(28,2))
     as supply_cost
  ) _dbt_internal_unit_test_expected
)
-- Union actual and expected results
select * from dbt_internal_unit_test_actual
union all
select * from dbt_internal_unit_test_expected