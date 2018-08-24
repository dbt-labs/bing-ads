{% macro stitch_bing_accounts() %}

    {{ adapter_macro('bing_ads.stitch_bing_accounts') }}

{% endmacro %}


{% macro default__stitch_bing_accounts() %}

select 1

{% endmacro %}