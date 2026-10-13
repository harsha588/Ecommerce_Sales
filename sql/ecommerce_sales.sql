select * from ecommerce_customers;
select * from ecommerce_orders;

ALTER TABLE ecommerce_customers
RENAME COLUMN `ï»¿customer_name` TO customer_name;

ALTER TABLE ecommerce_orders
RENAME COLUMN `ï»¿order_id` TO order_id;

-- Which region sold the highest no if items?
SELECT region,
SUM(quantity) AS total_items
FROM ecommerce_orders
GROUP BY region 
ORDER BY total_iTems DESC;

-- What is the total revenue generate each month
SELECT 
      DATE_FORMAT(order_date, '%y-%m') AS `month`,
      SUM(price*quantity) AS total_revenue
FROM ecommerce_orders
GROUP BY DATE_FORMAT(order_date, '%y-%m')
ORDER BY `month`;


-- What are the top 5 selling products based on quantity?
SELECT product,
SUM(quantity) AS total_items
FROM ecommerce_orders
GROUP BY product
ORDER BY total_items DESC
LIMIT 5;


-- Which product category generates the highest revenue?
SELECT category,
SUM(price*quantity) AS total_revenue
from ecommerce_orders
GROUP BY category
ORDER BY total_revenue DESC;

select customer_name
from ecommerce_orders;


-- Which cities generate the highest revenue?
SELECT c.city,
SUM(o.price * o.quantity) AS total_revenue
FROM ecommerce_orders o
JOIN ecommerce_customers c
	 ON o.customer_name = c.customer_name
GROUP BY city
ORDER BY total_revenue;
