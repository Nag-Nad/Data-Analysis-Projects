# Lake Mendota Data Cleaning and Analysis

This project focuses on **cleaning, preprocessing, and analyzing temperature observations** from **Lake Mendota**. The main goals were to handle missing values, detect and treat outliers, and explore temporal and depth-related temperature patterns in the dataset.

---

## 📂 Dataset

- **Source**: [EDI Repository – North Temperate Lakes LTER](https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-ntl.130.33)  
- **Format**: Parquet (1.5 million rows)  
- **No duplicates** present  

### Columns
| Column     | Description |
|------------|-------------|
| `source`   | Dataset source identifier (`EDI knb-lter-ntl.130.33`) |
| `datetime` | Timestamp of observation |
| `lake_id`  | Lake identifier (`ME` = Mendota) |
| `depth`    | Depth in meters (0–20 m) |
| `variable` | Variable measured (`temp`) |
| `unit`     | Measurement unit (`DEG_C`) |
| `observation` | Temperature measurement |
| `flag`     | Quality control flag (many missing values, some `MAR`) |

---

## 🔎 Analysis Performed

1. **Missing values**  
   - Investigated missingness in `flag`.  
   - Found it was **MAR (Missing At Random)** because missingness was almost fully explained by the `observation` column.  

2. **Outlier detection**  
   - Checked for outliers across different timestamps.  
   - Observed **bimodal and unimodal** distributions depending on year/depth.  
   - Depth had no outliers (0–20 m range).  

3. **Outlier treatment**  
   - Applied **Winsorization** and **Iterative Imputer** for both univariate and bivariate temperature models.  

4. **Statistical summary before & after treating outliers**  

| Year-Month | Mean (before) | Min (before) | Max (before) | Mean (after) | Min (after) | Max (after) |
|------------|---------------|--------------|--------------|--------------|-------------|-------------|
| 2014-05    | 10.08         | 2.05         | 23.76        | 9.64         | 6.69        | 14.57       |
| 2014-06    | 14.10         | 2.48         | 22.80        | 14.15        | 8.76        | 21.05       |
| 2016-03    | 4.80          | 4.37         | 14.68        | 4.80         | 4.37        | 14.68       |
| 2016-04    | 5.13          | 4.49         | 6.68         | 5.13         | 4.49        | 6.68        |

5. **Classification of missingness**  
   - Built a **RandomForestClassifier** to test feature importance for missingness.  
   - Achieved **ROC AUC = 0.99**.  
   - Results: `observation` explained ~98% of missingness, `depth` had minor contribution (~2%).  

---

## 📊 Key Insights

- **Missingness is MAR**, primarily determined by the observation values.  
- Outliers varied by timestamp and sometimes depended on depth (e.g. 2014), but in 2016 depth had no influence.  
- After treatment, extreme unrealistic values (e.g. 23.76 °C at 20 m) were capped to more realistic ranges.  

---

## 🚀 How to Run

### Requirements
- Python 3.9+  
- Install dependencies:
```bash
pip install pandas numpy scikit-learn seaborn matplotlib pyarrow
