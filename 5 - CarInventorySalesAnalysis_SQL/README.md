# 🧾 Mint Classics SQL Inventory & Sales Analysis

> **Author:** Naghmeh Naderi  
> **Tools Used:** MySQL, MySQL Workbench  
> **Database:** _The Mint Classics relational database_ consists of **8 tables** with a total of approximately **3,864 records**. The dataset is centered around transactional and inventory data. The largest table, orderdetails, contains **2,996 entries**, capturing individual product transactions. Other key tables include orders with 326 records, products with 110 items, and customers with 122 profiles. Supporting data structures include employees (23 entries), offices (7 locations), productlines (7 categories), and payments (273 records). This moderately sized dataset is well-suited for business analysis tasks such as inventory optimization, sales performance evaluation, and warehouse utilization insights.
## 📐 EER Diagram

![EER Diagram](EER_Diagram_MintDB.png)

## 📌 Project Overview

This project provides a detailed SQL-based analysis of the **Mint Classics** company's inventory, sales performance, and warehouse operations. The company is considering closing one of its warehouses and seeks data-driven recommendations to guide that decision.  

Using SQL queries, I analyzed product demand, stock levels, revenue by product line, and warehouse efficiency based on historical sales and order statuses.

---

## 📂 Project Structure

---

## ⚙️ How to Use

### ✅ Requirements:
- MySQL installed (version 8+ recommended)
- MySQL Workbench

### 🛠️ Setup:
1. Download or clone this repository.
2. Open **MySQL Workbench**.
3. Import `mintclassicsDB.sql` using:
   - **Server > Data Import > Import from Self-Contained File**
4. Open `analysis_queries.sql`.
5. Run each query section by section to explore the data.

---

## 📊 Analysis Summary and Potential Business Decisions

### 🔍 Query 1 – Low-Demand, High-Cost, High-Stock Products
Identifies items that have **high inventory**, **low order frequency**, and **high unit cost**.

📌 **Insight**: The query identifies ten products that represent a potential inventory liability — items with low sales volumes despite having substantial stock levels and in some cases, above-average unit costs. For example, the 1985 Toyota Supra (product code S18_3233) has a stock of 7,733 units but has recorded zero sales, making it a strong candidate for clearance or promotional campaigns. Similarly, the 1999 Indy 500 Monte Carlo SS and 1932 Alfa Romeo 8C2300 Spider Sport each have over 6,500 units in stock, yet have sold fewer than 900 units total, indicating a mismatch between inventory supply and customer demand. Items like the 1952 Citroen-15CV have a relatively high buy price ($72.82) combined with low sales, which increases the cost of holding unsold inventory. These insights suggest an opportunity to optimize warehouse space, reduce carrying costs, and improve stock efficiency by focusing on liquidating or re-evaluating procurement strategies for these underperforming products

---

### ⚠️ Query 2 – Stock Reduction Simulation (5%)
Tests what happens if all product stocks are reduced by **5%**. We check if that causes shortages.

**Risky Products Identified:**
- `1960 BSA Gold Star DBD34`
- `1968 Ford Mustang`

📌 **Insight**: To evaluate the potential impact of a 5% across-the-board inventory reduction, a simulation was run by calculating a new projected stock level (reducedStock) and comparing it to recent product demand. The results highlight two specific products that pose a stockout risk if such a reduction were implemented: the 1960 BSA Gold Star DBD34 (product code S24_2000) and the 1968 Ford Mustang (S12_1099). Both items have relatively low stock levels—15 and 68 units respectively—and have historically seen high order volumes of over 900 units each. If inventory were reduced by just 5%, their adjusted stock would fall well below 10% of historical demand, risking inability to fulfill future customer orders. This finding suggests that while a blanket inventory reduction could help optimize storage, certain high-turnover products must be excluded or adjusted individually to prevent service disruptions and lost revenue.

---

### 🏬 Query 3 – Warehouse Utilization by Order Status

Compares total stock vs. total items shipped for each warehouse and order status (`Shipped`, `Resolved`, `Disputed`).

**Example Output:**

| Warehouse | Total Stock | Status     | Products Shipped |
|-----------|-------------|------------|------------------|
| B         | 5,500,568   | Shipped    | 33,349           |
| A         | 3,416,646   | Shipped    | 22,762           |
| D         | 1,965,864   | Shipped    | 20,015           |

📌 **Insight**:  The analysis of Mint Classics’ warehouse inventory and shipment data reveals significant differences in utilization across facilities. Warehouse B holds the largest inventory with over 5.5 million units in stock and leads in total shipped products, indicating strong operational activity. Warehouses A and C also maintain substantial stock levels and shipment volumes, suggesting efficient use of resources. Interestingly, Warehouse D has a notably smaller inventory but manages to ship a comparable volume of products, highlighting its critical role despite limited stock capacity. While warehouses A, B, and C exhibit balanced stock-to-shipment ratios, Warehouse D’s high shipment rate relative to its stock signals potential capacity constraints or a strategic focus on fast-moving inventory. Additionally, the presence of orders in ‘Resolved’ and ‘Disputed’ statuses across warehouses points to some fulfillment challenges that warrant further investigation. Given these findings, consolidation efforts could consider merging warehouses A and C to optimize storage and logistics, but caution is advised with Warehouse D due to its pivotal shipping role. Before final decisions, it is essential to analyze customer delivery requirements and cost implications to ensure service levels remain uncompromised.

---

### 💰 Query 4 – Revenue by Product Line

Calculates total revenue from each product line.

📌 **Insight**:This query aggregates total revenue generated from each product line by summing the product of unit price (priceEach) and quantity ordered (quantityOrdered) across all sales. The results reveal that Classic Cars lead significantly with total revenue exceeding $3.85 million, nearly doubling the revenue of the next highest category, Vintage Cars at approximately $1.8 million. Motorcycles and Trucks and Buses also contribute substantial revenue, followed by Planes, Ships, and Trains. This distribution highlights the company’s strongest sales segments and suggests that focusing inventory management and marketing efforts on Classic and Vintage Cars could maximize profitability. Meanwhile, niche product lines like Trains generate comparatively lower revenue but may serve specialized customer demands.

---

## 📈 Recommendations

- 📦 **Consider consolidating warehouses A and C** based on similar size and performance.
- 🧊 **Avoid closing Warehouse D**, which shows high shipment throughput despite lower stock.
- 🔄 **Regularly review underperforming products** with high stock and low sales.
- 📉 **Proceed cautiously with stock reduction** on items that are close to reorder thresholds.

---

## 📁 Files Included

| File                    | Description                          |
|-------------------------|--------------------------------------|
| `analysis_queries.sql`  | Main SQL script (well-commented)     |
| `mintclassicsDB.sql`    | Optional – full DB schema & data     |
| `README.md`             | Documentation for the GitHub repo    |



