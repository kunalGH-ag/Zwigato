-- Order 1 (Kunal from Hot Slice)
INSERT INTO orders (customer_id, restaurant_id, address_id)
VALUES (1, 1, 1);
SET @o1 := LAST_INSERT_ID();
INSERT INTO order_items (order_id, item_id, quantity, unit_price)
SELECT @o1, item_id, 2, price FROM menu_items WHERE name='Margherita Pizza';
CALL sp_finalize_order(@o1, 30, 'NEW50');
UPDATE orders SET status='DELIVERED', delivered_at=NOW() WHERE order_id=@o1;
INSERT INTO ratings (order_id, restaurant_id, customer_id, stars, comment)
VALUES (@o1, 1, 1, 5, 'Excellent taste!');

-- Order 2 (Aisha from Biryani Hub)
INSERT INTO orders (customer_id, restaurant_id, address_id)
VALUES (2, 2, 2);
SET @o2 := LAST_INSERT_ID();
INSERT INTO order_items (order_id, item_id, quantity, unit_price)
SELECT @o2, item_id, 1, price FROM menu_items WHERE name='Chicken Biryani';
CALL sp_finalize_order(@o2, 25, 'NEW50');
UPDATE orders SET status='DELIVERED', delivered_at=NOW() WHERE order_id=@o2;
INSERT INTO ratings (order_id, restaurant_id, customer_id, stars, comment)
VALUES (@o2, 2, 2, 4, 'Good, but slightly spicy.');

-- Order 3 (Rohit from Cheesy Crust)
INSERT INTO orders (customer_id, restaurant_id, address_id)
VALUES (3, 4, 3);
SET @o3 := LAST_INSERT_ID();
INSERT INTO order_items (order_id, item_id, quantity, unit_price)
SELECT @o3, item_id, 1, price FROM menu_items WHERE name='Cheese Burst Pizza';
CALL sp_finalize_order(@o3, 35, NULL);
UPDATE orders SET status='DELIVERED', delivered_at=NOW() WHERE order_id=@o3;
INSERT INTO ratings (order_id, restaurant_id, customer_id, stars, comment)
VALUES (@o3, 4, 3, 5, 'Cheese overload! Loved it.');

-- Order 4 (Simran from Tandoori Tales)
INSERT INTO orders (customer_id, restaurant_id, address_id)
VALUES (4, 3, 4);
SET @o4 := LAST_INSERT_ID();
INSERT INTO order_items (order_id, item_id, quantity, unit_price)
SELECT @o4, item_id, 1, price FROM menu_items WHERE name='Paneer Tikka';
CALL sp_finalize_order(@o4, 40, NULL);
UPDATE orders SET status='DELIVERED', delivered_at=NOW() WHERE order_id=@o4;
INSERT INTO ratings (order_id, restaurant_id, customer_id, stars, comment)
VALUES (@o4, 3, 4, 4, 'Soft paneer and smoky flavor.');

-- Order 5 (Priya from Spice Villa)
INSERT INTO orders (customer_id, restaurant_id, address_id)
VALUES (5, 5, 5);
SET @o5 := LAST_INSERT_ID();
INSERT INTO order_items (order_id, item_id, quantity, unit_price)
SELECT @o5, item_id, 2, price FROM menu_items WHERE name='Masala Dosa';
CALL sp_finalize_order(@o5, 20, 'NEW50');
UPDATE orders SET status='DELIVERED', delivered_at=NOW() WHERE order_id=@o5;
INSERT INTO ratings (order_id, restaurant_id, customer_id, stars, comment)
VALUES (@o5, 5, 5, 5, 'Crispy and authentic!');
