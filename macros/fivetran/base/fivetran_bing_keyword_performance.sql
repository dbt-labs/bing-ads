{% macro fivetran_bing_keyword_performance() %}

    {{ adapter_macro('bing_ads.fivetran_bing_keyword_performance') }}

{% endmacro %}

{% macro default__fivetran_bing_keyword_performance() %}

with source as (

    select * from {{var('keyword_performance_report_table')}}
    
),

ad_groups as (

    select * from {{ref('bing_ad_groups')}}
    
),


campaigns as (

    select * from {{ref('bing_campaigns')}}
    
),

ads as (

    select * from {{ref('bing_ads')}}
    
),

rollup as (

    select
        {{dbt_utils.surrogate_key(
            'date', 
            'ad_id', 
            'keyword_id', 
            'campaign_id', 
            'ad_group_id')}} 
        as keyword_performance_report_id,
        date as campaign_date,
        account_id,
        ad_group_id,
        ad_id,
        campaign_id,
        keyword_id,
        
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend
    from source
    group by 1, 2, 3, 4, 5, 6, 7
    
),

joined as (

    select
        rollup.*,
        ad_groups.name as ad_group_name,
        campaigns.name as campaign_name,
        campaigns.status as campaign_status,
        replace(
            coalesce(ads.display_url, '') || coalesce(ads.final_url, ''),
            '%20', ' '
            ) as url
    from rollup
    left join ad_groups using (ad_group_id)
    left join campaigns using (campaign_id)
    left join ads using (ad_id)
        
),

final as (

    select
        *,
        {{ dbt_utils.get_url_host('url') }} as url_host,
        '/' || {{ dbt_utils.get_url_path('url') }} as url_path,
        {{ dbt_utils.get_url_parameter('url', 'utm_source') }} as utm_source,
        {{ dbt_utils.get_url_parameter('url', 'utm_medium') }} as utm_medium,
        {{ dbt_utils.get_url_parameter('url', 'utm_campaign') }} as utm_campaign,
        {{ dbt_utils.get_url_parameter('url', 'utm_content') }} as utm_content,
        {{ dbt_utils.get_url_parameter('url', 'utm_term') }} as utm_term
    from joined
    
)

select * from final

{% endmacro %}