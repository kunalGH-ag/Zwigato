drop database food_db;
CREATE database IF NOT EXISTS food_db;
USE food_db;

CREATE TABLE customers (
  customer_id  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name         VARCHAR(100) NOT NULL,
  email        VARCHAR(120) NOT NULL UNIQUE,
  phone        VARCHAR(15)  NOT NULL UNIQUE,
  created_at   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE customer_addresses (
  address_id   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id  BIGINT UNSIGNED NOT NULL,
  label        VARCHAR(40) NOT NULL, -- Home/Office
  line1        VARCHAR(150) NOT NULL,
  line2        VARCHAR(150),
  city         VARCHAR(80) NOT NULL,
  pincode      VARCHAR(10) NOT NULL,
  latitude     DECIMAL(9,6),
  longitude    DECIMAL(9,6),
  is_default   TINYINT(1) NOT NULL DEFAULT 0,
  CONSTRAINT fk_addr_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
