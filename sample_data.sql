INSERT INTO customers (name, email, phone) VALUES
('Kunal Sharma', 'kunal@example.com', '9000000001'),
('Aisha Khan', 'aisha@example.com', '9000000002'),
('Rohit Mehra', 'rohit@example.com', '9000000003'),
('Simran Kaur', 'simran@example.com', '9000000004'),
('Ravi Patel', 'ravi@example.com', '9000000005'),
('Priya Nair', 'priya@example.com', '9000000006'),
('Aman Gupta', 'aman@example.com', '9000000007'),
('Sneha Verma', 'sneha@example.com', '9000000008'),
('Deepak Yadav', 'deepak@example.com', '9000000009'),
('Nisha Reddy', 'nisha@example.com', '9000000010'),
('Tanya Arora', 'tanya@example.com', '9000000011'),
('Harsh Vora', 'harsh@example.com', '9000000012'),
('Ritika Singh', 'ritika@example.com', '9000000013'),
('Abhishek Das', 'abhishek@example.com', '9000000014'),
('Ishita Joshi', 'ishita@example.com', '9000000015');


INSERT INTO customer_addresses (customer_id, label, line1, city, pincode, is_default) VALUES
(1, 'Home', '221B Baker Street', 'Jaipur', '302001', 1),
(2, 'Home', '11 Park View', 'Jaipur', '302002', 1),
(3, 'Home', 'Sector 45', 'Delhi', '110045', 1),
(4, 'Home', 'MG Road', 'Bangalore', '560001', 1),
(5, 'Home', 'Law Garden', 'Ahmedabad', '380006', 1),
(6, 'Home', 'Marine Drive', 'Mumbai', '400020', 1),
(7, 'Home', 'Sector 62', 'Noida', '201301', 1),
(8, 'Home', 'Kothrud', 'Pune', '411038', 1),
(9, 'Home', 'Civil Lines', 'Nagpur', '440001', 1),
(10, 'Home', 'Banjara Hills', 'Hyderabad', '500034', 1),
(11, 'Home', 'Salt Lake', 'Kolkata', '700091', 1),
(12, 'Home', 'Kukatpally', 'Hyderabad', '500072', 1),
(13, 'Home', 'C-Scheme', 'Jaipur', '302001', 1),
(14, 'Home', 'Anna Nagar', 'Chennai', '600040', 1),
(15, 'Home', 'Sector 17', 'Chandigarh', '160017', 1);


INSERT INTO restaurants (name, city) VALUES
('Hot Slice', 'Jaipur'),
('Biryani Hub', 'Hyderabad'),
('Tandoori Tales', 'Delhi'),
('Cheesy Crust', 'Mumbai'),
('Spice Villa', 'Pune');


INSERT INTO menu_items (restaurant_id, name, price, category) VALUES
(1, 'Margherita Pizza', 199, 'Pizza'),
(1, 'Farmhouse Pizza', 299, 'Pizza'),
(2, 'Chicken Biryani', 249, 'Biryani'),
(2, 'Veg Biryani', 199, 'Biryani'),
(3, 'Paneer Tikka', 279, 'Starter'),
(3, 'Butter Chicken', 349, 'Main Course'),
(4, 'Cheese Burst Pizza', 399, 'Pizza'),
(4, 'Garlic Bread', 149, 'Starter'),
(5, 'Masala Dosa', 179, 'South Indian'),
(5, 'Filter Coffee', 99, 'Beverage');


INSERT INTO promos (promo_code, description, discount_pct, max_discount, starts_on, ends_on, min_order_value) VALUES
('NEW50', '50% off for new users', 50, 150, DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_ADD(CURDATE(), INTERVAL 30 DAY), 200);


