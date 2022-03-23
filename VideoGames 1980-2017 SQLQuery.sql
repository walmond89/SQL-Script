select *
FROM dbo.vgsales


select Rank, Name, Global_Sales 
FROM dbo.vgsales
ORDER BY Global_sales desc


select Publisher, Rank, Global_sales
FROM dbo.vgsales
ORDER BY Global_sales desc


select Platform, SUM(Global_sales) as Total_sales
FROM dbo.vgsales
GROUP BY Platform
ORDER BY Total_sales desc


select SUM(Global_sales) as Total_globalsales, SUM(NA_sales) as Total_na_sales, SUM(EU_sales) as Total_eu_sales, SUM(JP_sales) as Total_jp_sales,  
SUM(Other_sales) as Total_other_sales  
FROM dbo.vgsales


select Platform, SUM(NA_sales) as Total_na_sales, SUM(EU_sales) as Total_eu_sales, SUM(JP_sales) as Total_jp_sales, SUM(Other_sales) as Total_other_sales  
FROM dbo.vgsales
GROUP BY Platform
ORDER BY Platform


select Publisher, SUM(NA_sales) as Total_na_sales, SUM(EU_sales) as Total_eu_sales, SUM(JP_sales) as Total_jp_sales, SUM(Other_sales) as Total_other_sales  
FROM dbo.vgsales
GROUP BY Publisher
ORDER BY Publisher


select Genre, SUM(NA_sales) as Total_na_sales, SUM(EU_sales) as Total_eu_sales, SUM(JP_sales) as Total_jp_sales, SUM(Other_sales) as Total_other_sales  
FROM dbo.vgsales
GROUP BY Genre
ORDER BY Genre 


select Year, SUM(Global_sales) as Total_globalsales
FROM dbo.vgsales
GROUP BY Year
ORDER BY Total_globalsales desc