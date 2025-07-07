/*
==========================================================
 Mint Classics Inventory & Sales Analysis
 Author: Naghmeh Naderi
 Description:
 SQL scripts to analyze inventory levels, sales performance,
 revenue distribution, and warehouse utilization using the
 Mint Classics sample database.
==========================================================
*/

-- Overview of Product Lines table
SELECT * FROM productlines;

-- Overview of Products table
SELECT * FROM products;

-- ========================================================== 
-- Query 1
-- Low Demand and Highly Priced Items: Which products are barely selling, yet we’re holding a lot of them, 
-- and they’re expensive to keep?
SELECT 
    p.productCode, 
    p.productName, 
    p.quantityInStock, 
    p.buyPrice,
    COAlESCE(SUM(od.quantityOrdered), 0) AS totalOrdered
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock, p.buyPrice
ORDER BY totalOrdered ASC, quantityInStock DESC, buyPrice DESC
LIMIT 10;

-- ========================================================== 
-- Query 2
-- Stock Reduction Risk Simulation (5% Inventory Cut)
SELECT  
    p.productCode, 
    p.productName, 
    p.quantityInStock, 
    ROUND(p.quantityInStock * 0.95) AS reducedStock,
    SUM(od.quantityOrdered) AS totalOrdered
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock
HAVING reducedStock < (totalOrdered / 10)
ORDER BY reducedStock;

-- ========================================================== 
-- Query 3
-- Warehouse Utilization by Order Status (Shipped, Resolved, Disputed)
SELECT 
    p.warehouseCode, 
    SUM(p.quantityInStock) AS totalQuantityInStock,
    o.status, 
    SUM(od.quantityOrdered) AS totalProductsShipped
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON o.orderNumber = od.orderNumber
WHERE o.status IN ('Shipped', 'Resolved', 'Disputed')
GROUP BY p.warehouseCode, o.status
ORDER BY totalProductsShipped DESC, totalQuantityInStock DESC;

-- ========================================================== 
-- Query 4
-- Total Revenue by Product Line
SELECT 
    p.productLine, 
    SUM(od.priceEach * od.quantityOrdered) AS totalRevenue
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productLine
ORDER BY totalRevenue DESC;