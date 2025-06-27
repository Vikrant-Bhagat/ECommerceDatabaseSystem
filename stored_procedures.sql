DELIMITER //
CREATE PROCEDURE ProcessOrder(IN order_id INT)
BEGIN
    -- Update order status
    UPDATE Orders SET status = 'Shipped' WHERE order_id = order_id;
    
    -- Log the update
    INSERT INTO Inventory_Logs (product_id, old_quantity, new_quantity)
    SELECT product_id, stock_quantity, stock_quantity - quantity
    FROM Order_Items oi
    JOIN Products p ON oi.product_id = p.product_id
    WHERE oi.order_id = order_id;
    
    SELECT CONCAT('Order ', order_id, ' processed successfully.') AS message;
END //
DELIMITER ;

-- Call the procedure
CALL ProcessOrder(1);