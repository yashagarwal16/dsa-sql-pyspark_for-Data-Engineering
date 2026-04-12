-- Write silver-layer transformation SQL in this file.
-- Silver means cleaned, standardized, and business-ready tables or views.
--
-- Typical work here:
-- 1. clean nulls
-- 2. standardize status values
-- 3. remove bad records
-- 4. derive helper columns
--
-- Recommended first silver objects:
-- 1. silver.orders_clean
-- 2. silver.order_items_clean
-- 3. silver.customers_clean
-- 4. silver.products_clean

-------------------------------------------------
-- Customers Clean Table
-------------------------------------------------

INSERT INTO silver.customers_clean (
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    clean_city,
    clean_state
)
SELECT
trim(replace (customer_id,'"','')) as customer_id,
trim(replace (customer_unique_id,'"','')) as customer_unique_id,

trim(replace(customer_zip_code_prefix,'"','')) as customer_zip_code_prefix,
CASE 
        WHEN RIGHT(LOWER(LTRIM(RTRIM(customer_city))), 3) LIKE ' [a-z][a-z]'
        THEN 
            LEFT(
                REPLACE(REPLACE(LOWER(LTRIM(RTRIM(customer_city))), '-', ' '), '.', ''),
                LEN(REPLACE(REPLACE(LOWER(LTRIM(RTRIM(customer_city))), '-', ' '), '.', '')) - 3
            )
        ELSE 
            REPLACE(REPLACE(LOWER(LTRIM(RTRIM(customer_city))), '-', ' '), '.', '')
    END AS clean_city,


CASE UPPER(LTRIM(RTRIM(customer_state)))
        WHEN 'AC' THEN 'ACRE'				 WHEN 'AL' THEN 'ALAGOAS'			WHEN 'AP' THEN 'AMAPA' 
		WHEN 'AM' THEN 'AMAZONAS'			 WHEN 'BA' THEN 'BAHIA'				WHEN 'GO' THEN 'GOIAS'
        WHEN 'CE' THEN 'CEARA'				 WHEN 'DF' THEN 'DISTRITO FEDERAL'  WHEN 'ES' THEN 'ESPIRITO SANTO' 
        WHEN 'MA' THEN 'MARANHAO'			 WHEN 'MT' THEN 'MATO GROSSO'		WHEN 'MS' THEN 'MATO GROSSO DO SUL' 
		WHEN 'MG' THEN 'MINAS GERAIS'		 WHEN 'PA' THEN 'PARA'				WHEN 'SE' THEN 'SERGIPE'
        WHEN 'PB' THEN 'PARAIBA'			 WHEN 'PR' THEN 'PARANA'			WHEN 'PE' THEN 'PERNAMBUCO' 
		WHEN 'PI' THEN 'PIAUI'				 WHEN 'RJ' THEN 'RIO DE JANEIRO'	WHEN 'SP' THEN 'SAO PAULO'
        WHEN 'RN' THEN 'RIO GRANDE DO NORTE' WHEN 'RS' THEN 'RIO GRANDE DO SUL'	WHEN 'RO' THEN 'RONDONIA' 
		WHEN 'RR' THEN 'RORAIMA'			 WHEN 'TO' THEN 'TOCANTINS'			WHEN 'SC' THEN 'SANTA CATARINA'
        		  
        ELSE customer_state
    END AS clean_state
from bronze.customers

-------------------------------------------------
-- Orders Clean Table 
------------------------------------------------- 

TRUNCATE TABLE silver.orders;

INSERT INTO silver.orders (
    order_id,
    customer_id,
    order_status,
    order_status_fixed,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    is_invalid_delivery,
    is_conflict,
    is_not_delivered
)
SELECT
    trim(replace(order_id,'"','')),
    trim(replace(customer_id,'"','')),
    lower(trim(order_status)),

    case 
        when lower(trim(order_status)) = 'delivered' 
             and order_delivered_customer_date is null 
        then 'shipped'
        when lower(trim(order_status)) = 'canceled' 
             and order_delivered_customer_date is not null 
        then 'delivered'
        else lower(trim(order_status))
    end,

    CAST(order_purchase_timestamp AS DATETIME),
    CAST(order_approved_at AS DATETIME),
    CAST(order_delivered_carrier_date AS DATETIME),
    CAST(order_delivered_customer_date AS DATETIME),
    CAST(order_estimated_delivery_date AS DATETIME),

    case 
        when lower(trim(order_status)) = 'delivered' 
             and order_delivered_customer_date is null 
        then 1 else 0 
    end,

    case 
        when lower(trim(order_status)) = 'canceled' 
             and order_delivered_customer_date is not null 
        then 1 else 0 
    end,

    case 
        when order_delivered_customer_date is null then 1 else 0
    end

FROM bronze.orders;