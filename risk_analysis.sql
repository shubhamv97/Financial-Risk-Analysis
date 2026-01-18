
-- Financial Risk Analysis SQL Queries

-- Create table
CREATE TABLE loan_data (
    Loan_ID INT,
    Age INT,
    Income INT,
    Loan_Amount INT,
    Credit_Score INT,
    Default_Status VARCHAR(10)
);

-- High risk customers
SELECT *
FROM loan_data
WHERE Credit_Score < 650 OR Income < 40000;

-- Default rate by income group
SELECT 
    CASE
        WHEN Income < 40000 THEN 'Low Income'
        WHEN Income BETWEEN 40000 AND 70000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Default_Status = 'Yes' THEN 1 ELSE 0 END) AS Default_Count
FROM loan_data
GROUP BY Income_Group;
