{% if var('etl') == 'stitch' %}

    {{ stitch_bing_accounts() }}
    
{% endif %}

{% if var('etl') == 'fivetran' %}

    {{ fivetran_bing_accounts() }}
    
{% endif %}