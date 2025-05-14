SELECT
EXTRACT(MONTH FROM date_date) AS datemonth,
SUM(operational_margin-ads_cost) AS ads_margin,
ROUND(SUM(revenue) / NULLIF(SUM(nb_transactions),0), 2) AS average_basket,
SUM(operational_margin) AS operational_margin,
SUM(ads_cost) AS ads_cost,
SUM(ads_impression) AS ads_impression,
SUM(ads_clicks) AS ads_clicks,
SUM(quantity_products_sold) AS quantity_products_sold,
SUM(revenue) AS revenue,
SUM(total_purchase_cost) AS total_purchase_cost,
SUM(margin) AS margin,
SUM(total_shipping_fees) AS total_shipping_fees,
SUM(total_log_cost) AS total_log_cost,
SUM(total_ship_cost) AS total_ship_cost
FROM {{ref("int_campaigns_day")}}
FULL OUTER JOIN {{ref("finance_days")}}
USING (date_date)
GROUP BY datemonth
ORDER BY datemonth DESC 
