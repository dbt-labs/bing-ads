{% if var('etl') == 'stitch' %}

    {{ stitch_bing_ad_groups() }}
    
{% endif %}

{% if var('etl') == 'fivetran' %}

    {{ fivetran_bing_ad_groups() }}
    
{% endif %}