{% macro fivetran_bing_campaigns() %}

    {{ adapter_macro('bing_ads.fivetran_bing_campaigns') }}

{% endmacro %}


{% macro default__fivetran_bing_campaigns() %}

select distinct

    id as campaign_id,
    name,
    last_value(status) 
        over (partition by id 
        order by modified_time 
        rows between unbounded preceding and unbounded following) 
    as status,
    time_zone as timezone,
    bid_strategy_type,
    type as campaign_type,
    budget,
    tracking_template

from {{var('campaigns_table')}}

{% endmacro %}