
mysql> -- 01. CHECK LOCAL INFILE STATUS
SHOW VARIABLES LIKE 'local_infile';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| local_infile  | ON    |
+---------------+-------+
1 row in set (0.022 sec)



mysql> -- 02. CREATE SALES TABLE
CREATE TABLE sales(row_id VARCHAR(50), order_id VARCHAR(50), order_date VARCHAR(50), ship_date VARCHAR(50), ship_mode VARCHAR(100), customer_id VARCHAR(50), customer_name VARCHAR(150), segment VARCHAR(100), country VARCHAR(100), city VARCHAR(100), state VARCHAR(100), postal_code VARCHAR(50), region VARCHAR(100), product_id VARCHAR(100), category VARCHAR(100), sub_category VARCHAR(100), product_name VARCHAR(300), sales VARCHAR(50), quantity VARCHAR(50), discount VARCHAR(50), profit VARCHAR(50));
Query OK, 0 rows affected (0.191 sec)


mysql> -- 03. SHOW DATABASES
SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| customer_data      |
| information_schema |
| mysql              |
| newschema          |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.015 sec)




mysql> -- 04. CREATE TABLE TEST
CREATE TABLE sales;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> -- 05. DROP EXISTING SALES DATA TABLE
DROP TABLE IF EXISTS sales_data;
Query OK, 0 rows affected, 1 warning (0.036 sec)

mysql> -- 06. SHOW TABLES
SHOW TABLES;
+-------------------------+
| Tables_in_customer_data |
+-------------------------+
| sales_csv               |
+-------------------------+
1 row in set (0.016 sec)



mysql> -- 07. VERIFY TOTAL RECORD COUNT
SELECT COUNT(*) FROM customer_data.sales_data;
+----------+
| COUNT(*) |
+----------+
|     9994 |
+----------+
1 row in set (0.097 sec)




