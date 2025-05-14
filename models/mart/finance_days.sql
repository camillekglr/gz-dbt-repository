SELECT 
date_date,
COUNT(orders_id) AS nb_transactions,
ROUND(SUM(revenue),0) AS revenue,
ROUND(SUM(revenue)/COUNT(orders_id),1) AS avg_basket,
ROUND(SUM(margin),0) AS margin,
ROUND(SUM(operational_margin),0) AS operational_margin,
ROUND(SUM(purchase_cost),0) AS total_purchase_cost,
ROUND(SUM(shipping_fee),0) AS total_shipping_fees,
ROUND(SUM(logcost),0) AS total_log_cost,
ROUND(SUM(ship_cost),0) AS total_ship_cost,
SUM(quantity) AS quantity_products_sold
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC 