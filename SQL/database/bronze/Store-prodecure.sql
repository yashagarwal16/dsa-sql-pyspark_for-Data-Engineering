/*
===============================================================================
Stored Procedure: Load Bronze RAW Tables (Olist CSV -> bronze.*)
===============================================================================
Purpose:
    - Load CSV files into RAW bronze tables
    - No failures due to bad data
    - Minimal parsing
===============================================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_raw_olist
AS
BEGIN
    DECLARE 
        @start_time DATETIME,
        @end_time DATETIME,
        @batch_start_time DATETIME,
        @batch_end_time DATETIME;

    BEGIN TRY
        SET @batch_start_time = GETDATE();

        PRINT '=================================================';
        PRINT 'Loading Bronze RAW Layer - Olist Dataset';
        PRINT '=================================================';

        ------------------------------------------------
        -- RAW CUSTOMERS
        ------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.customers;

        BULK INSERT bronze.customers
        FROM 'D:\sql\SQL\data\raw\olist\olist_customers_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
            
        );

        SET @end_time = GETDATE();
        PRINT 'customers loaded in ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------
        -- RAW ORDERS
        ------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.orders;
        print'-----Truncatinfg the table'
        BULK INSERT bronze.orders
        FROM 'D:\sql\SQL\data\raw\olist\olist_orders_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
            
        );

        SET @end_time = GETDATE();
        PRINT 'orders loaded in ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------
        -- RAW ORDER ITEMS
        ------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.order_items;

        BULK INSERT bronze.order_items
        FROM 'D:\sql\SQL\data\raw\olist\olist_order_items_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
            
        );

        SET @end_time = GETDATE();
        PRINT 'order_items loaded in ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------
        -- RAW PRODUCTS
        ------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.products;

        BULK INSERT bronze.products
        FROM 'D:\sql\SQL\data\raw\olist\olist_products_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
            
        );

        SET @end_time = GETDATE();
        PRINT 'products loaded in ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------
        -- RAW SELLERS
        ------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.sellers;

        BULK INSERT bronze.sellers
        FROM 'D:\sql\SQL\data\raw\olist\olist_sellers_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
            
        );

        SET @end_time = GETDATE();
        PRINT 'sellers loaded in ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------
        -- RAW PAYMENTS
        ------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.order_payments;

        BULK INSERT bronze.order_payments
        FROM 'D:\sql\SQL\data\raw\olist\olist_order_payments_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
            
        );

        SET @end_time = GETDATE();
        PRINT 'payments loaded in ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------
        -- RAW REVIEWS
        ------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.order_reviews;

        BULK INSERT bronze.order_reviews
        FROM 'D:\sql\SQL\data\raw\olist\olist_order_reviews_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
            
        );

        SET @end_time = GETDATE();
        PRINT 'reviews loaded in ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------
        -- RAW GEOLOCATION
        ------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.geolocation;

        BULK INSERT bronze.geolocation
        FROM 'D:\sql\SQL\data\raw\olist\olist_geolocation_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK 
        );

        SET @end_time = GETDATE();
        PRINT 'geolocation loaded in ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------
        -- RAW CATEGORY TRANSLATION
        ------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.category_translation;

        BULK INSERT bronze.category_translation
        FROM 'D:\sql\SQL\data\raw\olist\product_category_name_translation.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
            
        );

        SET @end_time = GETDATE();
        PRINT 'category translation loaded in ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------
        -- FINAL LOG
        ------------------------------------------------
        SET @batch_end_time = GETDATE();

        PRINT '================================================';
        PRINT 'RAW Bronze Load Completed';
        PRINT 'Total Duration: ' + CAST(DATEDIFF(SECOND,@batch_start_time,@batch_end_time) AS NVARCHAR) + ' sec';
        PRINT '================================================';

    END TRY
    BEGIN CATCH
        PRINT '================================================';
        PRINT 'ERROR DURING LOAD';
        PRINT ERROR_MESSAGE();
        PRINT '================================================';
    END CATCH
END;


-- EXEC bronze.load_raw_olist;
