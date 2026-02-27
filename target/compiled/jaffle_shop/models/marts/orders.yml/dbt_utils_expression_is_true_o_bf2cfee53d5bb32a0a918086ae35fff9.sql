



select
    1
from FY26_TASK_FORCE_HYODO.RAW.orders

where not(order_total = subtotal + tax_paid)

