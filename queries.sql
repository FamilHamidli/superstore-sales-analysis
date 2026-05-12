-- Total Sales by Region
SELECT Region, SUM(Sales) as Total_Sales
FROM Superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Total Profit by Category
SELECT Category, SUM(Profit) as Total_Profit
FROM Superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Top 10 Products by Sales
SELECT "Product Name", SUM(Sales) as Total_Sales
FROM Superstore
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- Loss Making Products
SELECT "Product Name", SUM(Profit) as Total_Profit
FROM Superstore
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;

-- Average Discount by Category
SELECT Category, AVG(Discount) as Avg_Discount
FROM Superstore
GROUP BY Category;

-- Monthly Sales Trend
SELECT "Ship Date", SUM(Sales) as Total_Sales
FROM Superstore
GROUP BY "Ship Date"
ORDER BY "Ship Date";

-- Segment Analysis
SELECT Segment, SUM(Profit) as Total_Profit
FROM Superstore
GROUP BY Segment
ORDER BY Total_Profit DESC;

-- Profit Margin by Region
SELECT Region,
SUM(Profit) as Total_Profit,
SUM(Sales) as Total_Sales,
SUM(Profit) * 1.0 / SUM(Sales) as Profit_Margin
FROM Superstore
GROUP BY Region;

-- Discount Level Analysis
SELECT
CASE
WHEN Discount < 0.2 THEN 'Low Discount'
WHEN Discount BETWEEN 0.2 AND 0.5 THEN 'Medium Discount'
ELSE 'High Discount'
END as Discount_Level,
SUM(Sales) as Total_Sales,
SUM(Profit) as Total_Profit
FROM Superstore
GROUP BY Discount_Level;

-- Region Performance Analysis
SELECT Region,
SUM(Profit) as Total_Profit,
CASE
WHEN SUM(Profit) > 100000 THEN 'High Performing'
WHEN SUM(Profit) BETWEEN 50000 AND 100000 THEN 'Medium Performing'
ELSE 'Low Performing'
END as Performing_Level
FROM Superstore
GROUP BY Region;

-- Products Above Average Profit
SELECT "Product Name", Profit
FROM Superstore
WHERE Profit > (
SELECT AVG(Profit)
FROM Superstore
);

-- CTE Example
WITH Total_Region_Sales as
(SELECT Region, SUM(Sales) as Total_Sales
FROM Superstore
GROUP BY Region)
SELECT * FROM Total_Region_Sales
WHERE Total_Sales > 500000;