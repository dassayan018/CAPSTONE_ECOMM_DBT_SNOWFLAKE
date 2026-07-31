with
    source as (
        select
            *
        from
            {{ source('raw_catalog', 'products') }}
    ),

    cleaned as (
        select
            product_id,
            upper(trim(product_name)) as product_name,
            upper(trim(category)) as category,
            upper(trim(sub_category)) as sub_category,
            upper(trim(brand)) as brand,
            {{ round_currency('unit_price') }} as unit_price,
            is_active,
            created_at,
            updated_at
        from
            source
    )

select
    *
from
    cleaned