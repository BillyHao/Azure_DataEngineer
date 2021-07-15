SELECT	StockItemName, SUM(QuantityPerOuter) AS Quantity
FROM Warehouse.StockItems AS ws
	JOIN Purchasing.PurchaseOrderLines AS ol
	ON ws.StockItemID = ol.StockItemID
	JOIN Purchasing.PurchaseOrders AS o 
	ON ol.PurchaseOrderID = o.PurchaseOrderID
WHERE 
	OrderDate Between '2013-01-01' AND '2013-12-31'
GROUP BY StockItemName;