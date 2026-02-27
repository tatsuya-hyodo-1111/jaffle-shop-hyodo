



select
    1
from FY26_TASK_FORCE_HYODO.RAW.customers

where not(lifetime_spend_pretax + lifetime_tax_paid = lifetime_spend)

