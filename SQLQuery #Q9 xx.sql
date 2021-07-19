---9.List of StockItems that the company purchased more than sold in the year of 2015.***
USE WideWorldImporters

SELECT 
		sq.StockItemName, pq.purchaseQuantity, sq.saleQuantity
FROM 
	(   
		SELECT ws.StockItemName,SUM(Quantity) AS saleQuantity
		FROM Warehouse.StockItems AS ws
			JOIN Sales.OrderLines AS ol ON ws.StockItemID = ol.StockItemID
			JOIN Sales.Orders AS o ON ol.OrderID = o.OrderID
		WHERE YEAR(o.OrderDate) = 2015
		GROUP BY ws.StockItemName

	) AS sq 

	JOIN(
		SELECT ws.StockItemName, SUM(OrderedOuters*QuantityPerOuter) AS purchaseQuantity
		FROM Warehouse.StockItems AS ws
			JOIN Purchasing.PurchaseOrderLines AS pol ON ws.StockItemID = pol.StockItemID
			JOIN Purchasing.PurchaseOrders AS po ON po.PurchaseOrderID = pol.PurchaseOrderID
		WHERE YEAR(po.OrderDate) = 2015
		GROUP BY ws.StockItemName
			) AS pq
	ON pq.StockItemName = sq.StockItemName
WHERE pq.purchaseQuantity > sq.saleQuantity;
	