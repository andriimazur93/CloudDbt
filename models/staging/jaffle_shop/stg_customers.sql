with base_customers as (
    select * from {{ source('jaffle_shop', 'customers') }}
)
select * from base_customers
