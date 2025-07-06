# 📉 Layoff Patterns Through SQL + Power BI Dashboard

### 🧠 Project Overview
This project analyzes global layoff trends using SQL to uncover patterns by company, industry, year, and location. The insights were further visualized using Power BI to create an interactive and intuitive dashboard for decision-makers.

---

### 🛠 Tools & Technologies
- **SQL:** PostgreSQL / MySQL (Joins, CTEs, Window Functions, Aggregations)
- **Power BI:** Dashboard creation, slicers, trend lines, KPI visuals
- **Excel:** Initial data cleanup
- **GitHub:** Project versioning

---

### 🗃 Dataset Details
- SQL_Query:layoff_pattern_analysis.sql
- Fields include: `Company`, `Industry`, `Country`, `Laid_Off_Count`, `Total_Employees`, `Date`, `% Laid Off`, etc.

---

### 🔍 Business Questions Answered
- Which companies and industries experienced the most layoffs?
- How did layoffs change over time (monthly/yearly)?
- Which countries were affected the most?
- Are there patterns in % of employees laid off?

---

### 🧠 SQL Skills Demonstrated
- Joins between date and industry tables
- Common Table Expressions (CTEs)
- `RANK()` and `ROW_NUMBER()` for top company insights
- Filtering with `GROUP BY` and `HAVING`
- `CASE WHEN` logic to tag risk levels

---

### 📊 Power BI Dashboard
An interactive Power BI dashboard was created with:
- Filters by company, industry, and country
- Year-over-year trend visualizations
- Top 10 companies by total layoffs
- Bar and line charts to illustrate severity over time

📎 **[View Dashboard Screenshot](dashboard/layoff-dashboard-screenshot.png)**  
📎 **[Download .pbix File](dashboard/Layoff_Analysis_Dashboard.pbix)**

---

### 📂 Repository Structure
