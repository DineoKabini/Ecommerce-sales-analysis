CREATE DATABASE amazon_sales;

CREATE TABLE IF NOT EXISTS amazon_sales (
    order_id TEXT,
    date DATE,
    status TEXT,
    fulfilment TEXT,
    sales_channel TEXT,
    category TEXT,
    size TEXT,
    quantity INT,
    revenue FLOAT,
    ship_city TEXT,
    ship_state TEXT
);

SELECT COUNT(*) FROM amazon_sales;

SELECT COUNT(*) AS total_rows
FROM amazon_sales;

CREATE TABLE amazon_sales (
    order_id TEXT PRIMARY KEY,
    date DATE,
    status TEXT,
    fulfilment TEXT,
    sales_channel TEXT,
    category TEXT,
    size TEXT,
    quantity INT CHECK (quantity >= 0),
    revenue FLOAT CHECK (revenue >= 0),
    ship_city TEXT,
    ship_state TEXT
);


SELECT category, SUM(revenue) AS total_revenue
FROM amazon_sales
GROUP BY category
ORDER BY total_revenue DESC;


SELECT category, SUM(revenue) AS total_revenue
FROM amazon_sales
GROUP BY category
ORDER BY total_revenue DESC;


SELECT DATE_TRUNC('month', date) AS month,
       SUM(revenue) AS revenue
FROM amazon_sales
GROUP BY month
ORDER BY month;


SELECT ship_state, SUM(revenue) AS revenue
FROM amazon_sales
GROUP BY ship_state
ORDER BY revenue DESC
LIMIT 10;

SELECT fulfilment, SUM(revenue) AS revenue
FROM amazon_sales
GROUP BY fulfilment;


SELECT status, COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY status;