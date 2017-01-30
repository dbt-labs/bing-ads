# Relationship notes for stitch Bing Ads Integration

## Text Ad >> Ad Group

```
select *
from stitch_bing_ads.text_ad
where parent_id not in (select id from stitch_bing_ads.ad_group)
limit 100

-- returns 0 rows
-- 100% of values in text_ad.parent_id map to ad_group.id
```


## Keyword >> Ad Group

```
select *
from stitch_bing_ads.keyword
where parent_id not in (select id from stitch_bing_ads.ad_group)
limit 100

-- returns 0 rows.
-- 100% values in of keyword.parent_id map to ad_group.id
```

##

```
select *
from stitch_bing_ads.performance
where id not in (select id from stitch_bing_ads.keyword)
  and type = 'Keyword'
limit 100

-- returns 0 rows.
-- 100% of values in performance.id map to keyword.id for records that are reporting on keyword performance.
```

## Logical hierarchy notes

`Performance` is actually a record of performance for many different entities. It includes keyword performance, but then it also reports on ad group performance and campaign performance. These three are at varying levels in the hierarchy, and the spend / impressions / clicks are duplicative at each level. It is not necessary to include the performance at any level other than the keyword level in our analysis, because we can roll up to the subsequent levels.
