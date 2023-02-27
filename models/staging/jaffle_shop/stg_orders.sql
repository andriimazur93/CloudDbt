with base_orders as (
    select * from {{ source('jaffle_shop', 'orders') }}
),
transformed as (
    select
        id as order_id,
        user_id as order_customer_id,
        order_date as order_placed_at,
        status as order_status,
        _etl_loaded_at
    from 
        base_orders
)
select * from transformed