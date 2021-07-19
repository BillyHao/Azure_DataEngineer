---10.List of Customers and their phone number, together with the primary contact person’s name, 
---to whom we did not sell more than 10  mugs (search by name) in the year 2016. ###

USE WideWorldImporters
SELECT 
	c.CustomerName, 
	c.PhoneNumber,
	c.PrimaryContactPersonID,
	SUM(ol.Quantity) AS Q
FROM Sales.Customers AS c
	JOIN Sales.Orders AS o ON c.CustomerID = o.CustomerID
	JOIN Sales.OrderLines AS ol ON o.OrderID = ol.OrderID
	JOIN Warehouse.StockItems AS s ON ol.StockItemID = s.StockItemID
WHERE s.StockItemName LIKE '%mug%' AND YEAR(OrderDate) =2016
GROUP BY c.CustomerName,c.PhoneNumber,c.PrimaryContactPersonID
HAVING SUM(ol.Quantity) > 10;
							  