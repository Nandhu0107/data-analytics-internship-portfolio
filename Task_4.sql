mysql> use retail_data;
Database changed

mysql> SELECT COUNT(*) AS Total_Rows FROM retail_sales;
+------------+
| Total_Rows |
+------------+
|      99938 |
+------------+
1 row in set (0.091 sec)

mysql> SELECT SUM(Revenue) AS Total_Revenue FROM retail_sales;
+---------------+
| Total_Revenue |
+---------------+
|   39310447.29 |
+---------------+
1 row in set (0.380 sec)

mysql> SELECT SUM(Units) AS Total_Units FROM retail_sales;
+-------------+
| Total_Units |
+-------------+
|      299655 |
+-------------+
1 row in set (0.319 sec)

mysql> SELECT Category, SUM(Revenue) AS Total_Revenue FROM retail_sales GROUP BY Category ORDER BY Total_Revenue DESC;
+---------------+---------------+
| Category      | Total_Revenue |
+---------------+---------------+
| Fruits        |    4982268.81 |
| Grocery       |    4945001.82 |
| Snacks        |    4939488.90 |
| Beverages     |    4937903.96 |
| Home Care     |    4929320.05 |
| Vegetables    |    4910239.37 |
| Personal Care |    4882155.53 |
| Dairy         |    4784068.85 |
+---------------+---------------+
8 rows in set (0.946 sec)

mysql> SELECT City, SUM(Revenue) AS Total_Revenue FROM retail_sales GROUP BY City ORDER BY Total_Revenue DESC;
+-----------+---------------+
| City      | Total_Revenue |
+-----------+---------------+
| Kolkata   |    4992264.89 |
| Delhi     |    4982023.69 |
| Hyderabad |    4948167.61 |
| Chennai   |    4898400.72 |
| Pune      |    4897559.81 |
| Mumbai    |    4894321.10 |
| Ahmedabad |    4875431.03 |
| Bengaluru |    4822278.44 |
+-----------+---------------+
8 rows in set (0.927 sec)

mysql> SELECT Brand, SUM(Revenue) AS Total_Revenue FROM retail_sales GROUP BY Brand ORDER BY Total_Revenue DESC LIMIT 10;
+-----------+---------------+
| Brand     | Total_Revenue |
+-----------+---------------+
| ITC       |    5014497.72 |
| HUL       |    4964069.02 |
| Nestle    |    4939478.50 |
| Britannia |    4938214.86 |
| Amul      |    4935700.90 |
| Tata      |    4865956.72 |
| PepsiCo   |    4849249.32 |
| Parle     |    4803280.25 |
+-----------+---------------+
8 rows in set (0.854 sec)

mysql>