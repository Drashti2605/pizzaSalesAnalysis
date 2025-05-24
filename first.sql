create database pizzaDb;
USE pizzaDb;
CREATE TABLE pizza_sales (
    order_id INT,
    date DATE,
    time TIME,
    pizza_id VARCHAR(50),
    quantity INT
);
SELECT * FROM pizza_sales LIMIT 5000;
select sum(total_price) as total_revenue from pizza_sales ; 
select sum(quantity) as total_quantity from pizza_sales;
select count(distinct order_id) as Total_orders from pizza_sales ;
select cast(sum(quantity) as decimal(10,2)) /
cast( count(distinct order_id) as decimal(10,2)) as average_pizzas_per_order from pizza_sales;

SELECT COUNT(*) 
FROM pizza_sales 
WHERE order_date IS NULL;


SELECT 
    sub.order_day, 
    sub.total_orders
FROM (
    SELECT 
        DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS order_day, 
        COUNT(DISTINCT order_id) AS total_orders 
    FROM 
        pizza_sales
    GROUP BY 
        DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y'))
) AS sub
ORDER BY 
    FIELD(sub.order_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
SELECT 
    MONTH(STR_TO_DATE(order_date, '%m/%d/%Y')) AS month_number,
    MONTHNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS month_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    pizza_sales
GROUP BY 
    month_number, month_name
ORDER BY 
    month_number;
 
 SELECT 
    pizza_category, 
    SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS percentage_of_total
FROM 
    pizza_sales 
GROUP BY 
    pizza_category;

 SELECT 
    pizza_size, 
    SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS pct
FROM 
    pizza_sales 
GROUP BY 
    pizza_size
order by pct desc ;

SELECT 
    pizza_name, 
    SUM(total_price) AS Total_Revenue 
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Revenue DESC
LIMIT 5;

SELECT 
    pizza_name, 
    SUM(total_price) AS Total_Revenue 
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Revenue asc
LIMIT 5;

SELECT 
    pizza_name, 
    SUM(quantity) AS Total_quantity 
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_quantity DESC
LIMIT 5;

SELECT 
    pizza_name, 
    SUM(quantity) AS Total_quantity 
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_quantity aSC
LIMIT 5;

