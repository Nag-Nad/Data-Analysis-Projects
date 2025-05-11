## 📌 Project Objectives

- Explore the residential real estate market to support investment decisions.
- Develop a predictive model to estimate house prices based on property features.
- Perform data analysis using attributes such as:
  - Square footage
  - Number of bedrooms
  - Number of floors
  - Additional relevant property characteristics
- Visualize trends and relationships within the dataset to uncover key insights.
- Evaluate how each feature influences property pricing.
- Generate final charts, tables, and calculations to support findings and recommendations.

---
## 🛠️ Tools Used

- **Jupyter Notebook**: Used as the primary environment for coding, data analysis, and visualization.
- **Python**: Used for reading CSV files, performing data manipulation, and creating visualizations with libraries such as: _pandas_ for data handling, _matplotlib_ and _seaborn_ for charts and plots, _squarify_ for treemaps and _Scikit Learn_ for generating machine learning models.

---
## 📂 Dataset

This dataset contains information on house sale prices for King County, including Seattle, with sales occurring between May 2014 and May 2015. The data has been slightly modified for this project.

### Variables

| **Variable**      | **Description**                                                                                                 |
| ----------------- | --------------------------------------------------------------------------------------------------------------- |
| `id`              | Unique identifier for each house                                                                                 |
| `date`            | Date when the house was sold                                                                                     |
| `price`           | Sale price of the house (prediction target)                                                                      |
| `bedrooms`        | Number of bedrooms in the house                                                                                  |
| `bathrooms`       | Number of bathrooms in the house                                                                                 |
| `sqft_living`     | Square footage of the living area of the home                                                                    |
| `sqft_lot`        | Square footage of the lot                                                                                       |
| `floors`          | Number of floors in the house                                                                                    |
| `waterfront`      | Indicates whether the house has a waterfront view                                                                |
| `view`            | Indicates how many times the house has been viewed                                                                |
| `condition`       | Overall condition rating of the house                                                                            |
| `grade`           | Overall grade given to the housing unit, based on the King County grading system                                 |
| `sqft_above`      | Square footage of the house excluding the basement                                                                |
| `sqft_basement`   | Square footage of the basement                                                                                   |
| `yr_built`        | Year when the house was built                                                                                   |
| `yr_renovated`    | Year when the house was renovated                                                                                |
| `zipcode`         | Zip code of the house                                                                                           |
| `lat`             | Latitude coordinate of the house                                                                                 |
| `long`            | Longitude coordinate of the house                                                                                |
| `sqft_living15`   | Square footage of the living area in 2015, which may have been affected by renovations                         |
| `sqft_lot15`      | Square footage of the lot area in 2015, which may have been affected by renovations                             |

---
## 🔍 Key Analysis Performed

- **Data Wrangling**  
  - Dropped unused columns and handled missing (`NaN`) values to clean the dataset for analysis.

- **Outlier Detection & Correlation Analysis**  
  - Used **box plots** to identify outliers, especially for comparing house prices with and without waterfront views.  
  - Employed **regression plots** to visualize the relationship between price and square footage.  
  - Calculated correlation coefficients to determine the strength of relationships between various features and house price.

- **Model Development & Evaluation**  
  - Built a **Linear Regression model** using two key features and evaluated its performance using the R² score.  
  - Expanded the model with multiple relevant features to improve accuracy.  
  - Created a **Ridge Regression model**, and further enhanced it using **Polynomial Features** to capture non-linear relationships.  
  - Compared R² scores across models to assess performance improvements.
    
---
## 🧠 Skills Demonstrated

- **Data Cleaning and Preprocessing**  
  - Handled missing values and removed irrelevant columns to prepare the dataset for analysis.

- **Exploratory Data Analysis (EDA)**  
  - Utilized visual tools like box plots and regression plots to uncover patterns and outliers.  
  - Investigated correlations between features and target variable (price).

- **Statistical Modeling**  
  - Applied linear regression and ridge regression techniques to predict house prices.  
  - Evaluated model performance using R² score and interpreted results.

- **Feature Engineering**  
  - Selected meaningful features for modeling and experimented with polynomial transformations to improve model accuracy.

- **Python Programming**  
  - Leveraged libraries such as `pandas`, `matplotlib`, `seaborn`, `sklearn`, and `numpy` for data analysis, visualization, and machine learning tasks.


