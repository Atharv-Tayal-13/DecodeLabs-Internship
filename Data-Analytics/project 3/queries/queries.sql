SELECT *
FROM orders
LIMIT 10;

SELECT OrderID, Product, Quantity, UnitPrice, TotalPrice
FROM orders
LIMIT 10;

SELECT OrderID, Product, TotalPrice, OrderStatus
FROM orders
WHERE OrderStatus = 'Delivered'
LIMIT 10;

SELECT OrderID, Product, TotalPrice
FROM orders
WHERE TotalPrice > 2000
ORDER BY TotalPrice DESC;

SELECT OrderID, Product, Quantity, UnitPrice, TotalPrice
FROM orders
WHERE Product = 'Laptop' AND TotalPrice > 1000
ORDER BY TotalPrice DESC;

SELECT OrderID, ShippingAddress
FROM orders
WHERE ShippingAddress LIKE '%Main St%'
LIMIT 10;

SELECT OrderID, Product, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;

SELECT OrderID, Product, TotalPrice
FROM orders
ORDER BY TotalPrice ASC
LIMIT 10;

SELECT Product, COUNT(*) AS order_count
FROM orders
GROUP BY Product
ORDER BY order_count DESC;

SELECT Product, SUM(TotalPrice) AS total_revenue
FROM orders
GROUP BY Product
ORDER BY total_revenue DESC;

SELECT Product, ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM orders
GROUP BY Product
ORDER BY avg_order_value DESC;

SELECT OrderStatus, COUNT(*) AS order_count
FROM orders
GROUP BY OrderStatus
ORDER BY order_count DESC;

SELECT PaymentMethod, COUNT(*) AS order_count, SUM(TotalPrice) AS total_revenue
FROM orders
GROUP BY PaymentMethod
ORDER BY total_revenue DESC;

SELECT ReferralSource, COUNT(*) AS order_count, SUM(TotalPrice) AS total_revenue
FROM orders
GROUP BY ReferralSource
ORDER BY total_revenue DESC;

SELECT Product, COUNT(*) AS order_count
FROM orders
GROUP BY Product
HAVING COUNT(*) > 170
ORDER BY order_count DESC;

SELECT PaymentMethod, ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM orders
GROUP BY PaymentMethod
HAVING AVG(TotalPrice) > 1000
ORDER BY avg_order_value DESC;

SELECT strftime('%Y-%m', Date) AS order_month, COUNT(*) AS order_count, SUM(TotalPrice) AS total_revenue
FROM orders
GROUP BY order_month
ORDER BY order_month;

SELECT COALESCE(CouponCode, 'NONE') AS coupon_used, COUNT(*) AS order_count
FROM orders
GROUP BY coupon_used
ORDER BY order_count DESC;

SELECT Product,
       SUM(TotalPrice) AS total_revenue,
       ROUND(SUM(TotalPrice) * 100.0 / (SELECT SUM(TotalPrice) FROM orders), 2) AS pct_of_total_revenue
FROM orders
GROUP BY Product
ORDER BY pct_of_total_revenue DESC;

SELECT OrderID, Product, Quantity, UnitPrice, TotalPrice, OrderStatus
FROM orders
ORDER BY TotalPrice DESC
LIMIT 5;

SELECT CustomerID, COUNT(*) AS order_count
FROM orders
GROUP BY CustomerID
HAVING COUNT(*) > 1
ORDER BY order_count DESC;

SELECT
    SUM(CASE WHEN OrderStatus IN ('Cancelled', 'Returned') THEN 1 ELSE 0 END) AS cancelled_returned_count,
    COUNT(*) AS total_orders,
    ROUND(SUM(CASE WHEN OrderStatus IN ('Cancelled', 'Returned') THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS cancelled_returned_pct
FROM orders;
