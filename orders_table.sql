

CREATE TABLE orders (
  order_id        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id     BIGINT UNSIGNED NOT NULL,
  restaurant_id   BIGINT UNSIGNED NOT NULL,
  address_id      BIGINT UNSIGNED NOT NULL,
  status          ENUM('PLACED','ACCEPTED','PREPARING','DISPATCHED','DELIVERED','CANCELLED','REFUNDED')
                    NOT NULL DEFAULT 'PLACED',
  subtotal_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  delivery_fee    DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  discount_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  total_amount    DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  placed_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  delivered_at    TIMESTAMP NULL DEFAULT NULL,
  CONSTRAINT fk_order_customer   FOREIGN KEY (customer_id)   REFERENCES customers(customer_id),
  CONSTRAINT fk_order_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
  CONSTRAINT fk_order_address    FOREIGN KEY (address_id)    REFERENCES customer_addresses(address_id)
) ENGINE=InnoDB;

CREATE TABLE order_items (
  order_item_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_id      BIGINT UNSIGNED NOT NULL,
  item_id       BIGINT UNSIGNED NOT NULL,
  quantity      INT NOT NULL,
  unit_price    DECIMAL(10,2) NOT NULL,
  CONSTRAINT chk_qty CHECK (quantity > 0),
  CONSTRAINT chk_price_oi CHECK (unit_price >= 0),
  CONSTRAINT fk_oi_order FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
  CONSTRAINT fk_oi_item  FOREIGN KEY (item_id)  REFERENCES menu_items(item_id)
) ENGINE=InnoDB;