mysql> -- 08. VIEW SAMPLE DATA
SELECT * FROM sales_data LIMIT 10;
ERROR 1146 (42S02): Table 'newschema.sales_data' doesn't exist
mysql> -- 09. SELECT CUSTOMER DATA DATABASE
use customer_data;
Database changed
mysql> SELECT * FROM sales_data LIMIT 10;
+--------+----------------+------------+-----------+----------------+-------------+----------------+-----------+---------------+-------------+------------+-------------+--------+-----------------+-----------------+--------------+----------------------------------------------------------------------------------------------+-------+----------+----------+---------+
| row_id | order_id       | order_date | ship_date | ship_mode      | customer_id | customer_name  | segment   | country       | city        | state      | postal_code | region | product_id      | category        | sub_category | product_name                                                                                 | sales | quantity | discount | profit  |
+--------+----------------+------------+-----------+----------------+-------------+----------------+-----------+---------------+-------------+------------+-------------+--------+-----------------+-----------------+--------------+----------------------------------------------------------------------------------------------+-------+----------+----------+---------+
|     43 | CA-2016-101343 | 17-Jul-16  | 22-Jul-16 | Standard Class | RA-19885    | Ruben Ausman   | Corporate | United States | Los Angeles | California | 90049       | West   | OFF-ST-10003479 | Office Supplies | Storage      | Eldon Base for stackable storage shelf, platinum                                             | 77.88 |        2 |     0.00 |  3.8940 |
|    514 | CA-2017-163405 | 21-Dec-17  | 25-Dec-17 | Standard Class | BN-11515    | Bradley Nguyen | Consumer  | United States | Los Angeles | California | 90049       | West   | OFF-AR-10003811 | Office Supplies | Art          | Newell 327                                                                                   |  6.63 |        3 |     0.00 |  1.7901 |
|    515 | CA-2017-163405 | 21-Dec-17  | 25-Dec-17 | Standard Class | BN-11515    | Bradley Nguyen | Consumer  | United States | Los Angeles | California | 90049       | West   | OFF-AR-10001246 | Office Supplies | Art          | Newell 317                                                                                   |  5.88 |        2 |     0.00 |  1.7052 |
|   1606 | US-2016-115819 | 19-Apr-16  | 24-Apr-16 | Second Class   | JO-15280    | Jas O'Carroll  | Consumer  | United States | Los Angeles | California | 90049       | West   | OFF-AR-10000823 | Office Supplies | Art          | Newell 307                                                                                   |  5.46 |        3 |     0.00 |  1.5288 |
|   1607 | US-2016-115819 | 19-Apr-16  | 24-Apr-16 | Second Class   | JO-15280    | Jas O'Carroll  | Consumer  | United States | Los Angeles | California | 90049       | West   | OFF-AR-10004456 | Office Supplies | Art          | Panasonic KP-4ABK Battery-Operated Pencil Sharpener                                          | 73.20 |        5 |     0.00 | 21.2280 |
|   1609 | US-2016-115819 | 19-Apr-16  | 24-Apr-16 | Second Class   | JO-15280    | Jas O'Carroll  | Consumer  | United States | Los Angeles | California | 90049       | West   | OFF-PA-10002377 | Office Supplies | Paper        | Adams Telephone Message Book W/Dividers/Space For Phone Numbers, 5 1/4"X8 1/2", 200/Messages | 22.72 |        4 |     0.00 | 10.2240 |
|   1807 | US-2016-116729 | 25-Dec-16  | 28-Dec-16 | First Class    | GK-14620    | Grace Kelly    | Corporate | United States | Los Angeles | California | 90049       | West   | OFF-PA-10002005 | Office Supplies | Paper        | Xerox 225                                                                                    | 45.36 |        7 |     0.00 | 21.7728 |
|   2060 | CA-2014-106439 | 31-Oct-14  | 04-Nov-14 | Standard Class | GG-14650    | Greg Guthrie   | Corporate | United States | Los Angeles | California | 90049       | West   | OFF-FA-10002975 | Office Supplies | Fasteners    | Staples                                                                                      | 11.34 |        3 |     0.00 |  5.2164 |
|   2061 | CA-2014-106439 | 31-Oct-14  | 04-Nov-14 | Standard Class | GG-14650    | Greg Guthrie   | Corporate | United States | Los Angeles | California | 90049       | West   | OFF-ST-10003996 | Office Supplies | Storage      | Letter/Legal File Tote with Clear Snap-On Lid, Black Granite                                 | 80.30 |        5 |     0.00 | 20.8780 |
|   2063 | CA-2014-106439 | 31-Oct-14  | 04-Nov-14 | Standard Class | GG-14650    | Greg Guthrie   | Corporate | United States | Los Angeles | California | 90049       | West   | OFF-PA-10000477 | Office Supplies | Paper        | Xerox 1952                                                                                   | 64.74 |       13 |     0.00 | 30.4278 |
+--------+----------------+------------+-----------+----------------+-------------+----------------+-----------+---------------+-------------+------------+-------------+--------+-----------------+-----------------+--------------+----------------------------------------------------------------------------------------------+-------+----------+----------+---------+
10 rows in set (0.013 sec)



mysql> -- 10. TOTAL SALES
SELECT ROUND(SUM(sales),2) AS total_sales FROM sales_data;
+-------------+
| total_sales |
+-------------+
|  2297201.07 |
+-------------+
1 row in set (0.112 sec)



mysql> -- 11. TOTAL ORDERS
SELECT COUNT(DISTINCT order_id) AS total_orders FROM sales_data;
+--------------+
| total_orders |
+--------------+
|         5009 |
+--------------+
1 row in set (0.242 sec)



mysql> -- 12. TOP 5 SPENDING CUSTOMERS
SELECT customer_id, customer_name, ROUND(SUM(sales),2) AS total_spending FROM sales_data GROUP BY customer_id, customer_name ORDER BY total_spending DESC LIMIT 5;
+-------------+---------------+----------------+
| customer_id | customer_name | total_spending |
+-------------+---------------+----------------+
| SM-20320    | Sean Miller   |       25043.07 |
| TC-20980    | Tamara Chand  |       19052.22 |
| RB-19360    | Raymond Buch  |       15117.35 |
| TA-21385    | Tom Ashbrook  |       14595.62 |
| AB-10105    | Adrian Barton |       14473.57 |
+-------------+---------------+----------------+
5 rows in set (0.219 sec)



mysql> -- 13. TOTAL SALES BY REGION
SELECT region, ROUND(SUM(sales),2) AS total_sales FROM sales_data GROUP BY region ORDER BY total_sales DESC;
+---------+-------------+
| region  | total_sales |
+---------+-------------+
| West    |   725457.93 |
| East    |   678781.36 |
| Central |   501239.88 |
| South   |   391721.90 |
+---------+-------------+
4 rows in set (0.158 sec)



