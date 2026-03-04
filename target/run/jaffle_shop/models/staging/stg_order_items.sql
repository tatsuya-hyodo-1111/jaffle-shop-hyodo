
  create or replace   view FY26_TASK_FORCE_HYODO.RAW.stg_order_items
  
  
  
  
  as (
    with

source as (

    select * from FY26_TASK_FORCE_HYODO.RAW.raw_items

),

renamed as (

    select

        ----------  ids
        id as order_item_id,
        order_id,
        sku as product_id

    from source

)

select * from renamed
  );

