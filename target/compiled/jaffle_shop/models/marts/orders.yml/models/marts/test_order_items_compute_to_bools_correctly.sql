with

 __dbt__cte__stg_orders as (

-- Fixture for stg_orders
select 
    
        try_cast('1' as character varying(16777216))
     as order_id, try_cast(null as character varying(16777216)) as location_id, try_cast(null as character varying(16777216)) as customer_id, try_cast(null as NUMBER(38,0)) as subtotal_cents, try_cast(null as NUMBER(38,0)) as tax_paid_cents, try_cast(null as NUMBER(38,0)) as order_total_cents, try_cast(null as NUMBER(16,2)) as subtotal, try_cast(null as NUMBER(16,2)) as tax_paid, try_cast(null as NUMBER(16,2)) as order_total, try_cast(null as TIMESTAMP_NTZ) as ordered_at
union all
select 
    
        try_cast('2' as character varying(16777216))
     as order_id, try_cast(null as character varying(16777216)) as location_id, try_cast(null as character varying(16777216)) as customer_id, try_cast(null as NUMBER(38,0)) as subtotal_cents, try_cast(null as NUMBER(38,0)) as tax_paid_cents, try_cast(null as NUMBER(38,0)) as order_total_cents, try_cast(null as NUMBER(16,2)) as subtotal, try_cast(null as NUMBER(16,2)) as tax_paid, try_cast(null as NUMBER(16,2)) as order_total, try_cast(null as TIMESTAMP_NTZ) as ordered_at
),  __dbt__cte__order_items as (

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
), orders as (

    select * from __dbt__cte__stg_orders

),

order_items as (

    select * from __dbt__cte__order_items

),

order_items_summary as (

    select
        order_id,

        sum(supply_cost) as order_cost,
        sum(product_price) as order_items_subtotal,
        count(order_item_id) as count_order_items,
        sum(
            case
                when is_food_item then 1
                else 0
            end
        ) as count_food_items,
        sum(
            case
                when is_drink_item then 1
                else 0
            end
        ) as count_drink_items

    from order_items

    group by 1

),

compute_booleans as (

    select
        orders.*,

        order_items_summary.order_cost,
        order_items_summary.order_items_subtotal,
        order_items_summary.count_food_items,
        order_items_summary.count_drink_items,
        order_items_summary.count_order_items,
        order_items_summary.count_food_items > 0 as is_food_order,
        order_items_summary.count_drink_items > 0 as is_drink_order

    from orders

    left join
        order_items_summary
        on orders.order_id = order_items_summary.order_id

),

customer_order_count as (

    select
        *,

        row_number() over (
            partition by customer_id
            order by ordered_at asc
        ) as customer_order_number

    from compute_booleans

)

select * from customer_order_count