-- Total Sales
SELECT SUM(price * quantity) AS total_sales
FROM fact_sales;

-- Sales by Category
SELECT category, SUM(price * quantity) AS category_sales
FROM fact_sales
GROUP BY category;

-- Sales by City
SELECT city, SUM(price * quantity) AS city_sales
FROM fact_sales
GROUP BY city;

-- Orders per Customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM fact_sales
GROUP BY customer_id;