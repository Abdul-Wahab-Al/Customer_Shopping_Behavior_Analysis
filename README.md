# Customer Shopping Behavior Analysis
End-to-end Customer Shopping Behavior Analysis using R for data cleaning, SQL (BigQuery) for analytics, and interactive Power BI dashboards. Includes insights, findings, and actionable recommendations.



**Created by:** Abdul Wahab  
**Projects:** Google Data Analytics Capstone Project & Nexus AI Internship (Data Science & ML Intern)

---

## Project Overview

This project analyzes customer shopping behavior across 3,900 transactions to uncover insights that guide business decisions. The goal was to understand customer demographics, purchasing patterns, subscription behavior, and revenue drivers. The project integrates **R for data cleaning**, **SQL (BigQuery) for analysis**, and **Power BI for interactive dashboards**.  

The project follows the **six-step data analytics methodology**:  
**Ask → Prepare → Process → Analyze → Share → Act**

---

## Workflow

### 1. Data Collection & Loading
- Imported raw customer dataset using **R** (`readxl`, `tidyverse`).  
- Explored dataset using `glimpse()`, `summary()`, and `as_tibble()` to understand structure, missing values, and key features.  

### 2. Data Cleaning & Preparation in R
- Handled missing values in `Review Rating` column by imputing the **median rating per product category**.  
- Standardized column names: lowercase with underscores.  
- Removed redundant columns (`promo_code_used`) after checking for duplicates with `discount_applied`.  
- Renamed `purchase_amount_(usd)` to `purchase_amount`.  
- Created new features:  
  - `age_group` (Young Adult, Adult, Middle-aged, Senior)  
  - `purchases_frequency_days` mapped from textual frequency.  
- Exported the cleaned dataset as `cleaned_dataset.csv`.  

### 3. BigQuery Integration
- Uploaded cleaned dataset into **Google BigQuery** for scalable analysis.  
- Verified upload by downloading a sample of 10 rows.  

### 4. SQL Analysis
Key queries included:  
- Revenue comparison by **gender** and **age groups**  
- Impact of **discounts** on purchases  
- Identification of **top-rated products** and **best-selling categories**  
- **Subscription and loyalty analysis**  
- Segmenting customers as **New, Returning, Loyal**  
- **Shipping type analysis** and purchase patterns  

**Findings from SQL Analysis:**  
- Male customers contributed a larger share of revenue.  
- Subscribers spend more on average than non-subscribers.  
- Discounts increase purchases but require margin management.  
- Top-rated products align with best-selling categories.  
- Female participation in purchases and subscriptions is notably low.  

### 5. Visualization in Power BI
- Created an **interactive dashboard** highlighting:  
  - Customer demographics (age, gender, location)  
  - Revenue & purchase trends by category and age group  
  - Subscription status insights  
  - Discount utilization impact  
  - Dynamic filters for gender, subscription, category, and shipping type  

**Dashboard Purpose:**  
To present actionable insights visually for stakeholders, supporting marketing, loyalty programs, and product positioning strategies.  

### 6. Recommendations
- **Boost Subscriptions:** Promote exclusive benefits for subscribers.  
- **Customer Loyalty Programs:** Reward repeat buyers to grow the “Loyal” segment.  
- **Review Discount Policy:** Balance sales incentives with margins.  
- **Product Positioning:** Highlight top-rated, best-selling products.  
- **Targeted Marketing & Engage Women:** Launch campaigns to attract female customers and introduce new subscription features tailored for their needs.  

---

## Repository Structure

Customer_Shopping_Behavior_Analysis/ <br>
│                                    <br>
├─ business_program_document.pdf     <br>
├─ cleaned_dataset.csv               <br>
├─ customer_shopping_analysis.R       <br>
├─ customer_shopping_behavior_demographics.xlsx       <br>
├─ customer_shopping_behavior_file.xlsx  <br>
├─ SQL_queries.sql           <br>
├─ sql_questions.txt        <br>
├─ PowerBI_dashboard.pbix     <br>
├─ Customer_Shopping_Report.pdf   <br>
└─ README.md       <br>

---

## Tools & Technologies
- **R (tidyverse, readxl, dplyr)** – Data cleaning and transformation  
- **SQL (BigQuery)** – Analytical queries and reporting  
- **Power BI** – Interactive visualization and dashboards  
- **Google Data Analytics Methodology** – Six-step workflow applied end-to-end  

---

## Learning Outcomes
- Combined multiple tools (R, SQL, Power BI) into a single workflow.  
- Applied real-world data analytics methods to generate actionable insights.  
- Practiced full-cycle analytics: cleaning, querying, reporting, and visualization.  
- Developed ability to present data-driven recommendations clearly for business stakeholders.  

---

