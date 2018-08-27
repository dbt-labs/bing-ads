{% macro stitch_bing_campaigns() %}

    {{ adapter_macro('bing_ads.stitch_bing_campaigns') }}

{% endmacro %}


{% macro default__stitch_bing_campaigns() %}

select

    id as campaign_id,
    name,
    description,
    status,
    timezone,
    biddingscheme as bidding_scheme,
    budgettype as budget_type,
    campaigntype as campaign_type,
    dailybudget as daily_budget,
    nativebidadjustment as native_bid_adjustment,
    trackingurltemplate as tracking_url_template,
    urlcustomparameters as url_custom_parameters

from {{var('campaigns_table')}}

{% endmacro %}