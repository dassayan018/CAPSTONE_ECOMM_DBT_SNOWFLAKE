with
    source as (
        select
            *
        from
            {{ source('raw_catalog', 'customers') }}
    ),

    cleaned as (
        select
            customer_id,
            upper(trim(first_name)) as first_name,
            upper(trim(last_name)) as last_name,
            lower(trim(email)) as email,
            signup_date,
            upper(trim(city)) as city,
            upper(trim(state)) as state,
            upper(trim(customer_segment)) as customer_segment,
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