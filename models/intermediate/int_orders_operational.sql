SELECT 
margin.orders_id
,margin.date_date
,ROUND(SUM(margin.margin + ship.shipping_fee) - SUM((ship.logcost + ship.ship_cost)),2) AS operational_margin
,SUM(margin.quantity) AS quantity

FROM {{ref("int_orders_margin")}} AS margin
 LEFT JOIN {{ref("stg_raw__ship")}} AS ship
 ON margin.orders_id = ship.orders_id
 GROUP BY margin.orders_id , margin.date_date
 ORDER BY margin.orders_id DESC