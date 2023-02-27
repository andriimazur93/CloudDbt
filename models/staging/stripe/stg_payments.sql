with
    base_payments as (
        select 
            * 
        from 
            {{ source("stripe", "payment") }}),
    successful_payments as (
        select
            orderid as order_id,
            max(created) as payment_finalized_date,
            sum(amount) / 100.0 as total_amount_paid
        from 
            base_payments
        where status <> 'fail'
        group by 1
    )
select *
from successful_payments
