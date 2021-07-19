---14.List of Cities in the US and the stock item that the city got the most deliveries in 2016. 
---If the city did not purchase any stock items in 2016, print “No Sales”.

SELECT 
	sub.CityName,
	sub.StockItemName,
	sub.Quantities,
	CASE WHEN sub.Quantities = 0 THEN 'NoSales'
	ELSE 'HasSales' END AS Ifsale,
	DENSE_RANK()
		OVER(PARTITION BY sub.CityName
				ORDER BY sub.Quantities DESC) AS rn
FROM 
	(
	SELECT 
		CityName,
		si.StockItemName,
		SUM(Quantity) AS Quantities
	FROM Application.Cities AS ac 
		JOIN Sales.Customers AS sc ON ac.CityID =sc.PostalCityID
		JOIN Sales.Orders AS so ON sc.CustomerID = so.CustomerID
		JOIN Sales.OrderLines As sol ON so.OrderID = sol.OrderID
		JOIN Warehouse.StockItems AS si ON sol.StockItemID = si.StockItemID
	WHERE YEAR(OrderDate) = 2016
	GROUP BY si.StockItemName, CityName
	) AS sub
WHERE rn = 1
;