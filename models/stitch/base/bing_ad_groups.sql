select
  id,
  parent_id as campaign_id,
  ad_group as name,
  start_date,
  end_date,
  status,
  ad_rotation,
  bid_strategy_type,
  content_bid,
  content_network,
  language,
  network_distribution,
  pricing_model,
  remarketing_targeting_setting,
  search_bid,
  search_network,
  modified_time
from {{var('ad_groups_table')}}
