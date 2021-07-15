SELECT 
	StockItemName
FROM 
	WareHouse.StockItems
WHERE 
	StockItemID NOT IN(
						SELECT ws.StockItemID
						FROM Warehouse.StockItems AS ws
							JOIN Sales.OrderLines AS ol
							ON ws.StockItemID = ol.StockItemID
							JOIN Sales.Orders AS o 
							ON ol.OrderID = o.OrderID
							JOIN Sales.Customers As sc 
							ON o.CustomerID = sc.CustomerID
						WHERE DeliveryPostalCode NOT LIKE '35%'
							AND DeliveryPostalCode NOT LIKE '36%'
							AND DeliveryPostalCode NOT LIKE '31%'
							AND DeliveryPostalCode NOT LIKE '30%'
							AND DeliveryPostalCode NOT LIKE '39%'
							AND OrderDate BETWEEN '2014-01-01' AND '2014-12-31');