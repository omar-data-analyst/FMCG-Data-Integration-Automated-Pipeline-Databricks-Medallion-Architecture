-- =============================================================================
-- View Name:        fmcg.gold.vw_fact_orders_enriched
-- Layer:            Gold (Dimensional Analytical View)
-- Description:      Denormalizes fact_orders with dimensional attributes 
--                   (products, pricing, calendar, customers) for BI reporting.
-- Target Audience:  PowerBI / Tableau / SQL Analysts
-- =============================================================================

CREATE OR REPLACE VIEW fmcg.gold.vw_fact_orders_enriched AS (
    SELECT 
        -- Fact Keys & Transaction Grain
        fo.customer_code,
        fo.product_code,
        fo.date,

        -- Product Dimension Attributes
        dp.division,
        dp.category,
        dp.product,
        dp.variant,

        -- Pricing & Revenue Metrics
        dg.price_inr,

        -- Temporal / Calendar Attributes
        dd.month_start_date,
        dd.month_name,
        dd.month_short_name,
        dd.quarter,
        dd.year_quarter,

        -- Customer & Channel Attributes
        dc.market,
        dc.platform,
        dc.channel,

        -- Quantity Measure
        fo.sold_quantity,

        -- Metrics
        (fo.sold_quantity * dg.price_inr) AS total_sales

    FROM fmcg.gold.fact_orders fo

    -- Join Product Master Data
    INNER JOIN fmcg.gold.dim_products dp
        ON fo.product_code = dp.product_code

    -- Join Price Dimension for Currency/Unit Value Retrieval
    INNER JOIN fmcg.gold.dim_gross_price dg
        ON fo.product_code = dg.product_code
        AND YEAR(fo.date) = dg.year

    -- Join Calendar Dimension on Truncated Monthly Date
    INNER JOIN fmcg.gold.dim_date dd
        ON fo.date = dd.month_start_date
        

    -- Join Customer Master Data for Geographic & Platform Attributes
    INNER JOIN fmcg.gold.dim_customers dc
        ON fo.customer_code = dc.customer_code
);