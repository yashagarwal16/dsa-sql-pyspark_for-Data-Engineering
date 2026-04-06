
/*
===============================================================================
Bronze Layer DDL (RAW Tables) - Olist Dataset
===============================================================================
Purpose:
    - Create RAW (bronze) tables for Olist dataset
    - Designed for BULK INSERT without failures
    - No constraints, no strict datatypes
    - All columns stored as VARCHAR

Usage:
    Run this file before BULK INSERT
===============================================================================
*/

USE olist_dw;
GO


------------------------------------------------
-- CUSTOMERS 
------------------------------------------------
DROP TABLE IF EXISTS silver.customers_clean;
GO

CREATE TABLE silver.customers_clean (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix VARCHAR(10),
    clean_city VARCHAR(100),
    clean_state VARCHAR(100),
    dw_creation_date DATETIME DEFAULT GETDATE()
);
GO

------------------------------------------------
-- RAW ORDERS
------------------------------------------------
DROP TABLE IF EXISTS bronze.orders;
GO

CREATE TABLE bronze.orders(
    order_id VARCHAR(255),
    customer_id VARCHAR(255),
    order_status VARCHAR(50),
    order_purchase_timestamp VARCHAR(50),
    order_approved_at VARCHAR(50),
    order_delivered_carrier_date VARCHAR(50),
    order_delivered_customer_date VARCHAR(50),
    order_estimated_delivery_date VARCHAR(50)
);
GO

------------------------------------------------
-- RAW ORDER ITEMS
------------------------------------------------
DROP TABLE IF EXISTS bronze.order_items;
GO

CREATE TABLE bronze.order_items(
    order_id VARCHAR(255),
    order_item_id VARCHAR(50),
    product_id VARCHAR(255),
    seller_id VARCHAR(255),
    shipping_limit_date VARCHAR(50),
    price VARCHAR(50),
    freight_value VARCHAR(50)
);
GO

------------------------------------------------
-- RAW PRODUCTS
------------------------------------------------
DROP TABLE IF EXISTS bronze.products;
GO

CREATE TABLE bronze.products(
    product_id VARCHAR(255),
    product_category_name VARCHAR(255),
    product_name_length VARCHAR(50),
    product_description_length VARCHAR(50),
    product_photos_qty VARCHAR(50),
    product_weight_g VARCHAR(50),
    product_length_cm VARCHAR(50),
    product_height_cm VARCHAR(50),
    product_width_cm VARCHAR(50)
);
GO

------------------------------------------------
-- RAW SELLERS
------------------------------------------------
DROP TABLE IF EXISTS bronze.sellers;
GO

CREATE TABLE bronze.sellers(
    seller_id VARCHAR(255),
    seller_zip_code_prefix VARCHAR(50),
    seller_city VARCHAR(255),
    seller_state VARCHAR(50)
);
GO

------------------------------------------------
-- RAW ORDER PAYMENTS
------------------------------------------------
DROP TABLE IF EXISTS bronze.order_payments;
GO

CREATE TABLE bronze.order_payments(
    order_id VARCHAR(255),
    payment_sequential VARCHAR(50),
    payment_type VARCHAR(50),
    payment_installments VARCHAR(50),
    payment_value VARCHAR(50)
);
GO

------------------------------------------------
-- RAW ORDER REVIEWS
------------------------------------------------
DROP TABLE IF EXISTS bronze.order_reviews;
GO

CREATE TABLE bronze.order_reviews(
    review_id VARCHAR(255),
    order_id VARCHAR(255),
    review_score VARCHAR(50),
    review_comment_title VARCHAR(MAX),
    review_comment_message VARCHAR(MAX),
    review_creation_date VARCHAR(50),
    review_answer_timestamp VARCHAR(50)
);
GO

------------------------------------------------
-- RAW GEOLOCATION
------------------------------------------------
DROP TABLE IF EXISTS bronze.geolocation;
GO

CREATE TABLE bronze.geolocation(
    geolocation_zip_code_prefix VARCHAR(50),
    geolocation_lat VARCHAR(50),
    geolocation_lng VARCHAR(50),
    geolocation_city VARCHAR(255),
    geolocation_state VARCHAR(50)
);
GO

------------------------------------------------
-- RAW CATEGORY TRANSLATION
------------------------------------------------
DROP TABLE IF EXISTS bronze.category_translation;
GO

CREATE TABLE bronze.category_translation(
    product_category_name VARCHAR(255),
    product_category_name_english VARCHAR(255)
);