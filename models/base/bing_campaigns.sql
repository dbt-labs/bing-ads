{% if var('etl') == 'stitch' %}

    {{ stitch_bing_campaigns() }}
    
{% elif var('etl') == 'fivetran' %}

    {{ fivetran_bing_campaigns() }}
    
{% endif %}