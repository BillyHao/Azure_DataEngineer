---17.Total quantity of stock items sold in 2015, group by country of manufacturing.

SELECT si.CustomFields, SUM(Quantity) AS total_quantity
FROM Warehouse.StockItems AS si 
	JOIN Sales.OrderLines AS sol ON si.StockItemID = sol.StockItemID
	JOIN Sales.Orders AS so ON sol.OrderID = so.OrderID
WHERE YEAR(OrderDate) = 2015  
GROUP BY si.CustomFields;
