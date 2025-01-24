# Retail Sales Analysis - Beginner SQL Project

## Project Description
This project analyzes a retail sales dataset to gain insights into sales trends, customer behavior, and product performance using SQL. The dataset contains transactional data, including information on customers, product categories, quantities sold, and total sales amounts.

### Dataset Overview:
- **Columns**: The dataset includes the following columns: 
  - `Transaction_ID`, `Date`, `Customer_ID`, `Gender`, `Age`, `Product_Category`, `Quantity`, `Price_per_Unit`, `Total_Amount`.
- **Data Quality Check**: 
  - No missing values were found across all columns.
  - No duplicate transactions were identified (i.e., all `Transaction_ID`s are unique).
  
## SQL Queries and Results

### 1. Checking for Null Values and Duplicates
- **Query**: Checking for any records with missing values or duplicates.
  ```sql
  -- Checking for null values
  SELECT * FROM Retail_Sales
  WHERE 
    Transaction_ID IS NULL
    OR Date IS NULL
    OR Customer_ID IS NULL
    OR Gender IS NULL
    OR Age IS NULL
    OR Product_Category IS NULL
    OR Quantity IS NULL
    OR Price_per_Unit IS NULL
    OR Total_Amount IS NULL;
  
  -- Checking for duplicate records
  SELECT Transaction_ID, COUNT(*)
  FROM Retail_Sales
  GROUP BY Transaction_ID
  HAVING COUNT(*) > 1;
  ```
  ### Results:
- No missing data was found in any of the columns.
- No duplicate transactions were identified (each `Transaction_ID` is unique).

  ## 2. Total Sales Calculation

**Query**: Calculate the total sales across all transactions.

```sql
SELECT SUM(Total_Amount) AS Total_Sales 
FROM Retail_Sales;
```
### Results:
- Total sale amount is 456000.

  ## 3. Total Transactions Count

**Query**: Count the total number of transactions.

```sql
SELECT COUNT(Transaction_ID) AS Total_Transactions FROM Retail_Sales;
```
### Results:
- There are 1000 transactions in the dataset.

### 4. Total Sales by Gender
**Query**: Calculate total sales for each gender.

```sql
SELECT Gender, SUM(Total_Amount) AS Total_Sales 
FROM Retail_Sales
GROUP BY Gender;
```
### Results:
- The contribution of female category in total sales is 223160.
- The contribution of male category in total sales is 232840.

## 5. Total Sales by Product Category

### Query:
Calculate total sales by product category.

```sql
SELECT Product_Category, SUM(Total_Amount) AS Total_Sales
FROM Retail_Sales
GROUP BY Product_Category;
```
### Results:
- The contribution of Beauty category in total sales is 143515.
- The contribution of Electronics category in total sales is 156905.
- The contribution of Clothing category in total sales is 155580.

### 6. Total Sales by Month
**Query**: Calculate the total sales for each month.

```sql
SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, SUM(Total_Amount) AS Total_Sales
FROM Retail_Sales
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;
```
### Results:
- Sales in May 2023 were the highest, with a significant increase compared to other months.

### 7. Sales on January 1, 2024

**Query**: Find all transactions made on January 1, 2024.

```sql
SELECT * FROM Retail_Sales
WHERE Date = '2024-01-01';
```
### Results:
- There were 2 transactions made on January 1, 2024.

### 8. Electronics Sales in May 2023 (Quantity > 3)

**Query**: Filter transactions for "Electronics" category where quantity sold is more than 3 in May 2023.

```sql
SELECT *
FROM Retail_Sales
WHERE Product_Category = 'Electronics'
  AND FORMAT(Date, 'yyyy-MM') = '2023-05'
  AND Quantity > 3;
```
### Results:
- There were 11 transactions in May 2023 with more than 3 units sold in the "Electronics" category.

### 9. Average Age of Customers Who Purchased "Beauty" Products

- **Query**: Find the average age of customers who purchased items from the "Beauty" category.
  ```sql
  SELECT AVG(Age) AS Average_Age
  FROM Retail_Sales
  WHERE Product_Category = 'Beauty';
  ```
### Results:
- The average age of customers who purchased beauty products is 40 years.

### 10. Transactions Where Total Sale is Greater Than $1000

**Query**: Find transactions where the total sale is greater than 1000.

```sql
SELECT * 
FROM Retail_Sales
WHERE Total_Amount > 1000;
```
### Results:
- There are 153 transactions where the total sale exceeded 1000.

### 11. Total Number of Transactions by Gender and Category

- **Query**: Find the total number of transactions for each gender in each product category.
  
  ```sql
  SELECT Product_Category, Gender, COUNT(*) AS Number_Of_Transactions
  FROM Retail_Sales
  GROUP BY Gender, Product_Category
  ORDER BY 1;
  ```
  ### Results:
- The "Clothing" category had the most transactions for both genders.

### 12. Average Quantity Sold per Transaction

- **Query**: Calculate the average quantity sold per transaction.
  
  ```sql
  SELECT AVG(Quantity) AS Average_Quantity
  FROM Retail_Sales;
  ```
  ### Results:
- The average quantity sold per transaction is 2.

### 12. Average Sales per Month
- **Query**: Calculate the average sales for each month and identify the top-performing month.
  ```sql
  SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, ROUND(AVG(Total_Amount), 2) AS Average_Sales, SUM(Total_Amount) AS Total_Sales
  FROM Retail_Sales
  GROUP BY YEAR(Date), MONTH(Date)
  ORDER BY Average_Sales DESC;
  ```
    ### Results:
- February was the top-performing month with the highest average sales
- September was the lowest.

## Conclusion:

### Sales Distribution:
- Sales are fairly balanced between genders, but slightly skewed toward male customers. This insight can help tailor marketing campaigns based on gender preferences.

### Product Categories and Consumer Preferences:
- Clothing and Electronics categories are the primary drivers of revenue, with Beauty products appealing to a specific age group. This highlights the importance of targeted marketing strategies for each category.

### Time-Based Insights:
- May 2023 stands out as the month with the highest sales, which might warrant further investigation into the causes of this surge (e.g., promotions, product launches, or seasonal trends).
- Sales in February were also strong in terms of average sales per transaction, which can help identify peak times for promotions.

  




