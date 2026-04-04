-- Dataset: Olist
-- Goal: Validate raw data before warehouse modeling.

-- 1. Orders should be unique by order_id.
SELECT
    order_id,
    COUNT(*) AS row_count
FROM raw_orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 2. Order items should not have negative revenue values.
SELECT *
FROM raw_order_items
WHERE price < 0
   OR freight_value < 0;

-- 3. Delivered orders should usually have a delivered timestamp.
SELECT *
FROM raw_orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NULL;
