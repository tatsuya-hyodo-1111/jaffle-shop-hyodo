
-- Fixture for stg_orders
select 
    
        try_cast('1' as character varying(16777216))
     as order_id, try_cast(null as character varying(16777216)) as location_id, try_cast(null as character varying(16777216)) as customer_id, try_cast(null as NUMBER(38,0)) as subtotal_cents, try_cast(null as NUMBER(38,0)) as tax_paid_cents, try_cast(null as NUMBER(38,0)) as order_total_cents, try_cast(null as NUMBER(16,2)) as subtotal, try_cast(null as NUMBER(16,2)) as tax_paid, try_cast(null as NUMBER(16,2)) as order_total, try_cast(null as TIMESTAMP_NTZ) as ordered_at
union all
select 
    
        try_cast('2' as character varying(16777216))
     as order_id, try_cast(null as character varying(16777216)) as location_id, try_cast(null as character varying(16777216)) as customer_id, try_cast(null as NUMBER(38,0)) as subtotal_cents, try_cast(null as NUMBER(38,0)) as tax_paid_cents, try_cast(null as NUMBER(38,0)) as order_total_cents, try_cast(null as NUMBER(16,2)) as subtotal, try_cast(null as NUMBER(16,2)) as tax_paid, try_cast(null as NUMBER(16,2)) as order_total, try_cast(null as TIMESTAMP_NTZ) as ordered_at