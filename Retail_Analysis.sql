USE Retail_SalesDB;
-- Checking the data
SELECT TOP 10 * FROM Retail_Sales
-- Checking for null values
SELECT * FROM Retail_Sales
WHERE 
	Transaction_ID IS NULL
	OR
	Date IS NULL
	OR
	Customer_ID IS NULL
	OR
	Gender IS NULL
	OR
	Age IS NULL
	OR
	Product_Category IS NULL
	OR
	Quantity IS NULL
	OR
	Price_per_Unit IS NULL
	OR
	Total_Amount IS NULL

--Checking for duplicates

SELECT Transaction_ID, COUNT(*)
FROM Retail_Sales
GROUP BY Transaction_ID
HAVING COUNT(*)>1;

--Total Sales

SELECT SUM(Total_Amount) AS Total_Sales FROM Retail_Sales

-- Total transactions

SELECT COUNT(Transaction_ID) AS Total_Transactions FROM Retail_Sales

-- Total Sales by gender

SELECT Gender, SUM(Total_Amount) AS Total_Sales 
FROM Retail_Sales
GROUP BY Gender

--Total Sales by product category

SELECT Product_Category, SUM(Total_Amount) AS Total_Sales
FROM Retail_Sales
GROUP BY Product_Category

--Total Sales month wise

SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, SUM(Total_Amount) AS Total_Sales
FROM Retail_Sales
GROUP BY YEAR(Date),MONTH(Date)
ORDER BY Year,Month

--Sales made on 2024-01-01

SELECT * FROM Retail_Sales
WHERE Date = '2024-01-01'  

--Transactions where category is Electronics and quantity sold is more than 3 in the month of May 2023

SELECT *
FROM Retail_Sales
WHERE Product_Category = 'Electronics'
	AND FORMAT(Date, 'yyyy-MM') = '2023-05'
	AND Quantity > 3;

--Average age of customers who purchased items from the 'Beauty' category

SELECT AVG(Age) AS Average_Age
FROM Retail_Sales
WHERE Product_Category = 'Beauty'

--Transactions where the total_sale is greater than 1000

SELECT * 
FROM Retail_Sales
WHERE Total_Amount > 1000

-- Total number of transactions made by each gender in each category

SELECT Product_Category, Gender, COUNT(*) AS Number_Of_Transactions
FROM Retail_Sales
GROUP BY Gender, Product_Category
ORDER BY 1

--Average Quantity Sold per transaction

SELECT AVG(Quantity) AS Average_Quantity
FROM Retail_Sales;

--Average sale of each month to find out top performed month

SELECT YEAR(Date) AS Year, MONTH(Date) As Month ,AVG(Total_Amount) AS Average_Sales, SUM(Total_Amount) AS Total_Sales
FROM Retail_Sales
GROUP BY YEAR(Date),MONTH(Date)
ORDER BY AVG(Total_Amount) DESC










