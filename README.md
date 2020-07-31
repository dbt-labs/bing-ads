# [Deprecated] bing ads

> ⚠️ **WARNING!** This package is no longer maintained. We do not recommend adding it to your dbt project. This code remains public to prevent breaking changes to any existing dbt projects that use this package.


This package models Bing Ads data.

[Here](https://docs.microsoft.com/en-us/bingads/guides/?view=bingads-12) is info
from Microsoft's Bing Ads API overview.

[Here](https://www.stitchdata.com/docs/integrations/saas/bing-ads#schema)
is info about Stitch's Bing Ads connector.

[Here](https://fivetran.com/docs/applications/bing-ads)
is info about Fivetran's Adwords connector.

[Here](https://docs.getdbt.com/docs/package-management) is some additional
information about packages in dbt. If you haven't already, you will need to create
a `packages.yml` file in your project and supply the git link from this repository.

You should then copy the bing_ads package structure from the `dbt_project.yml` in
this repository into your project's `dbt_project.yml` file and replace the `#`
values with the bing ads table names from your warehouse. You will also need to
select which ETL tool you use (stitch or fivetran) in the `etl` var.
