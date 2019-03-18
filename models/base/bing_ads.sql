{% if var('etl') == 'stitch' %}

    {{ stitch_bing_ads() }}
    
{% endif %}

{% if var('etl') == 'fivetran' %}

    {{ fivetran_bing_ads() }}
    
{% endif %}