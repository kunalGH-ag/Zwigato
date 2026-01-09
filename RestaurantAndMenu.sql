

CREATE TABLE restaurants (
  restaurant_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name          VARCHAR(150) NOT NULL,
  city          VARCHAR(80)  NOT NULL,
  is_active     TINYINT(1) NOT NULL DEFAULT 1,
  avg_rating    DECIMAL(3,2) NOT NULL DEFAULT 0.00,
  rating_count  INT NOT NULL DEFAULT 0,
  created_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE menu_items (
  item_id       BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  restaurant_id BIGINT UNSIGNED NOT NULL,
  name          VARCHAR(150) NOT NULL,
  price         DECIMAL(10,2) NOT NULL,
  is_available  TINYINT(1) NOT NULL DEFAULT 1,
  category      VARCHAR(60),
  CONSTRAINT chk_price CHECK (price >= 0),
  CONSTRAINT fk_menu_restaurant
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
