
CREATE DATABASE IF NOT EXISTS inventory_control_management;
USE inventory_control_management;

-- Drop and recreate user_login table
DROP TABLE IF EXISTS user_login;
CREATE TABLE IF NOT EXISTS user_login (
    user_id VARCHAR(255) PRIMARY KEY,
    user_password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sign_up_on DATE NOT NULL,
    email_id VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS supplier (
    supplier_id VARCHAR(255) PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    address TEXT,
    registered_on DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS product_items (
    item_id VARCHAR(255) PRIMARY KEY,
    item_code VARCHAR(50) UNIQUE NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    item_type VARCHAR(100),
    item_description TEXT,
    item_image JSON,
    brand_name VARCHAR(255),
    supplier_id VARCHAR(255),
    cost_per_unit DECIMAL(10, 2) NOT NULL,
    stock_count INT NOT NULL DEFAULT 0,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id) ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS purchase_orders (
    order_id VARCHAR(255) PRIMARY KEY,
    item_id VARCHAR(255),
    supplier_id VARCHAR(255),
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    delivery_date DATE,
    is_delivered BOOLEAN DEFAULT FALSE,
    payment_id VARCHAR(255),
    is_paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (item_id) REFERENCES product_items(item_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Add indexes to improve performance
CREATE INDEX idx_user_email ON user_login(email_id);
CREATE INDEX idx_product_item_code ON product_items(item_code);
CREATE INDEX idx_purchase_order_item ON purchase_orders(item_id);
CREATE INDEX idx_purchase_order_supplier ON purchase_orders(supplier_id);

-- Insert data into user_login
INSERT INTO user_login (user_id, user_password, first_name, last_name, sign_up_on, email_id) VALUES
('user1', 'password123', 'Aarav', 'Sharma', '2023-01-15', 'aarav.sharma@example.com'),
('user2', 'password456', 'Isha', 'Patel', '2023-02-20', 'isha.patel@example.com'),
('user3', 'password789', 'Vivaan', 'Singh', '2023-03-10', 'vivaan.singh@example.com');

-- Output
SELECT * FROM user_login;

-- Insert data into supplier
INSERT INTO supplier (supplier_id, supplier_name, address, registered_on) VALUES
('supplier1', 'Raj Enterprises', '1234 MG Road, Mumbai, Maharashtra', '2022-11-01'),
('supplier2', 'Sita Textiles', '5678 Churchgate, Mumbai, Maharashtra', '2021-08-15'),
('supplier3', 'Anand Traders', '9101 Connaught Place, Delhi', '2023-05-22');

-- Output
SELECT * FROM supplier;

-- Insert data into product_items
INSERT INTO product_items (item_id, item_code, item_name, item_type, item_description, item_image, brand_name, supplier_id, cost_per_unit, stock_count) VALUES
('item1', 'IC001', 'Red Cotton Shirt', 'Apparel', 'A comfortable red cotton shirt', '{"url": "http://example.com/images/item1.jpg"}', 'FashionWear', 'supplier1', 499.99, 150),
('item2', 'IC002', 'Blue Denim Jeans', 'Apparel', 'Stylish blue denim jeans', '{"url": "http://example.com/images/item2.jpg"}', 'DenimStyle', 'supplier2', 799.99, 200),
('item3', 'IC003', 'Leather Wallet', 'Accessories', 'Genuine leather wallet', '{"url": "http://example.com/images/item3.jpg"}', 'WalletsRUs', 'supplier3', 1299.99, 75);

-- Output
SELECT * FROM product_items;

-- Insert data into purchase_orders
INSERT INTO purchase_orders (order_id, item_id, supplier_id, order_date, quantity, delivery_date, is_delivered, payment_id, is_paid) VALUES
('order1', 'item1', 'supplier1', '2024-09-01', 50, '2024-09-10', TRUE, 'payment001', TRUE),
('order2', 'item2', 'supplier2', '2024-09-05', 100, '2024-09-15', FALSE, 'payment002', FALSE),
('order3', 'item3', 'supplier3', '2024-09-10', 30, '2024-09-20', TRUE, 'payment003', TRUE);

-- Output
SELECT * FROM purchase_orders;





