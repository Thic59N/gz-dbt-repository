SELECT
date_date
,SUM(ads_cost) AS ads_cost
,SUM(impression) AS impression
,SUM(click) AS click
FROM {{ref("int_campaigns")}}
 GROUP BY date_date , paid_source
ORDER BY date_date ASC