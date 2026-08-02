select order_id, gross_item_revenue from
{{ ref('fct__orders_analytics') }} where gross_item_revenue <0