select
  id        as product_id,
  name      as product_name,
  category  as product_category,
  brand,
  department,
  sku,
  distribution_center_id,

  -- measure
  cost,
  retail_price
from {{ source('thelook', 'products') }}