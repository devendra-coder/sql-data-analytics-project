# 📊 SQL Data Analytics Project  

## 🔍 Overview  
This project demonstrates a complete **data analytics workflow using SQL Server**, transforming raw operational data into analytics-ready insights through the **Medallion Architecture** — Bronze (Raw), Silver (Cleaned), and Gold (Business-Ready).  

The goal is to build a scalable data warehouse and apply advanced SQL analytics for KPI tracking, business intelligence, and data-driven decision-making.  

---

## 🧱 Architecture  

### 1. Bronze Layer (Raw Data)
- Stores unprocessed CRM and ERP data from CSV files.  
- Maintains full fidelity with the source systems.  
- Tables: `crm_sales_details`, `crm_prd_info`, `crm_cust_info`, `erp_px_cat_g1v2`, `erp_cust_az12`, `erp_loc_a101`

### 2. Silver Layer (Cleaned & Standardized)
- Cleans and standardizes data for **consistency and accuracy**.  
- Fixes missing values, normalizes date formats, and enriches customer profiles.  
- Output tables are validated and ready for analytics.

### 3. Gold Layer (Business-Ready)
- Implements a **Star Schema** for analytics and BI.  
- Fact and dimension tables:
  - `gold.fact_sales`
  - `gold.dim_customers`
  - `gold.dim_products`  
- Enables unified analysis across sales, products, and customers.

---

## 📈 KPIs & Metrics  

### **Sales Performance**
| Metric | Result | Insight |
|---------|---------|----------|
| 💰 **Total Sales Revenue** | **₹29.36M** | Represents total company sales from 2010–2014 |
| 📈 **Sales Growth (YoY)** | **+18.7%** | Consistent growth till 2013; 2014 shows partial data |
| 📦 **Total Orders** | **27,659** | Cumulative orders recorded over 4 years |
| 🏆 **Top Product** | **"Mountain-200 Black- 46"** | Contributed **4.68%** of total revenue |
| 🏬 **Top Category** | **Bikes** | Dominates with **96.46%** of total revenue |

---

### **Customer Insights**
| Metric | Result | Insight |
|---------|---------|----------|
| 👥 **Total Customers** | **18,484** | Healthy and growing customer base |
| 🌍 **Top Country** | **United States (42%)** | Contributes the highest revenue share |
| 💸 **Avg. Order Value (AOV)** | **₹1,061** | Indicates balanced mid-range pricing |
| 🔁 **Repeat Customers** | **37.1%** | Shows good customer retention and loyalty |
| 🎯 **New vs Returning Ratio** | **63 : 37** | Balanced mix of acquisition and retention |

---

### **Product Analysis**
| Metric | Result | Insight |
|---------|---------|----------|
| 🧾 **Avg. Product Margin** | **39.8%** | Healthy profit margin across product lines |
| 🔧 **Maintenance Products** | **17.5%** | Require post-sale support and engagement |
| 🛒 **Best-Selling Category** | **Bikes** | Accounts for most of total sales volume |
| 🪫 **Underperforming Category** | **Clothing (-5.2%)** | Decline in recent demand trends |

---

### **Time-Based Analysis**
| Metric | Result | Insight |
|---------|---------|----------|
| 📆 **Monthly Sales Trend** | **+4.8% MoM** | Stable and consistent month-over-month growth |
| 🔄 **3-Month Moving Avg** | **₹1.05M** | Indicates steady performance trend |
| ⏳ **Peak Month** | **December 2013** | Strongest sales due to festive demand |
| 🧭 **Lowest Month** | **December 2010** | Lowest sales, early-stage operations |

---

---

## 🧩 Analytical Techniques  

- **Data Exploration:** Profiling, missing values, and type validation  
- **Ranking & Aggregation:** Top-N analysis using `RANK()` and `DENSE_RANK()`  
- **Trend Analysis:** Moving averages and time-based performance  
- **Cumulative KPIs:** Running totals using `SUM() OVER()`  
- **Segmentation:** Grouping by region, gender, marital status, and category  
- **Performance Reporting:** Customer and product reports exported to Excel  

---

## 🗂️ Project Structure  
```
sql-data-analytics-project/
│
├── datasets/
│ ├── csv-files/
│ │ ├── bronze/ → Raw CRM & ERP data
│ │ ├── silver/ → Cleaned & standardized data
│ │ └── gold/ → Star schema tables
│ └── DataWarehouseAnalytics.bak
│
├── scripts/
│ ├── 01_database_exploration.sql
│ ├── 02_dimension_exploration.sql
│ ├── ...
│ └── 13_report_products.sql
│
├── docs/
│ ├── customers_report.xlsx
│ └── products_report.xlsx
│
└── README.md
```

---

## 🧠 Tools & Technologies  
- **Database:** Microsoft SQL Server  
- **ETL & Transformation:** SQL scripting  
- **Analytics & Reporting:** Excel & SQL queries  
- **Model Design:** Star Schema (Fact & Dimension)  

---

## 🚀 How to Run  

1. **Clone the Repository**
   ```bash
   git clone https://github.com/devendra-coder/sql-data-analytics-project.git
   cd sql-data-analytics-project
   ```
2. **Restore the Database**
   1. Open SQL Server Management Studio (SSMS)
   2. Restore DataWarehouseAnalytics.bak
   3. Verify bronze, silver, and gold schemas
3. **Execute Scripts**
   1. Run scripts sequentially from /scripts/
   2. Observe layer-wise transformations
4. **Review Reports**
   1. Open /docs/customers_report.xlsx
   2. Open /docs/products_report.xlsx
   3. Review summarized insights

---

## 📊 Business Insights Summary

- Revenue grew **18.7% YoY** up to 2013, with a **minor dip in 2014** (due to partial data).  
- Repeat customers increased from **29% → 37%** over the last two years, showing stronger brand loyalty.  
- **Bikes** dominate total revenue with **96.4%** share, followed by **Clothing (2.5%)** and **Accessories (1.1%)**.  
- Peak demand consistently observed in **Q4 (October–December)**, driven by **holiday promotions and seasonal offers**.  
- Average **Order Value (AOV)** remained stable at **₹1,061**, indicating sustainable pricing and purchasing behavior.  
- **December 2013** achieved record-high revenue of **₹1.87M**, confirming the success of year-end sales campaigns.  
  

---

## 🧠 Learning Outcomes

- Applied **Medallion architecture** using SQL Server.  
- Designed a **data warehouse and star schema** from CRM and ERP systems.  
- Implemented **KPI dashboards** and business metrics through SQL.  
- Translated raw data into **actionable business insights**.  

---

## 🚀 Future Enhancements

- Add **Power BI dashboard** for visual storytelling.  
- Automate data pipelines using **Python / Airflow**.  
- Enable **incremental loading** for real-time analytics.  

---

## 👨‍💻 Author

**Devendra Singh**  
Data Analyst | SQL | Python | Power BI  
[![GitHub](https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white)](https://github.com/devendra-coder)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?logo=gmail&logoColor=white)](devendras162002@gmail.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?logo=linkedin&logoColor=white)](www.linkedin.com/in/devendra-singh-adhikari)

---

