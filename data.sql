-- Insert Categories
INSERT INTO Categories (category_name, description) VALUES 
('Electronics', 'Smartphones, Laptops, etc.'),
('Clothing', 'T-shirts, Jeans, etc.'),
('Books', 'Fiction, Non-fiction');

-- Insert Products
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES 
('iPhone 13', 1, 799.99, 50),
('MacBook Pro', 1, 1299.99, 30),
('Cotton T-Shirt', 2, 19.99, 200),
('Python Programming Book', 3, 39.99, 100);

-- Insert Customers
INSERT INTO Customers (first_name, last_name, email, phone) VALUES 
('Alice', 'Johnson', 'alice@example.com', '1234567890'),
('Bob', 'Smith', 'bob@example.com', '9876543210');

-- Insert Orders
INSERT INTO Orders (customer_id, total_amount, status) VALUES 
(1, 819.98, 'Processing'),  -- iPhone + T-Shirt
(2, 1299.99, 'Pending');    -- MacBook Pro

-- Insert Order Items
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES 
(1, 1, 1, 799.99),  -- iPhone
(1, 3, 1, 19.99),   -- T-Shirt
(2, 2, 1, 1299.99); -- MacBook

-- Insert Payments
INSERT INTO Payments (order_id, payment_method, amount, status) VALUES 
(1, 'Credit Card', 819.98, 'Completed'),
(2, 'PayPal', 1299.99, 'Pending');