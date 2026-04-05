-- Write schema creation statements in this file.
-- Run this after creating the database.
--
-- Purpose:
-- 1. create `bronze` for raw tables
-- 2. create `silver` for cleaned tables
-- 3. create `gold` for marts
-- 4. optionally create `serving` for views
--
-- Keep this file only for schema-level setup.

Use olist_dw;
GO
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    DROP SCHEMA bronze;
END
GO
CREATE SCHEMA bronze

GO
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    DROP SCHEMA silver;
END
GO
CREATE SCHEMA silver
GO
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    DROP SCHEMA gold;
END
GO
CREATE SCHEMA gold;



