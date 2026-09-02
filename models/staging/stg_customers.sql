select
  id                    as customer_id,
  trim(first_name)      as first_name,
  trim(last_name)       as last_name,
  trim(email)           as email,
  age,
  gender,
  state,
  street_address,
  postal_code,
  city,
  country,
  traffic_source        as first_traffic_source,
  created_at            as registered_at

from {{ source('thelook', 'users') }}