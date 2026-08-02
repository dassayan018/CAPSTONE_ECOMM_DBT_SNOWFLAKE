with order_items as (
    select * from {{ ref('stg_orders__order_items') }}
),
aggregated as (
    select order_id,
    count(order_id) as item_count,
    {{ round_currency('sum(quantity * unit_price - item_discount)') }} as gross_item_revenue
    from order_items
    group by order_id
)
select * from aggregated