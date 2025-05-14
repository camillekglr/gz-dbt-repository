{{config(materialized="view")}}

SELECT 
date_date,
(operational_margin-ads_cost) AS ads_margin,
ROUND(SUM(revenue)/NULLIF(COUNT(orders_id),0),1) AS avg_basket,
operational_margin,
ads_cost,
ads_impression,
ads_clicks,
quantity_products_sold,
revenue,
total_purchase_cost,
margin,
total_shipping_fees,
total_log_cost,
total_ship_cost
FROM {{ref("int_campaigns_day")}}
FULL OUTER JOIN {{ref("finance_days")}}
USING (date_date)
ORDER BY date_date DESC