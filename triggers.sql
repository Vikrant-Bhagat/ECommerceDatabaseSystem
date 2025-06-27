DELIMITER //
CREATE TRIGGER After_Order_Insert
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    -- Decrease stock
    UPDATE Products 
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
    
    -- Log stock change
    INSERT INTO Inventory_Logs (product_id, old_quantity, new_quantity)
    VALUES (NEW.product_id, (SELECT stock_quantity FROM Products WHERE product_id = NEW.product_id), 
            (SELECT stock_quantity FROM Products WHERE product_id = NEW.product_id) - NEW.quantity);
END //
DELIMITER ;