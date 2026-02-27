



select
    1
from FY26_TASK_FORCE_HYODO.RAW.stg_orders

where not(order_total - tax_paid = subtotal)

