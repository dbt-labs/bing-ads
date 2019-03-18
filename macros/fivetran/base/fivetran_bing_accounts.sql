{% macro fivetran_bing_accounts() %}

    {{ adapter_macro('bing_ads.fivetran_bing_accounts') }}

{% endmacro %}


{% macro default__fivetran_bing_accounts() %}

select 

    id as account_id,
    number as account_number,
    parent_customer_id,
    payment_method_id,
    primary_user_id,

    name,
    language,
    time_zone as timezone,

    account_financial_status as account_financial_status,
    account_life_cycle_status as account_lifecycle_status,
    bill_to_customer_id,
    business_name,
    business_address_country_code,
    business_address_city,
    currency_code as currency_type,

    last_modified_by_user_id,
    last_modified_time
    
from {{var('accounts_table')}}

{% endmacro %}