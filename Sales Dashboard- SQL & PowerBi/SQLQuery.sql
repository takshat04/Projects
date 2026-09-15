

SELECT *
INTO [dbo].[Sales_Data]
FROM [dbo].[Sales_Canada]

UNION ALL
SELECT * FROM [dbo].[Sales_China]

UNION ALL
SELECT * FROM [dbo].[Sales_India]

UNION ALL
SELECT * FROM [dbo].[Sales_Nigeria]

UNION ALL
SELECT * FROM [dbo].[Sales_UK]

UNION ALL
SELECT * FROM [dbo].[Sales_US];



SELECT * FROM Sales_Data
where "Country" is null
or "Price_per_Unit" is null
or "Quantity_Purchased" is null
or "Cost_Price" is null
or "Discount_Applied" is null;



Update Sales_Data
Set "Quantity_Purchased" = 3
Where Transaction_ID = '00a30472-89a0-4688-9d33-67ea8ccf7aea';

Update Sales_Data
Set Price_per_Unit = (SELECT AVG(Price_per_Unit) from Sales_Data where Price_per_Unit is not null )
Where Transaction_ID = '95e49860-f77d-4598-a078-098a8c570147';

Update Sales_Data
Set Price_per_Unit = (SELECT AVG(Price_per_Unit) from Sales_Data where Price_per_Unit is not null )
Where Transaction_ID = '001898f7-b696-4356-91dc-8f2b73d09c63';

Update Sales_Data
Set Discount_Applied = (SELECT AVG(Discount_Applied) from Sales_Data where Discount_Applied is not null )
Where Transaction_ID = '45e4aaf0-240d-464c-b5cf-0ae075998169';



SELECT Transaction_ID, Count(*)
FROM Sales_Data
Group By Transaction_ID
Having Count(*) > 1 ;



Alter Table Sales_Data 
Add Total_Amount Decimal(10,2);

update Sales_Data
Set "Total_Amount" = (Price_per_Unit * Quantity_Purchased) - Discount_Applied;


Alter Table Sales_Data 
Add Profit Decimal(10,2);

update Sales_Data
Set "Profit" = Total_Amount - (Cost_Price * Quantity_Purchased);



SELECT * FROM Sales_Data;



Select Country , SUM(Total_Amount) as Total_Revenue, Sum(Profit) as Total_Profit
FROM Sales_Data
WHERE "Date" Between '2025-02-10' AND '2025-02-14'
Group By Country
Order By Total_Revenue DESC;



SELECT Product_Name, SUM(Quantity_Purchased) as Total_Unit_Sold  
FROM Sales_Data
WHERE "Date" Between '2025-02-10' AND '2025-02-14'
Group By Product_Name
Order By Total_Unit_Sold DESC
OFFSET 0 ROWS
FETCH FIRST 10 ROWS ONLY;



SELECT Sales_Rep, SUM(Total_Amount) as Total_Sales
FROM Sales_Data
WHERE "Date" Between '2025-02-10' AND '2025-02-14'
Group By Sales_Rep
Order By Total_Sales
OFFSET 0 ROWS
FETCH FIRST 10 ROWS ONLY;



SELECT Store_Location, SUM(Total_Amount) as Total_Sales, SUM(Profit) as Total_Profit
FROM Sales_Data
WHERE "Date" Between '2025-02-10' AND '2025-02-14'
Group By Store_Location
Order By Total_Sales
OFFSET 0 ROWS
FETCH FIRST 10 ROWS ONLY;



SELECT MIN(Total_Amount) as Min_Sales_Value, MAX(Total_Amount) as Max_Sales_Value, 
	   AVG(Total_Amount) as Avg_Sales_Value, SUM(Total_Amount) as Sum_Sales_Value, 

	   MIN(Profit) as Min_Profit, MAX(Profit) as Max_Profit, 
	   AVG(Profit) as Avg_Profit, SUM(Profit) as Sum_Profit

FROM Sales_Data
WHERE "Date" Between '2025-02-10' AND '2025-02-14';