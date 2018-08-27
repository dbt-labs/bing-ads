{% macro stitch_bing_ad_groups() %}

    {{ adapter_macro('bing_ads.stitch_bing_ad_groups') }}

{% endmacro %}


{% macro default__stitch_bing_ad_groups() %}

select

    id as ad_group_id,
    searchbid as search_bid,
    startdate as start_date,
    status,
    language,
    name,
    network,
    pricingmodel as pricing_model,
    remarketingtargetingsetting as remarketing_targeting_setting,
    addistribution as ad_distribution,
    adrotation as ad_rotation,
    biddingscheme as bidding_scheme,
    contentmatchbid as content_match_bid

from {{var('ad_groups_table')}}

{% endmacro %}