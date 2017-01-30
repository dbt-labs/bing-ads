select
  id,
  parent_id as account_id,
  campaign as name,
  campaign_type,
  bid_adjustment,
  bid_strategy_type,
  budget,
  budget_type,
  status,
  time_zone,
  modified_time
from {{var('campaigns_table')}}
