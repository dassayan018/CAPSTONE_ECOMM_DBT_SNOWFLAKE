select order_id, net_revenue from
{{ ref('fct__orders_analytics') }} where net_revenue <0