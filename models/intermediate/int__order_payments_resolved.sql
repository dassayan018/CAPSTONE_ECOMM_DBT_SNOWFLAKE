with order_payments as (
    select * from {{ ref('stg_orders__order_payments') }}
),
ranked as (
    select *,
    row_number() over(partition by order_id order by 
    case when payment_status = 'SUCCESS' then 1 else 0
    end desc,
    created_at asc) as payment_rank
    from order_payments
),
resolved as (
    select order_id,
    payment_status,
    payment_method,
    payment_gateway,
    amount,
    paid_at,
    is_paid
    from ranked where payment_rank =1
)
select * from resolved
