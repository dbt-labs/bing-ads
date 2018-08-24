{% macro stitch_bing_ads() %}

    {{ adapter_macro('bing_ads.stitch_bing_ads') }}

{% endmacro %}


{% macro default__stitch_bing_ads() %}

select 

    id as ad_id,
    status,
    type,
    text as ad_text,
    title,
    titlepart1 as title_part_1,
    titlepart2 as title_part_2,
    displayurl as display_url,
    finalurls as final_urls,    
    destinationurl as destination_url,
    urlcustomparameters as url_custom_parameters,
    devicepreference as device_preference,
    editorialstatus as editorial_status,
    adformatpreference as ad_format_preference,
    path1 as path_1,
    path2 as path_2

from {{var('ads_table')}}

{% endmacro %}