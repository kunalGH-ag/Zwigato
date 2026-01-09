CREATE TABLE delivery_partners (
  partner_id  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(100) NOT NULL,
  phone       VARCHAR(15)  NOT NULL UNIQUE,
  is_active   TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

CREATE TABLE delivery_assignments (
  assignment_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_id      BIGINT UNSIGNED NOT NULL UNIQUE,
  partner_id    BIGINT UNSIGNED NOT NULL,
  assigned_at   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  picked_at     TIMESTAMP NULL DEFAULT NULL,
  delivered_at  TIMESTAMP NULL DEFAULT NULL,
  CONSTRAINT fk_da_order   FOREIGN KEY (order_id)  REFERENCES orders(order_id)  ON DELETE CASCADE,
  CONSTRAINT fk_da_partner FOREIGN KEY (partner_id) REFERENCES delivery_partners(partner_id)
) ENGINE=InnoDB;

CREATE TABLE payments (
  payment_id   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_id     BIGINT UNSIGNED NOT NULL UNIQUE,
  method       ENUM('CARD','UPI','COD','WALLET') NOT NULL,
  status       ENUM('PENDING','SUCCESS','FAILED','REFUNDED') NOT NULL,
  paid_amount  DECIMAL(10,2) NOT NULL,
  txn_ref      VARCHAR(64),
  paid_at      TIMESTAMP NULL DEFAULT NULL,
  CONSTRAINT chk_paid_amt CHECK (paid_amount >= 0),
  CONSTRAINT fk_pay_order FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ratings (
  rating_id     BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_id      BIGINT UNSIGNED NOT NULL UNIQUE,
  restaurant_id BIGINT UNSIGNED NOT NULL,
  customer_id   BIGINT UNSIGNED NOT NULL,
  stars         INT NOT NULL,
  comment       VARCHAR(500),
  rated_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_stars CHECK (stars BETWEEN 1 AND 5),
  CONSTRAINT fk_rate_order      FOREIGN KEY (order_id)      REFERENCES orders(order_id),
  CONSTRAINT fk_rate_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
  CONSTRAINT fk_rate_customer   FOREIGN KEY (customer_id)   REFERENCES customers(customer_id)
) ENGINE=InnoDB;

CREATE TABLE promos (
  promo_code    VARCHAR(20) NOT NULL PRIMARY KEY,
  description   VARCHAR(150),
  discount_pct  DECIMAL(5,2),
  max_discount  DECIMAL(10,2) DEFAULT 0,
  starts_on     DATE,
  ends_on       DATE,
  min_order_value DECIMAL(10,2) DEFAULT 0,
  CONSTRAINT chk_pct CHECK (discount_pct BETWEEN 0 AND 100)
) ENGINE=InnoDB;

CREATE TABLE order_promos (
  order_id         BIGINT UNSIGNED NOT NULL,
  promo_code       VARCHAR(20) NOT NULL,
  applied_discount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY(order_id, promo_code),
  CONSTRAINT fk_op_order FOREIGN KEY (order_id)   REFERENCES orders(order_id) ON DELETE CASCADE,
  CONSTRAINT fk_op_promo FOREIGN KEY (promo_code) REFERENCES promos(promo_code)
) ENGINE=InnoDB;
