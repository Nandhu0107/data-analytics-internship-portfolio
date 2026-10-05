-- CHECK LOCAL INFILE STATUS
SHOW VARIABLES LIKE 'local_infile';

-- CREATE SALES TABLE
CREATE TABLE sales(row_id VARCHAR(50), order_id VARCHAR(50), order_date VARCHAR(50), ship_date VARCHAR(50), ship_mode VARCHAR(100), customer_id VARCHAR(50), customer_name VARCHAR(150), segment VARCHAR(100), country VARCHAR(100), city VARCHAR(100), state VARCHAR(100), postal_code VARCHAR(50), region VARCHAR(100), product_id VARCHAR(100), category VARCHAR(100), sub_category VARCHAR(100), product_name VARCHAR(300), sales VARCHAR(50), quantity VARCHAR(50), discount VARCHAR(50), profit VARCHAR(50));

-- SHOW DATABASES
SHOW DATABASES;

-- CREATE TABLE TEST
CREATE TABLE sales;

-- DROP EXISTING SALES DATA TABLE
DROP TABLE IF EXISTS sales_data;

-- SHOW TABLES
SHOW TABLES;

-- VERIFY TOTAL RECORD COUNT
SELECT COUNT(*) FROM customer_data.sales_data;

-- SAMPLE DATA
SELECT * FROM sales_data LIMIT 10;

-- SELECT CUSTOMER DATA DATABASE
use customer_data;

-- TOTAL SALES
SELECT ROUND(SUM(sales),2) AS total_sales FROM sales_data;

-- TOTAL ORDERS
SELECT COUNT(DISTINCT order_id) AS total_orders FROM sales_data;

-- TOP 5 SPENDING CUSTOMERS
SELECT customer_id, customer_name, ROUND(SUM(sales),2) AS total_spending FROM sales_data GROUP BY customer_id, customer_name ORDER BY total_spending DESC LIMIT 5;

-- TOTAL SALES BY REGION
SELECT region, ROUND(SUM(sales),2) AS total_sales FROM sales_data GROUP BY region ORDER BY total_sales DESC;

-- AVERAGE ORDER SIZE
SELECT ROUND(AVG(order_total),2) AS average_order_size FROM (SELECT order_id, SUM(sales) AS order_total FROM sales_data GROUP BY order_id) AS order_summary;

-- SALES BY CATEGORY
SELECT category, ROUND(SUM(sales),2) AS total_sales FROM sales_data GROUP BY category ORDER BY total_sales DESC;

-- TOP 5 PRODUCTS
SELECT product_name, ROUND(SUM(sales),2) AS total_sales FROM sales_data GROUP BY product_name ORDER BY total_sales DESC LIMIT 5;

-- HIGHEST VALUE ORDER
SELECT order_id, ROUND(SUM(sales),2) AS order_value FROM sales_data GROUP BY order_id ORDER BY order_value DESC LIMIT 1;

-- TOP 5 MOST PROFITABLE CUSTOMERS
SELECT customer_id, customer_name, ROUND(SUM(profit),2) AS total_profit FROM sales_data GROUP BY customer_id, customer_name ORDER BY total_profit DESC LIMIT 5;

-- SALES BY CUSTOMER SEGMENT
SELECT segment, ROUND(SUM(sales),2) AS total_sales FROM sales_data GROUP BY segment ORDER BY total_sales DESC;

-- PROFIT BY REGION
SELECT region, ROUND(SUM(profit),2) AS total_profit FROM sales_data GROUP BY region ORDER BY total_profit DESC;

-- AVERAGE DISCOUNT BY CATEGORY
SELECT category, ROUND(AVG(discount),2) AS average_discount FROM sales_data GROUP BY category ORDER BY average_discount DESC;
