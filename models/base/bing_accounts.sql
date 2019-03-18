{% if var('etl') == 'stitch' %}

    {{ stitch_bing_accounts() }}
    
{% elif var('etl') == 'fivetran' %}

    {{ fivetran_bing_accounts() }}
    
{% endif %}