# Database Layout

This folder is your actual project.
Write your project SQL here.

Execution order:

1. `setup/`
2. `bronze/`
3. `silver/`
4. `gold/`
5. `quality/`
6. `serving/`

Layer meaning:

- bronze: raw landed tables, minimal typing and no business cleanup
- silver: cleaned and standardized tables
- gold: marts and reporting-ready models
- quality: validation and reconciliation checks
- serving: views used by dashboards or consumers

Suggested schemas:

- `bronze`
- `silver`
- `gold`
- `serving`

Suggested files to maintain:

- `setup/database.sql`
- `setup/schemas.sql`
- `bronze/raw_tables.sql`
- `silver/clean_models.sql`
- `gold/marts.sql`
- `quality/checks.sql`
