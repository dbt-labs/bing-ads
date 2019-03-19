{% macro fivetran_bing_ads() %}

    {{ adapter_macro('bing_ads.fivetran_bing_ads') }}

{% endmacro %}


{% macro default__fivetran_bing_ads() %}

select 

    id as ad_id,
    status,
    type,
    text as ad_text,
    title,
    title_part_1,
    title_part_2,
    display_url,
    final_url,    
    mobile_final_url,
    device_preference,
    editorial_status,
    ad_format_preference,
    path_1,
    path_2

from {{var('ads_table')}}

{% endmacro %}