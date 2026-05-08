-- Write a SQL query to calculate the year-over-year (YoY) revenue growth percentage for each month.
-- The output should have columns: year, month, total_revenue, last_year_revenue, yoy_growth_percent
-- Only include rows where last_year_revenue is NOT NULL.
SELECT 
    year, 
    month, 
    total_revenue, 
    last_year_revenue, 
    ((total_revenue - last_year_revenue) / last_year_revenue) * 100 AS yoy_growth_percent
FROM (
    SELECT 
        EXTRACT(YEAR FROM revenue_date) AS year,
        EXTRACT(MONTH FROM revenue_date) AS month,
        SUM(amount) AS total_revenue,
        LAG(SUM(amount)) OVER (
            PARTITION BY EXTRACT(MONTH FROM revenue_date) 
            ORDER BY EXTRACT(YEAR FROM revenue_date)
        ) AS last_year_revenue
    FROM revenue
    GROUP BY 1, 2  -- Groups by year and month first
) sub
WHERE last_year_revenue IS NOT NULL
ORDER BY year, month;