use finance_dashboard;
SELECT *
FROM accounts_receivable
LIMIT 10;
DESCRIBE accounts_receivable;

-- Total records--
SELECT COUNT(*) AS Total_Records
FROM accounts_receivable;

-- Total Outstanding Amount--
SELECT
ROUND(SUM(invoice_amount),2) AS Total_Outstanding
FROM accounts_receivable;

-- regions covered--
SELECT DISTINCT region
FROM accounts_receivable;

-- Outstanding Amount by Aging Bucket--
SELECT
aging_bucket,
COUNT(invoice_id) AS Total_Invoices,
ROUND(SUM(invoice_amount),2) AS Outstanding_Amount
FROM accounts_receivable
GROUP BY aging_bucket
ORDER BY
MIN(days_overdue);

-- Top 10 Customers by Outstanding Amount--
SELECT
customer_name,
ROUND(SUM(invoice_amount),2) AS Outstanding
FROM accounts_receivable
GROUP BY customer_name
ORDER BY Outstanding DESC
LIMIT 10;

-- Outstanding Amount by Region--
SELECT
region,
ROUND(SUM(invoice_amount),2) AS Outstanding
FROM accounts_receivable
GROUP BY region
ORDER BY Outstanding DESC;

-- Average Days Overdue--
SELECT
ROUND(AVG(days_overdue),2) AS Avg_Days_Overdue
FROM accounts_receivable;

-- CASE WHEN risk categorization --
SELECT 
    customer_name,
    ROUND(SUM(invoice_amount),2) AS Outstanding,
    MAX(days_overdue) AS Max_Days_Overdue,
    CASE 
        WHEN MAX(days_overdue) > 90 THEN 'High Risk'
        WHEN MAX(days_overdue) BETWEEN 31 AND 90 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Category
FROM accounts_receivable
GROUP BY customer_name
ORDER BY Outstanding DESC;



