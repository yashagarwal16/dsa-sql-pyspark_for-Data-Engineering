# Olist Data Dictionary

This is the dataset currently stored in the repo at `datasets/raw/olist/`.

Core tables:

| Table | Grain | Main use |
| --- | --- | --- |
| `olist_orders_dataset.csv` | one row per order | order lifecycle and delivery timestamps |
| `olist_order_items_dataset.csv` | one row per order item | revenue, sellers, shipping cost, basket composition |
| `olist_order_payments_dataset.csv` | one row per payment installment/payment method record | payment mix and installment behavior |
| `olist_order_reviews_dataset.csv` | one row per review record | satisfaction and post-order quality |
| `olist_customers_dataset.csv` | one row per customer id | customer geography and customer identity mapping |
| `olist_products_dataset.csv` | one row per product | category and physical product attributes |
| `olist_sellers_dataset.csv` | one row per seller | seller geography |
| `olist_geolocation_dataset.csv` | many rows per zip prefix | geospatial enrichment |
| `product_category_name_translation.csv` | one row per category | category translation |

Useful join path:

`customers -> orders -> order_items -> products`

Supporting joins:

- `orders -> order_payments`
- `orders -> order_reviews`
- `order_items -> sellers`
- `products -> product_category_name_translation`

Good interview practice topics with this dataset:
- order funnel metrics
- monthly GMV and AOV
- customer repeat behavior
- seller performance ranking
- delivery SLA analysis
- category-level revenue contribution
- payment method distribution
- null handling and data quality checks

Modeling suggestion:
- fact table: `fct_order_items`
- dimensions: `dim_customers`, `dim_products`, `dim_sellers`, `dim_dates`
- derived marts: `mart_monthly_revenue`, `mart_customer_retention`, `mart_seller_performance`
