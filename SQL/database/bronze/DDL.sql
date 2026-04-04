-- Write bronze/raw table DDL in this file.
-- Bronze means source-aligned raw tables with minimal cleanup.
--
-- Create raw tables for the Olist CSV files from `data/raw/olist/`.
--
-- Recommended first tables:
-- 1. bronze.raw_orders
-- 2. bronze.raw_order_items
-- 3. bronze.raw_customers
-- 4. bronze.raw_products
-- 5. bronze.raw_sellers
-- 6. bronze.raw_order_payments
-- 7. bronze.raw_order_reviews
--
-- In this file, decide:
-- 1. column names
-- 2. data types
-- 3. primary keys if you want them on raw tables


DROP TABLE IF EXISTS bronze.customers;
GO

CREATE TABLE bronze.customers(
    customer_id VARCHAR(255) PRIMARY KEY,
    customer_unique_id VARCHAR(255),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(255),
    customer_state VARCHAR(255)
);

GO

DROP TABLE IF EXISTS bronze.orders;
GO

CREATE TABLE bronze.orders(
    order_id VARCHAR(255) PRIMARY KEY,
    customer_id VARCHAR(255),
    order_status VARCHAR(255),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

DROP TABLE IF EXISTS bronze.order_items;
GO

CREATE TABLE bronze.order_items(
    order_id VARCHAR(255),
    order_item_id INT,
    product_id VARCHAR(255),
    seller_id VARCHAR(255),
    shipping_limit_date DATETIME,
    price FLOAT,
    freight_value FLOAT,
    PRIMARY KEY (order_id, order_item_id)
);

DROP TABLE IF EXISTS bronze.products;
GO
CREATE TABLE bronze.products(
    product_id VARCHAR(255) PRIMARY KEY,
    product_category_name VARCHAR(255),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT
);

DROP TABLE IF EXISTS bronze.sellers;
GO
CREATE TABLE bronze.sellers(
    seller_id VARCHAR(255) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(255),
    seller_state VARCHAR(255)
);  

DROP TABLE IF EXISTS bronze.order_payments;
GO
CREATE TABLE bronze.order_payments(
    order_id VARCHAR(255),
    payment_sequential INT,
    payment_type VARCHAR(255),
    payment_installments INT,
    payment_value FLOAT,
    PRIMARY KEY (order_id, payment_sequential)
);  

DROP TABLE IF EXISTS bronze.order_reviews;
GO
CREATE TABLE bronze.order_reviews(
    review_id VARCHAR(255) PRIMARY KEY,
    order_id VARCHAR(255),
    review_score INT,
    review_comment_title VARCHAR(255),
    review_comment_message VARCHAR(255),
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);      

GO

DROP TABLE IF EXISTS bronze.geolocation;
GO
CREATE TABLE bronze.geolocation(
    geolocation_zip_code_prefix INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR(255),
    geolocation_state VARCHAR(255)
);  

GO

DROP TABLE IF EXISTS bronze.product_category_name_translation;
GO
CREATE TABLE bronze.product_category_name_translation(
    product_category_name VARCHAR(255) PRIMARY KEY,
    product_category_name_english VARCHAR(255)
);      



