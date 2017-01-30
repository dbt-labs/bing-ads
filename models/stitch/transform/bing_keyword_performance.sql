with performance as (

  select * from {{ref('bing_performance')}}

)

select

  id as keyword_id,
  date_day,
  parent_id as ad_group_id,
  spend,
  impressions,
  clicks,
  conversions,
  avg_position,
  status,
  modified_time

from performance
where type = 'Keyword'
