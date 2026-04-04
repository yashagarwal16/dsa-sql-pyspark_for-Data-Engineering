# SQL Data Engineering Workspace

This repo is organized as a project workspace for building your own SQL data engineering project with medallion architecture.
It is not meant to hold finished answers for you.
Each file is a place where you write your own SQL while building the project.

## Folder Layout

- `data/raw/` for source CSV files
- `data/external/` for future datasets you download later
- `database/setup/` for database and schema creation
- `database/bronze/` for raw landing tables
- `database/silver/` for cleaned and standardized models
- `database/gold/` for reporting marts
- `database/quality/` for data quality checks
- `database/serving/` for views or serving-layer objects
- `docs/` for dataset notes and readiness assessment
- `practice/` for day-wise questions, work log, and interview preparation
- `notebooks/` for Jupyter notebooks if you want exploratory work

## Current Dataset

- Olist e-commerce dataset in `data/raw/olist/`

## Where You Build The Project

- Write your actual project SQL in `database/`
- Use `practice/sql/` only for interview-style questions and extra practice
- Use `notebooks/` only if you want exploration or notes

## Project Build Order

1. `database/setup/database.sql`
2. `database/setup/schemas.sql`
3. `database/bronze/raw_tables.sql`
4. `database/silver/clean_models.sql`
5. `database/gold/marts.sql`
6. `database/quality/checks.sql`

## Practice Files

- day-wise plan: `practice/DAY_WISE_QUESTIONS.md`
- work log: `practice/WORK_LOG_SQL.md`
- interview questions: `practice/BEST_QUESTIONS.md`

## Simple Rule

If the SQL is part of your real project, put it in `database/`.
If the SQL is only for learning or interview practice, put it in `practice/sql/`.

## Reality Check

Olist is strong for SQL, dimensional modeling, and warehouse practice.
It is not enough by itself for FAANG-level data engineering preparation.
See `docs/faang_readiness_assessment.md`.
