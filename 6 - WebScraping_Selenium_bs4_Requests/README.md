# 🥫 Web Scraping OpenFoodFacts: Product & Nutrition Data Extraction

This project focuses on extracting product information and nutritional values from the [Open Food Facts](https://world.openfoodfacts.org/) website using a combination of web scraping tools such as `Selenium`, `BeautifulSoup`, and `requests`. The goal is to automate data collection for the top 50 most scanned products and organize the information into structured `pandas` DataFrames for further use.

---

## 📌 Project Overview

The scraping process was divided into **two main parts**:

### 1. **Scraping Top 50 Most Popular Products**

**Tools Used**: `Selenium` (via Docker), `BeautifulSoup`, `requests`, `pandas`, `numpy`

**Why Selenium?**  
The main page uses JavaScript to dynamically load product data, which cannot be accessed using only `BeautifulSoup`. So, `Selenium` was used to simulate a browser and retrieve the top 50 most scanned product names and their corresponding URLs.

**Steps**:

- Selenium was used to access the homepage sorted by popularity and extract the product URLs (`href`) and names.
- Individual product pages were inspected using Chrome DevTools to identify `id` attributes corresponding to product details.
- Using the product links, `requests` and `BeautifulSoup` were used to extract the following information for each product:

  - `generic_name`
  - `quantity`
  - `packaging`
  - `brands`
  - `categories`
  - `labels`
  - `origin`
  - `manufacturing_places`
  - `stores`
  - `countries`
  - `value`
  - `barcode`

- The extracted data was stored in a `pandas` DataFrame.
- Missing fields were handled using `numpy.nan`.

---

### 2. **Scraping Nutritional Values Using Product Barcode**

For specific products (e.g., *Evian Natural Mineral Water*), the **barcode** was used to access its product page and extract nutritional details.

**Tools Used**: `requests`, `BeautifulSoup`, `pandas`

**Nutritional fields extracted**:

- Energy
- Fat
- Carbohydrates
- Sugars
- Proteins
- Salt

The nutritional data was added to a new `pandas` DataFrame for structured storage and analysis.

---

## 🐳 Docker Setup for Selenium

To run Selenium in headless mode using Docker:

```bash
docker run -d -p 4444:4444 -p 7900:7900 --shm-size="2g" selenium/standalone-chrome

```

Ensure your Selenium driver in Python is configured as follows:

command_executor = "http://localhost:4444/wd/hub"

---

## **Packages Used:**

- selenium
- requests
- beautifulsoup4
- pandas
- numpy
