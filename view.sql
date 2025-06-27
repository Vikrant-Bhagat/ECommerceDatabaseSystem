CREATE VIEW MonthlySales AS
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS revenue,
    AVG(total_amount) AS avg_order_value
FROM Orders
GROUP BY month
ORDER BY month;