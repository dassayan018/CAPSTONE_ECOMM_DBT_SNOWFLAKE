with 
  source as (
    select 
      * 
    from 
      {{ source('raw_orders', 'orders') }}
  ), 
  cleaned as (
    select 
      order_id, 
      customer_id, 
      upper(order_status) as order_status, 
      upper(order_channel) as order_channel, 
      upper(payment_method) as payment_method, 
      initcap(delivery_city) as delivery_city, 
      initcap(delivery_state) as delivery_state, 
      round(discount_amount, 2) as discount_amount, 
      round(delivery_fee, 2) as delivery_fee, 
      order_placed_at, 
      created_at, 
      updated_at 
    from 
      source
  ) 
select 
  * 
from 
  cleaned