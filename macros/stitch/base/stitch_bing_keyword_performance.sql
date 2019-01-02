{% macro stitch_bing_keyword_performance() %}

    {{ adapter_macro('bing_ads.stitch_bing_keyword_performance') }}

{% endmacro %}

{% macro default__stitch_bing_keyword_performance() %}

with source as (

    select * from {{var('keyword_performance_report_table')}}
    
),

renamed as (

    select
    
        "__SDC_PRIMARY_KEY" as keyword_performance_report_id,

        convert_timezone('UTC', timeperiod)::timestamptz::date 
            as campaign_date,
            
        accountid as account_id,
        adgroupid as ad_group_id,
        adgroupname as ad_group_name,
        adid as ad_id,
        campaignid as campaign_id,
        campaignname as campaign_name,
        keywordid as keyword_id,
        
        campaignstatus as campaign_status,
        
        coalesce(finalurl, '') as url,
        
        clicks,
        impressions,
        spend,
        
        rank() over (
            partition by timeperiod::date 
            order by _sdc_report_datetime desc
            ) as rank

    from source

),

parsed as (

    select
    
        keyword_performance_report_id,
        campaign_date,
        keyword_id,
        account_id,
        ad_group_id,
        ad_group_name,
        ad_id,
        campaign_id,
        campaign_name,
        campaign_status,
        
        url,
        {{ dbt_utils.get_url_host('url') }} as url_host,
        '/' || split_part(url, '/', 4)::varchar as url_path,
        {{ dbt_utils.get_url_parameter('url', 'utm_source') }} as utm_source,
        {{ dbt_utils.get_url_parameter('url', 'utm_medium') }} as utm_medium,
        {{ dbt_utils.get_url_parameter('url', 'utm_campaign') }} as utm_campaign,
        {{ dbt_utils.get_url_parameter('url', 'utm_content') }} as utm_content,
        {{ dbt_utils.get_url_parameter('url', 'utm_term') }} as utm_term,
        
        clicks,
        impressions,
        spend
        
    from renamed
    where rank = 1

)

select * from parsed

{% endmacro %}

{% macro snowflake__stitch_bing_keyword_performance() %}

with source as (

    select * from {{var('keyword_performance_report_table')}}
    
),

renamed as (

    select
    
        "__SDC_PRIMARY_KEY" as keyword_performance_report_id,

        convert_timezone('UTC', gregoriandate)::timestamp_ntz::date 
            as campaign_date,
            
        accountid as account_id,
        adgroupid as ad_group_id,
        adgroupname as ad_group_name,
        adid as ad_id,
        campaignid as campaign_id,
        campaignname as campaign_name,
        keywordid as keyword_id,
        
        campaignstatus as campaign_status,
        
        replace(
            coalesce(destinationurl, '') || coalesce(finalurl, ''),
            '%20', ' '
            ) as url,
        
        clicks,
        impressions,
        spend,
        
        rank() over (
            partition by gregoriandate::date 
            order by _sdc_report_datetime desc
            ) as rank

    from source

),

parsed as (

    select
    
        keyword_performance_report_id,
        campaign_date,
        keyword_id,
        account_id,
        ad_group_id,
        ad_group_name,
        ad_id,
        campaign_id,
        campaign_name,
        campaign_status,
        
        url,
        {{ dbt_utils.get_url_host('url') }} as url_host,
        '/' || parse_url(url)['path']::varchar as url_path,
        {{ dbt_utils.get_url_parameter('url', 'utm_source') }} as utm_source,
        {{ dbt_utils.get_url_parameter('url', 'utm_medium') }} as utm_medium,
        {{ dbt_utils.get_url_parameter('url', 'utm_campaign') }} as utm_campaign,
        {{ dbt_utils.get_url_parameter('url', 'utm_content') }} as utm_content,
        {{ dbt_utils.get_url_parameter('url', 'utm_term') }} as utm_term,
        
        clicks,
        impressions,
        spend
        
    from renamed
    where rank = 1

)

select * from parsed

{% endmacro %}