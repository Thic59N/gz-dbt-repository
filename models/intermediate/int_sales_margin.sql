WITH sales AS   
  (

SELECT 
sales.date_date
,sales.orders_id
,sales.products_id
,sales.revenue
,sales.quantity
,sales.quantity * product.purchase_price AS purchase_cost

-- ,sales.revenue - product.purchase_price AS margin

 FROM {{ref("stg_raw__sales")}} AS sales
LEFT JOIN {{ref("stg_raw__product")}} AS product
ON sales.products_id = product.products_id
  )

SELECT
*
,sales.revenue - purchase_cost AS margin
FROM sales