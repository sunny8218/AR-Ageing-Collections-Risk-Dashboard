# Accounts Receivable Aging & Collections Risk Dashboard

A dashboard and SQL analysis project that segments outstanding invoices by risk, region, and customer to support collections prioritization — built in Excel and MySQL Workbench.

## 📊 Overview

This project analyzes **3,000+ invoices** totaling **₹82+ lakhs** in outstanding receivables across **5 regions**, identifying **43% of total receivables (₹35+ lakhs) as overdue**. The goal: turn a raw invoice ledger into a decision-ready view of collections risk.

## 🛠️ Tools Used

- **Excel** — PivotTables, INDEX-MATCH, conditional-formatting heatmaps, interactive slicers
- **MySQL Workbench** — data aggregation, exploratory analysis, and customer-level risk scoring

## 📁 Repository Structure

```
├── dashboard/
│   └── AR_Aging_Dashboard.xlsx       # Full Excel dashboard with PivotTables & slicers
├── sql/
│   └── aging_analysis_queries.sql    # All SQL queries used in this project
├── screenshots/
│   └── dashboard_view.png            # Dashboard screenshot
└── README.md
```

## 🔍 Key Insights

- **Current receivables** make up 57.3% of total AR — the healthiest segment
- **90+ day overdue invoices** are the largest risk bucket: 925 invoices (~₹25 lakhs)
- **North region** carries the highest outstanding balance of all 5 regions
- **Highest single customer exposure:** ₹17,790 (Corrie)

## 🖥️ Dashboard Preview

![AR Aging Dashboard](screenshots/dashboard_view.png)

*Interactive Excel dashboard with region and aging-bucket slicers, KPI cards, and a top-10 customer view.*

## 🗄️ SQL Analysis

Exploratory queries covering record counts, total outstanding amounts, aging-bucket breakdowns, regional splits, and top-customer identification. The core **risk-scoring query** below classifies each customer by overdue severity:

```sql
SELECT 
    customer_name,
    ROUND(SUM(invoice_amount), 2) AS Outstanding,
    MAX(days_overdue) AS Max_Days_Overdue,
    CASE 
        WHEN MAX(days_overdue) > 90 THEN 'High Risk'
        WHEN MAX(days_overdue) BETWEEN 31 AND 90 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Category
FROM accounts_receivable
GROUP BY customer_name
ORDER BY Outstanding DESC;
```

See [`sql/aging_analysis_queries.sql`](sql/aging_analysis_queries.sql) for the full query set.

## 📈 Methodology

1. Cleaned and structured raw invoice data (customer, region, invoice amount, days overdue)
2. Categorized invoices into 4 aging buckets: 0-30 / 31-60 / 61-90 / 90+ days
3. Built Excel PivotTables and a heatmap to visualize risk concentration by bucket and region
4. Replicated and extended the analysis in SQL to enable customer-level risk classification

## 👤 Author

**Mehakpreet Kaur**
Final-year BBA Finance student, Lovely Professional University
[LinkedIn](https://linkedin.com/in/mehakpreet-kaur-384522313) · mehkbenipal698@gmail.com
