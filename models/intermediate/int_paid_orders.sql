with
    orders as (select * from {{ ref("stg_orders") }}),
    customers as (select * from {{ ref("stg_customers") }}),
    payments as (select * from {{ ref("stg_payments") }}),
    paid_orders as (
        select
            o.order_id,
            o.order_customer_id as customer_id,
            o.order_placed_at,
            o.order_status,
            p.total_amount_paid,
            p.payment_finalized_date,
            c.first_name as customer_first_name,
            c.last_name as customer_last_name
        from orders o
        left join payments p on o.order_id = p.order_id
        left join customers c on o.order_customer_id = c.id
    )
select *
from paid_orders
