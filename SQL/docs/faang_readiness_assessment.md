# FAANG Readiness Assessment

## Short answer

The Olist dataset is good for practice, but it is not enough by itself to make you ready for a FAANG data engineering role.

## What Olist is good for

- SQL joins, aggregations, CTEs, and window functions
- dimensional modeling from normalized CSVs
- KPI design for revenue, delivery, retention, and reviews
- data quality checks and null handling
- building a small warehouse project from raw files

## What Olist does not cover well

- very large-scale data processing
- event-stream modeling
- partitioning and clustering strategy
- CDC, upserts, idempotency, and backfills
- orchestration, monitoring, and pipeline reliability
- schema evolution and production incident handling

## Verdict

If you master Olist end to end, you will be better prepared for:
- SQL interview rounds
- analytics engineering exercises
- entry-level warehouse modeling discussions

You will still need more practice for:
- FAANG data engineering system design
- pipeline architecture rounds
- production ETL and orchestration questions
- scale and performance discussions

## Recommended next step after Olist

Add at least two more datasets or projects:

1. one large event dataset
2. one batch-pipeline or CDC-style dataset

Examples:
- taxi trips for scale and partitioning
- GitHub or clickstream events for event modeling
- synthetic employee history data for SCD Type 2

## Practical readiness target

To be interview-ready, aim to prove all four:

1. Write correct SQL under time pressure.
2. Design fact and dimension tables from raw data.
3. Explain incremental loads, deduplication, and data quality checks.
4. Discuss how the same workflow would run in Airflow, Spark, dbt, or a warehouse platform.
