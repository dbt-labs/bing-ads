with bing_keyword_performance as (

    select * from {{ref('bing_keyword_performance')}}

),

bing_keyword_performance_agg as (

    select 
    
        campaign_date,
        keyword_id as criteria_id,
        ad_group_id,
        ad_group_name,
        url_host,
        url_path,
        utm_source,
        utm_medium,
        utm_campaign,
        utm_content,
        utm_term,
        campaign_id,
        campaign_name,
        'bing ads' as platform,
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend
        
    from bing_keyword_performance
    {{ dbt_utils.group_by(14) }}

)

select * from bing_keyword_performance_agg