create database Store;

CREATE TABLE sales (
    row_id INT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(20),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(150),
    sales DECIMAL(10,2)
);

SELECT COUNT(*) AS total_orders
FROM Store.dbo.train;

SELECT SUM(sales) AS total_revenue
FROM Store.dbo.train;

SELECT 
    COUNT(*) - COUNT(postal_code) AS missing_postal_code
FROM Store.dbo.train;

SELECT AVG(sales) AS avg_order_value
FROM Store.dbo.train;

SELECT 
    MAX(sales) AS highest_sale,
    MIN(sales) AS lowest_sale,
    AVG(sales) AS avg_order_value
FROM Store.dbo.train;

SELECT category, SUM(sales) AS category_revenue
FROM Store.dbo.train
GROUP BY category
ORDER BY category_revenue DESC;

SELECT sub_category, SUM(sales) AS sub_category_revenue
FROM Store.dbo.train
GROUP BY sub_category
ORDER BY sub_category_revenue DESC;

SELECT TOP 10
    product_name,
    SUM(sales) AS total_sales
FROM Store.dbo.train
GROUP BY product_name
ORDER BY total_sales DESC;

SELECT region,SUM(sales) AS region_sales
FROM store.dbo.train
GROUP BY region
ORDER BY region_sales DESC;

SELECT state, SUM(sales) AS state_sales
FROM Store.dbo.train
GROUP BY state
ORDER BY state_sales DESC;

SELECT city, SUM(sales) AS city_sales
FROM Store.dbo.train
GROUP BY city
ORDER BY city_sales DESC;

SELECT segment, SUM(sales) AS segment_sales
FROM Store.dbo.train
GROUP BY segment;

SELECT TOP 10
    customer_name,
    SUM(sales) AS total_spent
FROM Store.dbo.train
GROUP BY customer_name
ORDER BY total_spent DESC;

SELECT 
    YEAR(order_date) AS order_year,
    SUM(sales) AS yearly_sales
FROM Store.dbo.train
GROUP BY YEAR(order_date)
ORDER BY order_year;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS monthly_sales
FROM Store.dbo.train
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT 
    AVG(DATEDIFF(DAY, order_date, ship_date)) AS avg_shipping_days
FROM Store.dbo.train;

SELECT 
    ship_mode,
    AVG(DATEDIFF(DAY, order_date, ship_date)) AS avg_shipping_days
FROM Store.dbo.train
GROUP BY ship_mode;

SELECT 
    region,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM Store.dbo.train
GROUP BY region;

SELECT 
    order_date,
    SUM(sales) OVER (ORDER BY order_date) AS running_sales
FROM Store.dbo.train;

