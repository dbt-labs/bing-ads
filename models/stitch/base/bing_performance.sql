select

  id,
  date as date_day,
  parent_id,
  type,
  spend,
  impressions,
  clicks,
  conversions,
  avg_position,
  status,
  modified_time

from {{var('performance_table')}}
