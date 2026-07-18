USE retailsalesdb;

DROP TABLE IF EXISTS retail_sales_cleaned;
USE retailsalesdb;

CREATE TABLE retail_sales_cleaned (
    row_id INT,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(12,2),
    month VARCHAR(20),
    year INT
);
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

SHOW VARIABLES LIKE 'local_infile';
SELECT VERSION();

LOAD DATA LOCAL INFILE 'C:/Users/hp/OneDrive/Desktop/PORTFOLIO/RETAIL SALES ANALYTICS/Data/Cleaned/retail_sales_cleaned.csv'
INTO TABLE retail_sales_cleaned
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    month,
    year
);

DROP TABLE retail_sales_cleaned;

CREATE TABLE retail_sales_cleaned (
    row_id INT,
    order_id VARCHAR(30),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(12,2),
    month VARCHAR(20),
    year INT
);

LOAD DATA LOCAL INFILE 'C:/Users/hp/OneDrive/Desktop/PORTFOLIO/RETAIL SALES ANALYTICS/Data/Cleaned/retail_sales_cleaned.csv'
INTO TABLE retail_sales_cleaned
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    month,
    year
);

SELECT COUNT(*) AS total_rows
FROM retail_sales_cleaned;

SELECT ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales_cleaned;

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM retail_sales_cleaned;

SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM retail_sales_cleaned;

SELECT
    category,
    ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales_cleaned
GROUP BY category
ORDER BY Total_Sales DESC;

SELECT
    region,
    ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales_cleaned
GROUP BY region
ORDER BY Total_Sales DESC;

SELECT
    state,
    ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales_cleaned
GROUP BY state
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    city,
    ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales_cleaned
GROUP BY city
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales_cleaned
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    ship_mode,
    COUNT(*) AS Total_Orders
FROM retail_sales_cleaned
GROUP BY ship_mode
ORDER BY Total_Orders DESC;

SELECT
    year,
    ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales_cleaned
GROUP BY year
ORDER BY year;