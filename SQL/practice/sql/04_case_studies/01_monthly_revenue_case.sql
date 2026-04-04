-- Case study: Build a monthly revenue view from Olist.
-- Explain:
-- 1. which grain you choose
-- 2. how cancelled orders are handled
-- 3. whether freight is included in revenue

SELECT
    DATEFROMPARTS(YEAR(o.order_purchase_timestamp), MONTH(o.order_purchase_timestamp), 1) AS revenue_month,
    COUNT(DISTINCT o.order_id) AS order_count,
    SUM(oi.price) AS item_revenue,
    SUM(oi.freight_value) AS freight_revenue,
    SUM(oi.price + oi.freight_value) AS gross_revenue
FROM raw_orders AS o
JOIN raw_order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY DATEFROMPARTS(YEAR(o.order_purchase_timestamp), MONTH(o.order_purchase_timestamp), 1)
ORDER BY revenue_month;
