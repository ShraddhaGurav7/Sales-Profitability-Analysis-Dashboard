CREATE DATABASE superstore_analysis;
USE superstore_analysis;
CREATE TABLE sales_data (
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT
);
SELECT category,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       ROUND(SUM(profit)/SUM(sales), 2) AS profit_margin
FROM sales_data
GROUP BY category
ORDER BY total_profit DESC;
SELECT discount,
       ROUND(AVG(sales),2) AS avg_sales,
       ROUND(AVG(profit),2) AS avg_profit
FROM sales_data
GROUP BY discount
ORDER BY discount;
SELECT sub_category,
       SUM(profit) AS total_profit
FROM sales_data
GROUP BY sub_category
HAVING total_profit < 0
ORDER BY total_profit;
SELECT region,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_profit DESC;
SELECT segment,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales_data
GROUP BY segment
ORDER BY total_sales DESC;
SELECT sub_category,
       SUM(profit) AS total_profit,
       RANK() OVER (ORDER BY SUM(profit) DESC) AS profit_rank
FROM sales_data
GROUP BY sub_category;
SELECT sub_category,
       SUM(profit) AS total_profit
FROM sales_data
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 10;
SELECT category, sub_category, region, discount, profit
FROM sales_data
WHERE profit < 0
ORDER BY discount DESC;