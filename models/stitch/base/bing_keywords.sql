select
  id,
  parent_id as ad_group_id,
  keyword,
  match_type,
  destination_url,
  bid,
  bid_strategy_type,
  status,
  editorial_status,
  modified_time,
  split_part(split_part(destination_url,'utm_source=',2), '&', 1) as utm_source,
  split_part(split_part(destination_url,'utm_medium=',2), '&', 1) as utm_medium,
  split_part(split_part(destination_url,'utm_campaign=',2), '&', 1) as utm_campaign,
  split_part(split_part(destination_url,'utm_content=',2), '&', 1) as utm_content,
  split_part(split_part(destination_url,'utm_term=',2), '&', 1) as utm_term
from {{var('keywords_table')}}
