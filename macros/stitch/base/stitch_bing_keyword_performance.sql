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
        account_id,
        ad_group_id,
        ad_group_name,
        ad_id,
        campaign_id,
        campaign_name,
        campaign_status,
        
        url,
        split_part(split_part(split_part(url, '//', 2),'/', 1),'?',1)::varchar as url_host,
        '/' || split_part(url, '/', 4)::varchar as url_path,
        split_part(split_part(url,'utm_source=',2), '&', 1) as utm_source,
        split_part(split_part(url,'utm_medium=',2), '&', 1) as utm_medium,
        split_part(split_part(url,'utm_campaign=',2), '&', 1) as utm_campaign,
        split_part(split_part(url,'utm_content=',2), '&', 1) as utm_content,
        split_part(split_part(url,'utm_term=',2), '&', 1) as utm_term,
        
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
        account_id,
        ad_group_id,
        ad_group_name,
        ad_id,
        campaign_id,
        campaign_name,
        campaign_status,
        
        url,
        replace(parse_url(url)['host']::varchar, 'www.', '') as url_host,
        '/' || parse_url(url)['path']::varchar as url_path,
        parse_url(url)['parameters']['utm_content']::varchar as utm_content,
        parse_url(url)['parameters']['utm_term']::varchar as utm_term,
        parse_url(url)['parameters']['utm_source']::varchar as utm_source,
        parse_url(url)['parameters']['utm_campaign']::varchar as utm_campaign,
        parse_url(url)['parameters']['utm_medium']::varchar as utm_medium,
        
        clicks,
        impressions,
        spend
        
    from renamed
    where rank = 1

)

select * from parsed

{% endmacro %}