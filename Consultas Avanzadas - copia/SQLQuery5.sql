--triger aplicar a order details
--crear un trigger que te permita gestinar una venta,en la cual se debe
--actualizar la existencia del producto vendido,bajo las sig:
--condiciones:
--1.-Verificar si la existencia es suficiente, si la existencia no
--es suficiente cancelar la inserccion
--2.-si es suficiente agregar la venta y disminuir el stock del producto
--1.-insertar en orders
--2.-insertar en ordersDetails
--3.-Verificar si el unistock es suficiente 
--4.-si es suficiente aceptar la inserccion y disminuir el unistok lo vendido 
CREATE TRIGGER gestionar_venta 
BEFORE INSERT ON order_details
FOR EACH ROW
BEGIN
    -- 1. Verificar existencia del producto
    DECLARE _existencia DECIMAL(10,2);

    SELECT stock INTO _existencia
    FROM products
    WHERE product_id = NEW.product_id;

    IF _existencia < NEW.quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Existencia insuficiente';
        RETURN;
    END IF;

    -- 2. Insertar en orders
    INSERT INTO orders (order_date, customer_id)
    VALUES (NEW.order_date, NEW.customer_id);

    SET @order_id = LAST_INSERT_ID();

    -- 3. Insertar en order_details
    INSERT INTO order_details (order_id, product_id, quantity, unit_price)
    VALUES (@order_id, NEW.product_id, NEW.quantity, NEW.unit_price);

    -- 4. Disminuir stock del producto
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END;
