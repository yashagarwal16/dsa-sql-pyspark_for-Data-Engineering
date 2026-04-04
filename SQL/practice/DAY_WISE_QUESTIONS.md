# Day-Wise SQL and Data Engineering Questions

Use this file as your day-by-day practice tracker for data engineering interview preparation.

Rule for each day:
- solve the question
- save SQL in the matching `practice/sql/` folder
- mention dataset used
- write 2 to 4 lines on the approach

## Week 1: SQL Foundations

### Day 1
- Find all orders placed after a given date.
- Find customers from a specific state.
- Count total orders in the dataset.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-01_SQL_Basics.sql`

### Day 2
- Sort orders by purchase timestamp descending.
- Filter delivered orders only.
- Find products with weight greater than a chosen threshold.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-02_Filtering_and_Sorting.sql`

### Day 3
- Find total revenue from order items.
- Find average freight value.
- Count distinct customers.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-03_Aggregates.sql`

### Day 4
- Find total orders by order status.
- Find total customers by state.
- Find categories having more than 100 products.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-04_Group_By_and_Having.sql`

### Day 5
- Join orders with customers and show customer city for each order.
- Join order items with products and show product category.
- Find all sellers involved in delivered orders.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-05_Joins.sql`

### Day 6
- Join customers, orders, and order items to calculate customer-level revenue.
- Join products, translations, and order items to calculate revenue by English category name.
- Join sellers with order items to count items sold per seller.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-06_Multi_Table_Joins.sql`

### Day 7
- Find customers who never placed an order.
- Find orders whose value is above the overall average order value.
- Find products that were never ordered.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-07_Subqueries.sql`

## Week 2: Intermediate SQL

### Day 8
- Use a CTE to calculate monthly revenue.
- Use a CTE to calculate seller-level total sales.
- Use a CTE to find top 5 categories by revenue.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-08_CTEs.sql`

### Day 9
- Rank products by revenue within each category.
- Find the top 3 sellers by monthly revenue.
- Assign row numbers to customer orders by purchase date.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-09_Window_Functions.sql`

### Day 10
- Replace null delivery dates with a fallback label in analysis output.
- Categorize orders as on-time or delayed.
- Categorize customers into high, medium, and low value buckets.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-10_Case_When_and_Nulls.sql`

