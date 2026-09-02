select
  id      as order_item_id,
  order_id,
  user_id,
  product_id,
  inventory_item_id,
  
  status  as item_status,

  -- time
  created_at,
  shipped_at,
  delivered_at,
  returned_at,

  -- measure
  sale_price
from {{ source('thelook', 'order_items') }}