mysql> -- 14. AVERAGE ORDER SIZE
SELECT ROUND(AVG(order_total),2) AS average_order_size FROM (SELECT order_id, SUM(sales) AS order_total FROM sales_data GROUP BY order_id) AS order_summary;
+--------------------+
| average_order_size |
+--------------------+
|             458.61 |
+--------------------+
1 row in set (0.203 sec)



mysql> -- 15. SALES BY CATEGORY
SELECT category, ROUND(SUM(sales),2) AS total_sales FROM sales_data GROUP BY category ORDER BY total_sales DESC;
+-----------------+-------------+
| category        | total_sales |
+-----------------+-------------+
| Technology      |   836154.10 |
| Furniture       |   741999.98 |
| Office Supplies |   719046.99 |
+-----------------+-------------+
3 rows in set (0.143 sec)



mysql> -- 16. TOP 5 PRODUCTS
SELECT product_name, ROUND(SUM(sales),2) AS total_sales FROM sales_data GROUP BY product_name ORDER BY total_sales DESC LIMIT 5;
+-----------------------------------------------------------------------------+-------------+
| product_name                                                                | total_sales |
+-----------------------------------------------------------------------------+-------------+
| Canon imageCLASS 2200 Advanced Copier                                       |    61599.83 |
| Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind |    27453.38 |
| Cisco TelePresence System EX90 Videoconferencing Unit                       |    22638.48 |
| HON 5400 Series Task Chairs for Big and Tall                                |    21870.57 |
| GBC DocuBind TL300 Electric Binding System                                  |    19823.48 |
+-----------------------------------------------------------------------------+-------------+
5 rows in set (0.197 sec)



mysql> -- 17. HIGHEST VALUE ORDER
SELECT order_id, ROUND(SUM(sales),2) AS order_value FROM sales_data GROUP BY order_id ORDER BY order_value DESC LIMIT 1;
+----------------+-------------+
| order_id       | order_value |
+----------------+-------------+
| CA-2014-145317 |    23661.24 |
+----------------+-------------+
1 row in set (0.188 sec)



mysql> -- 18. TOP 5 MOST PROFITABLE CUSTOMERS
SELECT customer_id, customer_name, ROUND(SUM(profit),2) AS total_profit FROM sales_data GROUP BY customer_id, customer_name ORDER BY total_profit DESC LIMIT 5;
+-------------+---------------+--------------+
| customer_id | customer_name | total_profit |
+-------------+---------------+--------------+
| TC-20980    | Tamara Chand  |      8981.32 |
| RB-19360    | Raymond Buch  |      6976.10 |
| SC-20095    | Sanjit Chand  |      5757.41 |
| HL-15040    | Hunter Lopez  |      5622.43 |
| AB-10105    | Adrian Barton |      5444.81 |
+-------------+---------------+--------------+
5 rows in set (0.207 sec)



mysql> -- 19. SALES BY CUSTOMER SEGMENT
SELECT segment, ROUND(SUM(sales),2) AS total_sales FROM sales_data GROUP BY segment ORDER BY total_sales DESC;
+-------------+-------------+
| segment     | total_sales |
+-------------+-------------+
| Consumer    |  1161401.34 |
| Corporate   |   706146.44 |
| Home Office |   429653.29 |
+-------------+-------------+
3 rows in set (0.111 sec)



mysql> -- 20. PROFIT BY REGION
SELECT region, ROUND(SUM(profit),2) AS total_profit FROM sales_data GROUP BY region ORDER BY total_profit DESC;
+---------+--------------+
| region  | total_profit |
+---------+--------------+
| West    |    108418.45 |
| East    |     91522.78 |
| South   |     46749.43 |
| Central |     39706.36 |
+---------+--------------+
4 rows in set (0.144 sec)



mysql> -- 21. AVERAGE DISCOUNT BY CATEGORY
SELECT category, ROUND(AVG(discount),2) AS average_discount FROM sales_data GROUP BY category ORDER BY average_discount DESC;
+-----------------+------------------+
| category        | average_discount |
+-----------------+------------------+
| Furniture       |             0.17 |
| Office Supplies |             0.16 |
| Technology      |             0.13 |
+-----------------+------------------+
3 rows in set (0.158 sec)

mysql>