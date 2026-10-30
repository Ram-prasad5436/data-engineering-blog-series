-- 1. Overall Sales Performance
SELECT
    SUM(Sales_Amount) AS total_sales_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold,
    COUNT(*) AS total_sales_records,
    COUNT(DISTINCT Product_ID) AS distinct_products
FROM Innomatics.default.sales_data_1;


-- 2. Top 5 Products by Sales Revenue
SELECT
    Product_ID,
    SUM(Sales_Amount) AS total_sales_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM Innomatics.default.sales_data_1
GROUP BY Product_ID
ORDER BY total_sales_revenue DESC
LIMIT 5;


-- 3. Sales Performance by Region
SELECT
    Region,
    SUM(Sales_Amount) AS total_sales_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM Innomatics.default.sales_data_1
GROUP BY Region
ORDER BY total_sales_revenue DESC;


-- 4. Monthly Sales Trend
SELECT
    DATE_FORMAT(Sale_Date, 'yyyy-MM') AS sales_month,
    SUM(Sales_Amount) AS total_sales_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM Innomatics.default.sales_data_1
GROUP BY DATE_FORMAT(Sale_Date, 'yyyy-MM')
ORDER BY sales_month ASC;


-- 5. Sales Contribution by Product Category
SELECT
    Product_Category,
    SUM(Sales_Amount) AS total_sales,
    AVG(Sales_Amount) AS avg_sales,
    ROUND(
        SUM(Sales_Amount) * 100.0 /
        SUM(SUM(Sales_Amount)) OVER (),
        2
    ) AS sales_percentage
FROM Innomatics.default.sales_data_1
GROUP BY Product_Category
ORDER BY total_sales DESC;
