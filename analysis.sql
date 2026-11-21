-- Bakery store operations analysis (simulated data)
-- Tables: daily_performance, product_waste, stores

-- 1. Labour cost as % of sales, by store
SELECT store_id,
       ROUND(100.0 * SUM(labour_cost_gbp) / SUM(sales_gbp), 2) AS labour_pct
FROM daily_performance
GROUP BY store_id
ORDER BY labour_pct DESC;

-- 2. Sales per labour hour, by store and daypart
SELECT store_id, daypart,
       ROUND(SUM(sales_gbp) / SUM(labour_hours), 1) AS sales_per_labour_hour
FROM daily_performance
GROUP BY store_id, daypart
ORDER BY store_id, daypart;

-- 3. S05 waste as % of sales, by day of week and daypart
SELECT day_of_week, daypart,
       ROUND(100.0 * SUM(waste_gbp) / SUM(sales_gbp), 1) AS waste_pct
FROM daily_performance
WHERE store_id = 'S05'
GROUP BY day_of_week, daypart
ORDER BY waste_pct DESC;

-- 4. S04 sales vs target by month
SELECT SUBSTR(date, 1, 7) AS month,
       ROUND(100.0 * (SUM(sales_gbp) - SUM(target_sales_gbp)) / SUM(target_sales_gbp), 2) AS pct_vs_target
FROM daily_performance
WHERE store_id = 'S04'
GROUP BY month
ORDER BY month;

-- 5. Labour % by store type (JOIN)
SELECT s.store_type,
       COUNT(DISTINCT s.store_id) AS stores,
       ROUND(100.0 * SUM(d.labour_cost_gbp) / SUM(d.sales_gbp), 2) AS labour_pct
FROM daily_performance d
JOIN stores s ON d.store_id = s.store_id
GROUP BY s.store_type
ORDER BY labour_pct DESC;
