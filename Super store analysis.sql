
----which region drives the business? USA

SELECT 
       [Country_Region]
      ,round(sum([Sales]),2) as Total_Sales
      ,round(sum([Profit]),2) as Total_Profit
      ,round(sum([Profit_Margin]),2) as Profit_Margin
  FROM [Super_Store].[dbo].[SSTORES]
  GROUP BY [Country_Region]
  ORDER BY Total_Sales


  --Are discounts distroying profit? Yes higher discount impacts profit significantly as seen in the case of USA
SELECT 
	   [Country_Region]
       ,round(sum([Discount]),2) as	Total_discount
      ,round(sum([Profit]),2) as Total_Profit
      ,round(sum([Sales]),2) as Total_Sales
	  ,round((sum([Profit])/sum([Sales])),2)*100 as Profit_Margin
  FROM [Super_Store].[dbo].[SSTORES]

  GROUP BY Country_Region
  ORDER BY Total_discount

  /**which category is the problem? The Furniture Category. 
  This is because a lot of discount is pushed to drive sale which in turn has affected to total profit generated from it sale.**/
SELECT 
       [Category]
      ,sum([Quantity]) as Total_Quantity_Sold
      ,round(sum([Discount]),2) as	Total_discount
      ,round(sum([Profit]),2) as Total_Profit
      ,round(sum([Sales]),2) as Total_Sales
	  ,round(sum([Profit_Margin]),2) as Profit_Margin
  FROM [Super_Store].[dbo].[SSTORES]

  GROUP BY Category
  ORDER BY Total_Quantity_Sold


  /**monthly performance trend. 
  Sales and profit are higher in the festive months Novermber and December and lowest February**/

  SELECT 
		 
       Datepart(MONTH,Order_Date) as Order_Month
      ,sum([Quantity]) as Total_Quantity_Sold
      ,round(sum([Discount]),2) as	Total_discount
      ,round(sum([Profit]),2) as Total_Profit
      ,round(sum([Sales]),2) as Total_Sales
	  ,round(sum([Profit_Margin]),2) as Profit_Margin
  FROM [Super_Store].[dbo].[SSTORES]

  GROUP BY  Datepart(MONTH,Order_Date)
  ORDER BY Total_Quantity_Sold desc

  --find the worst product. Cubify Cubex is the worst product with a loss of 3839.99
  SELECT top(1)
       [Product_Name]
      ,sum([Quantity]) as Total_Quantity_Sold
      ,round(sum([Discount]),2) as	Total_discount
      ,round(sum([Profit]),2) as Total_Profit
      ,round(sum([Sales]),2) as Total_Sales
	  ,round(sum([Profit_Margin]),2) as Profit_Margin
  FROM [Super_Store].[dbo].[SSTORES]

  GROUP BY [Product_Name]
  ORDER BY Total_Profit
  