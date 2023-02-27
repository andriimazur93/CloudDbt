with
    orders as (select * from {{ ref("stg_orders") }}),
    customers as (select * from {{ ref("stg_customers") }}),
    customer_orders as (
        select
            c.id as customer_id,
            min(order_placed_at) as first_order_date,
            max(order_placed_at) as most_recent_order_date,
            count(o.order_id) as number_of_orders
        from customers c
        left join orders o on o.order_customer_id = c.id
        group by 1
    )
select *
from customer_orders
