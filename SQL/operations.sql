-- 1) Total Revenue ?

SELECT round(sum(payment_value),2) AS 'Total Revenue' FROM ecommerce_data ; 

-- 2) Highest Revenue Category ?

SELECT 
	product_category_name AS 'Product Category',
    round(sum(payment_value),2) AS 'total_revenue'
FROM ecommerce_data
GROUP BY product_category_name
ORDER BY total_revenue DESC
LIMIT 1;

-- 3) Which State Generates The Most Revenue ?

SELECT 
	customer_state AS 'State',
	round(sum(payment_value),2) AS 'total_revenue' 
FROM ecommerce_data
GROUP BY customer_state
ORDER BY total_revenue DESC
LIMIT 1;

-- 4) Monthly Revenue Trend ?

-- SELECT     
--     DATE_FORMAT(order_purchase_timestamp,'%M') AS Month_,
--     YEAR(order_purchase_timestamp) AS Year_,
--     ROUND(SUM(payment_value),2) AS 'Revenue'

-- FROM ecommerce_data
-- 	GROUP BY 
-- 		Month_,
-- 		Year_,
-- 		MONTH(order_purchase_timestamp)
-- 	ORDER BY 
-- 		Year_,
-- 		MONTH(order_purchase_timestamp);

SELECT     
    DATE_FORMAT(Purchase_Date,'%M') AS Month_,
    YEAR(Purchase_Date) AS Year_,
    ROUND(SUM(payment_value),2) AS 'Revenue'

FROM ecommerce_data
GROUP BY 
		Month_,
		Year_,
		MONTH(Purchase_Date)
ORDER BY 
		Year_ asc ;

