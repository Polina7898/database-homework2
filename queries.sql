-- Запрос 1
SELECT DISTINCT brand
FROM product
ORDER BY brand;


-- Запрос 2
SELECT product_id, brand, product_line, product_class, product_size, list_price, standard_cost
FROM product
WHERE list_price > 1000
ORDER BY list_price DESC;


-- Запрос 3
SELECT order_id, customer_id, order_date, order_status
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2017
ORDER BY order_date;


-- Запрос 4
SELECT customer_id, first_name, last_name, state, address
FROM customer
WHERE state = 'NSW'
ORDER BY last_name;


-- Запрос 5
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) as order_count
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY order_count DESC
LIMIT 10;


-- Запрос 6
SELECT brand, COUNT(*) as product_count, 
       ROUND(AVG(list_price), 2) as avg_price,
       ROUND(MIN(list_price), 2) as min_price,
       ROUND(MAX(list_price), 2) as max_price
FROM product
GROUP BY brand
ORDER BY avg_price DESC;


-- Запрос 7
SELECT o.order_id, o.order_date, c.first_name, c.last_name
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
WHERE o.order_date >= '2017-12-01'
ORDER BY o.order_date DESC
LIMIT 20;


-- Запрос 8
SELECT p.product_id, p.brand, p.product_line, COUNT(oi.order_item_id) as times_sold
FROM product p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.brand, p.product_line
ORDER BY times_sold DESC
LIMIT 15;
