 SELECT 
o.orders_id
,o.date_date
,ROUND((o.margin + ship.shipping_fee) - (ship.logcost + ship.ship_cost),2) AS operational_margin
,o.quantity AS quantity
,o.revenue AS revenue
,o.purchase_cost AS purchase_cost
,o.margin AS margin
,ship.shipping_fee
,ship.logcost AS log_cost
,ship.ship_cost
-- FROM {{ref("int_orders_margin")}} AS margin
FROM `bases-sql-485411.dbt_thierry.int_orders_margin` AS o
--  LEFT JOIN {{ref("stg_raw__ship")}} AS ship
LEFT JOIN `bases-sql-485411.dbt_thierry.stg_raw__ship` AS ship
 ON o.orders_id = ship.orders_id
 ORDER BY o.orders_id DESC