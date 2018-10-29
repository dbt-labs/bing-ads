{% macro stitch_bing_ad_groups() %}

    {{ adapter_macro('bing_ads.stitch_bing_ad_groups') }}

{% endmacro %}


{% macro default__stitch_bing_ad_groups() %}

select

    id as ad_group_id,
    startdate as start_date,
    status,
    language,
    name,
    network,
    adrotation as ad_rotation,
    biddingscheme as bidding_scheme

from {{var('ad_groups_table')}}

{% endmacro %}