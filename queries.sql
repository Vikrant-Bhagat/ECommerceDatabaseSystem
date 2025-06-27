SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING total_spent > 1000
ORDER BY total_spent DESC;

SELECT 
    product_name,
    stock_quantity,
    CASE 
        WHEN stock_quantity < 10 THEN 'CRITICAL'
        WHEN stock_quantity < 30 THEN 'LOW'
        ELSE 'OK'
    END AS stock_status
FROM Products;

SELECT 
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY revenue DESC;