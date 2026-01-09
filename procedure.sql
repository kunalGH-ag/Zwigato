DELIMITER $$
CREATE PROCEDURE sp_finalize_order(
  IN p_order_id BIGINT UNSIGNED,
  IN p_delivery_fee DECIMAL(10,2),
  IN p_promo_code VARCHAR(20)
)
BEGIN
  DECLARE v_subtotal DECIMAL(10,2) DEFAULT 0.00;
  DECLARE v_discount DECIMAL(10,2) DEFAULT 0.00;
  DECLARE v_pct DECIMAL(5,2);
  DECLARE v_max DECIMAL(10,2);
  DECLARE v_min_order DECIMAL(10,2);
  DECLARE v_now DATE;

  SET v_now = CURRENT_DATE();

  SELECT COALESCE(SUM(quantity * unit_price),0.00)
    INTO v_subtotal
  FROM order_items
  WHERE order_id = p_order_id;

  IF p_promo_code IS NOT NULL AND p_promo_code <> '' THEN
    SELECT discount_pct, COALESCE(max_discount,0), COALESCE(min_order_value,0)
      INTO v_pct, v_max, v_min_order
    FROM promos
    WHERE promo_code = p_promo_code
      AND (starts_on IS NULL OR v_now >= starts_on)
      AND (ends_on   IS NULL OR v_now <= ends_on)
    LIMIT 1;

    IF v_pct IS NOT NULL AND v_subtotal >= v_min_order THEN
      SET v_discount = LEAST( (v_subtotal * v_pct/100.0), v_max );
      INSERT INTO order_promos(order_id, promo_code, applied_discount)
      VALUES (p_order_id, p_promo_code, v_discount)
      ON DUPLICATE KEY UPDATE applied_discount = VALUES(applied_discount);
    END IF;
  END IF;

  UPDATE orders
  SET subtotal_amount = v_subtotal,
      delivery_fee    = p_delivery_fee,
      discount_amount = v_discount,
      total_amount    = v_subtotal + p_delivery_fee - v_discount
  WHERE order_id = p_order_id;
END $$
DELIMITER ;
