with order_items as (

    select * from {{ ref('stg_order_items') }}

),

recognition as (

    select 
        order_item_id,
        'Sale'      as transaction_type,
        1           as transaction_sign,
        created_at  as recognized_at
    from {{ ref('stg_order_items') }}
    where item_status <> 'Cancelled'

    union all

    select 
        order_item_id,
        'Return'    as transaction_type,
        -1          as transaction_sign,
        returned_at as recognized_at
    from {{ ref('stg_order_items') }}
    where item_status = 'Returned'

)


select
    r.order_item_id,
    oi.order_id,
    oi.user_id,
    oi.product_id,
    oi.inventory_item_id,

    -- status
    oi.item_status,
    r.transaction_type,
    r.transaction_sign,

    -- time
    oi.created_at,
    r.recognized_at,
    -- oi.shipped_at,
    -- oi.delivered_at,
    -- oi.returned_at,

    -- measures
    oi.sale_price

    
from recognition r
inner join order_items oi
  on r.order_item_id = oi.order_item_id