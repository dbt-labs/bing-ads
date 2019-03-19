{% if var('etl') == 'stitch' %}

    {{ stitch_bing_keyword_performance() }}
    
{% elif var('etl') == 'fivetran' %}

    {{ fivetran_bing_keyword_performance() }}
    
{% endif %}