CREATE OR REPLACE VIEW vw_current_orders AS
SELECT o.order_id, c.name AS customer, r.name AS restaurant, o.status, o.total_amount, o.placed_at
FROM orders o
JOIN customers c  ON c.customer_id  = o.customer_id
JOIN restaurants r ON r.restaurant_id = o.restaurant_id
WHERE o.status IN ('PLACED','ACCEPTED','PREPARING','DISPATCHED');

CREATE OR REPLACE VIEW vw_restaurant_kpis AS
SELECT r.restaurant_id, r.name,
       SUM(o.status = 'DELIVERED') AS delivered_orders,
       ROUND(AVG(NULLIF(o.total_amount,0)),2) AS avg_ticket_size,
       ROUND(AVG(TIMESTAMPDIFF(SECOND, o.placed_at, o.delivered_at))/60.0,2) AS avg_delivery_minutes
FROM restaurants r
LEFT JOIN orders o ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id, r.name;
