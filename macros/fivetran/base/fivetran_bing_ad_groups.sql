{% macro fivetran_bing_ad_groups() %}

    {{ adapter_macro('bing_ads.fivetran_bing_ad_groups') }}

{% endmacro %}


{% macro default__fivetran_bing_ad_groups() %}

select

    id as ad_group_id,
    start_date,
    status,
    language,
    name,
    network_distribution as network,
    ad_rotation,
    bid_strategy_type

from {{var('ad_groups_table')}}

{% endmacro %}