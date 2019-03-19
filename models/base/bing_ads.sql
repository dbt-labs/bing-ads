{% if var('etl') == 'stitch' %}

    {{ stitch_bing_ads() }}
    
{% elif var('etl') == 'fivetran' %}

    {{ fivetran_bing_ads() }}
    
{% endif %}