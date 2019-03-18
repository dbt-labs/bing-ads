{% if var('etl') == 'stitch' %}

    {{ stitch_bing_campaigns() }}
    
{% endif %}

{% if var('etl') == 'fivetran' %}

    {{ fivetran_bing_campaigns() }}
    
{% endif %}