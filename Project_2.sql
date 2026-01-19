# Total Records
select count(*) as total_rows from portfolio.products;

#unique orders 
select count(distinct order_id) as total_orders from products;

#data range 

select min(order_date) as first_order, max(order_date) as last_order from products;

# check nulls 

SELECT
  SUM(order_id IS NULL) AS null_orders,
  SUM(customer_id IS NULL) AS null_customers,
  SUM(product_id IS NULL) AS null_products,
  SUM(sales IS NULL) AS null_sales,
  SUM(profit IS NULL) AS null_profit
FROM products;



# Duplicateorderlines 

SELECT order_id, product_id, COUNT(*)
FROM products
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;




#Totalsales,profit,quantity

SELECT
  ROUND(SUM(sales),2) AS total_sales,
  ROUND(SUM(profit),2) AS total_profit,
  SUM(quantity) AS total_quantity
FROM products;




#profit margin 
SELECT
  ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM products;




#yearly salestrend 
SELECT
  order_year,
  ROUND(SUM(sales),2) AS yearly_sales
FROM products
GROUP BY order_year
ORDER BY order_year;




# monthlty trend 

SELECT
  order_year,
  order_month,
  ROUND(SUM(sales),2) AS monthly_sales
FROM products
GROUP BY order_year, order_month
ORDER BY order_year, order_month;




#sales by category  
SELECT
  category,
  ROUND(SUM(sales),2) AS total_sales,
  ROUND(SUM(profit),2) AS total_profit
FROM products
GROUP BY category
ORDER BY total_sales DESC;





# sub category performance 


SELECT
  sub_category,
  ROUND(SUM(sales),2) AS total_sales,
  ROUND(SUM(profit),2) AS total_profit
FROM products
GROUP BY sub_category
ORDER BY total_profit DESC;




# top10 products by sales 

SELECT
  product_name,
  ROUND(SUM(sales),2) AS total_sales
FROM products
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;



# loss making products 
SELECT
  product_name,
  ROUND(SUM(profit),2) AS total_profit
FROM products
GROUP BY product_name
HAVING total_profit < 0
ORDER BY total_profit DESC
LIMIT 10;



#Top customers by sales 

SELECT
  customer_name,
  ROUND(SUM(sales),2) AS total_sales
FROM products
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


# Repeat customers 


SELECT
  customer_name,
  COUNT(DISTINCT order_id) AS total_orders
FROM products
GROUP BY customer_name
HAVING total_orders > 1
ORDER BY total_orders DESC;




# sales by region 


SELECT
  region,
  ROUND(SUM(sales),2) AS total_sales,
  ROUND(SUM(profit),2) AS total_profit
FROM products
GROUP BY region
ORDER BY total_sales DESC;





# statelevelprofitability

SELECT
  state,
  ROUND(SUM(profit),2) AS total_profit
FROM products
GROUP BY state
ORDER BY total_profit DESC;








