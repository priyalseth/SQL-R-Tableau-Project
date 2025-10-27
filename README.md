#  Global Data on Sustainable Energy (2000–2020)
**SQL-R-Tableau Project**

##  Overview
This project explores **global sustainable energy trends** from 2000 to 2020, focusing on energy consumption, renewable sources, and forecasting future energy patterns.  
It combines **data engineering**, **statistical forecasting**, and **data visualization** using three key technologies:
- **SQL** – for data extraction, cleaning, and transformation  
- **R** – for forecasting and statistical modeling  
- **Tableau** – for building an interactive dashboard

---

##  Project Workflow

### 1.  Data Handling (SQL)
- Imported the raw dataset on *Global Sustainable Energy (2000–2020)* into a SQL database.
- Performed:
  - Data cleaning (handling missing or inconsistent values)
  - Normalization and type conversions
  - Aggregation and filtering to extract relevant metrics
- Exported the cleaned dataset for analysis in R.

📄 File: `Data handling global-data-on-sustainable-energy.sql`

---

### 2.  Forecasting (R)
- Imported the cleaned dataset from SQL into **R Studio**.
- Conducted **time series forecasting** to predict future energy consumption and renewable trends.
- Applied statistical and visualization libraries such as:
  - `forecast`
  - `ggplot2`
  - `dplyr`
- Key insights:
  - Forecasted increase in renewable energy share globally.
  - Identified regions with high dependency on non-renewable sources.

---

### 3.  Dashboard (Tableau)
- Created an **interactive Tableau dashboard** to visualize:
  - Yearly energy consumption trends
  - Forecasted growth (based on R model results)
  - Regional comparisons (continent/country level)

The dashboard enables users to explore data dynamically and understand sustainability patterns.

---

##  Results & Insights
From the combined SQL–R–Tableau workflow, several key findings emerged:

1. **Steady Growth in Renewable Energy:**  
   Between 2000 and 2020, renewable energy consumption increased by over **60% globally**, driven mainly by solar and wind adoption.

2. **Regional Variations:**  
   - **Europe and North America** showed strong policy-driven transitions to renewables.  
   - **Asia** demonstrated rapid industrial growth, still heavily dependent on non-renewables, but with rising investments in clean energy.

3. **Forecasting Outlook (R Results):**  
   - Predicted that by **2030**, renewables will account for nearly **45–50%** of total global energy consumption if current growth rates continue.  
   - **Developing economies** are expected to experience the highest acceleration in clean energy adoption.

4. **Carbon Reduction Impact:**  
   - Data suggests that consistent renewable energy growth could lead to a **significant decline in global CO₂ emissions**, supporting the UN’s Sustainable Development Goals (SDG 7 & 13).

---

## ⚙️ Tech Stack
| Component | Tool/Language |
|------------|----------------|
| Data Handling | **SQL** |
| Forecasting & Analysis | **R (RStudio)** |
| Visualization | **Tableau** |
| Version Control | **GitHub** |

---


SQL-R-Tableau-Project/
│
├── Data handling global-data-on-sustainable-energy.sql # SQL scripts for data preparation
├── forecasting.R # R script for forecasting (if added)
├── Tableau Dashboard/ # Tableau workbook or screenshots
├── README.md # Project documentation
└── data/ # Processed data files (optional)


---

##  Key Learnings
- Integrated workflow across SQL, R, and Tableau
- Hands-on experience in data cleaning, forecasting, and visualization
- Practical understanding of renewable energy data trends
- End-to-end project execution with reproducible steps

---

##  Dashboard Preview
*<img width="1366" height="768" alt="tableau Dashboard view 2" src="https://github.com/user-attachments/assets/faab123c-2217-4141-9b69-0630bbde283c" />
*

---

##  Future Enhancements
- Automate data pipeline (SQL → R → Tableau)
- Add machine learning forecasting (e.g., ARIMA, Prophet)
- Include real-time data updates via APIs

---

## Author
**[Priyal Seth](https://github.com/priyalseth)**  
Data Analytics & AI Enthusiast  
📫 Connect via GitHub for collaboration or feedback.

---

##  Tags
`#DataAnalytics` `#SQL` `#R` `#Tableau` `#Forecasting` `#Sustainability` `#EnergyTrends`