### Day 11
- Find monthly order count.
- Calculate delivery time in days.
- Find average delivery time by month.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-11_Date_Functions.sql`

### Day 12
- Compare customers who reviewed orders versus customers who did not.
- Compare delivered orders and canceled orders using set logic.
- Find product ids that exist in products but not in order items.
- Dataset: Olist
- Save in: `practice/sql/01_fundamentals/Day-12_Set_Operations.sql`

### Day 13
- Find monthly revenue and month-over-month growth.
- Find repeat customers by month.
- Find products with the highest sales in each category.
- Dataset: Olist
- Save in: `practice/sql/02_analytics/Day-13_Interview_Practice_Mix.sql`

### Day 14
- Find seller performance by revenue, orders, and average review score.
- Find top 10 cities by total revenue.
- Find orders delayed beyond the estimated delivery date.
- Dataset: Olist
- Save in: `practice/sql/02_analytics/Day-14_Business_Questions.sql`

## Week 3: Data Engineering SQL

### Day 15
- Check for duplicate `order_id` values in orders.
- Check for null primary business keys in customers, orders, and products.
- Check for negative price or freight values.
- Dataset: Olist
- Save in: `practice/sql/03_data_engineering/Day-15_Data_Quality_Checks.sql`

### Day 16
- Create a staging query for cleaned orders.
- Standardize order status values.
- Exclude obviously bad records with missing critical keys.
- Dataset: Olist
- Save in: `practice/sql/03_data_engineering/Day-16_Staging_Orders.sql`

### Day 17
- Build a `dim_customers` query with one row per business customer.
- Build a `dim_products` query with category translation applied.
- Build a `dim_sellers` query with geography columns.
- Dataset: Olist
- Save in: `practice/sql/03_data_engineering/Day-17_Dimensions.sql`

### Day 18
- Build a `fct_order_items` query at order-item grain.
- Add derived metrics like `item_total_amount`.
- Exclude canceled and unavailable orders if required by business rules.
- Dataset: Olist
- Save in: `practice/sql/03_data_engineering/Day-18_Fact_Table.sql`

### Day 19
- Write a query to load only new orders after the latest processed timestamp.
- Write a query to detect changed records for incremental loading.
- Explain idempotent load behavior in comments.
- Dataset: Olist
- Save in: `practice/sql/03_data_engineering/Day-19_Incremental_Loads.sql`

### Day 20
- Write data validation queries for fact-to-dimension joins.
- Check orphan product ids and orphan customer ids.
- Check row-count reconciliation from raw to fact table.
- Dataset: Olist
- Save in: `practice/sql/03_data_engineering/Day-20_Warehouse_Validation.sql`

### Day 21
- Build a monthly revenue mart.
- Build a seller performance mart.
- Build a customer retention mart.
- Dataset: Olist
- Save in: `practice/sql/03_data_engineering/Day-21_Marts.sql`

## Week 4: Mock Interview Practice

### Day 22
- Case study: design a dashboard table for monthly revenue and order trends.
- Explain grain, refresh cadence, and key metrics.
- Write the SQL for the core dataset.
- Dataset: Olist
- Save in: `practice/sql/04_case_studies/Day-22_Revenue_Dashboard.sql`

### Day 23
- Case study: identify root causes for delayed deliveries.
- Segment delays by seller, category, and customer state.
- Write SQL and list production follow-up checks.
- Dataset: Olist
- Save in: `practice/sql/04_case_studies/Day-23_Delivery_Delays.sql`

### Day 24
- Case study: identify high-value repeat customers.
- Define repeat customer logic clearly.
- Build a customer summary output.
- Dataset: Olist
- Save in: `practice/sql/04_case_studies/Day-24_Retention_Case.sql`

### Day 25
- Case study: build top-category trend reporting.
- Compare month-over-month category revenue.
- Identify categories with strongest growth.
- Dataset: Olist
- Save in: `practice/sql/04_case_studies/Day-25_Category_Trends.sql`

### Day 26
- Case study: explain how you would productionize Olist in Airflow or dbt.
- Write pseudo-SQL for staging and marts.
- List data quality checks and scheduling notes.
- Dataset: Olist
- Save in: `practice/sql/04_case_studies/Day-26_Productionization_Notes.sql`

### Day 27
- Mock interview: second highest salary.
- Mock interview: customers who never ordered.
- Mock interview: top N salaries in each department.
- Dataset: Generic interview patterns plus Olist adaptation
- Save in: `practice/sql/04_case_studies/Day-27_Core_Interview_Questions.sql`

### Day 28
- Mock interview: monthly revenue growth.
- Mock interview: running total by date.
- Mock interview: moving average over 7 days.
- Dataset: Olist
- Save in: `practice/sql/04_case_studies/Day-28_Analytics_Interview_Questions.sql`

### Day 29
- Mock interview: build fact and dimension tables from raw CSVs.
- Explain grain, keys, joins, and late-arriving data handling.
- Add SQL skeletons for each table.
- Dataset: Olist
- Save in: `practice/sql/04_case_studies/Day-29_Modeling_Interview.sql`

### Day 30
- Final revision: solve 5 questions without notes.
- Review weak areas from previous days.
- Rewrite one query each for windows, joins, marts, and data quality.
- Dataset: Olist
- Save in: `practice/sql/04_case_studies/Day-30_Final_Revision.sql`

## Outcome Target

By the end of 30 days, you should be able to:
- solve core SQL questions quickly
- write business and analytics SQL clearly
- explain fact and dimension design
- describe incremental loads and data quality checks
- discuss how the same work would be productionized in a real data engineering stack
