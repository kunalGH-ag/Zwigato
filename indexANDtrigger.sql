CREATE INDEX idx_orders_customer   ON orders(customer_id, placed_at);
CREATE INDEX idx_orders_restaurant ON orders(restaurant_id, placed_at);
CREATE INDEX idx_menu_restaurant   ON menu_items(restaurant_id, is_available);
CREATE INDEX idx_delivery_partner  ON delivery_assignments(partner_id, assigned_at);
CREATE INDEX idx_payments_status   ON payments(status, paid_at);


DELIMITER $$
CREATE TRIGGER trg_after_rating
AFTER INSERT ON ratings
FOR EACH ROW
BEGIN
  UPDATE restaurants r
  SET r.avg_rating = ROUND(((r.avg_rating * r.rating_count) + NEW.stars) / (r.rating_count + 1), 2),
      r.rating_count = r.rating_count + 1
  WHERE r.restaurant_id = NEW.restaurant_id;
END $$
DELIMITER ;
