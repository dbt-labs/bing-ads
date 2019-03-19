{% if var('etl') == 'stitch' %}

    {{ stitch_bing_ad_groups() }}
    
{% elif var('etl') == 'fivetran' %}

    {{ fivetran_bing_ad_groups() }}
    
{% endif %}