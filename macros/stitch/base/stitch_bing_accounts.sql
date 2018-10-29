{% macro stitch_bing_accounts() %}

    {{ adapter_macro('bing_ads.stitch_bing_accounts') }}

{% endmacro %}


{% macro default__stitch_bing_accounts() %}

select 

    id as account_id,
    number as account_number,
    parentcustomerid as parent_customer_id,
    paymentmethodid as payment_method_id,
    primaryuserid as primary_user_id,

    name,
    language,
    timezone,

    accountfinancialstatus as account_financial_status,
    accountlifecyclestatus as account_lifecycle_status,
    billtocustomerid as bill_to_customer_id,
    businessaddress as business_address,
    currencycode as currency_type,

    lastmodifiedbyuserid as last_modified_by_user_id,
    lastmodifiedtime as last_modified_time
    
from {{var('accounts_table')}}

{% endmacro %}