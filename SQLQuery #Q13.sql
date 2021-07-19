
USE WideWorldImporters

SELECT a.StockGroupName, total_purchase, total_sale, (total_purchase-total_sale) AS Remaining
FROM 
	(SELECT StockGroupName,sg.StockGroupID,SUM(ws.QuantityPerOuter * po.OrderedOuters) AS total_purchase
	 FROM Warehouse.StockItems AS ws
		JOIN Purchasing.PurchaseOrderLines AS po ON ws.StockItemID = po.StockItemID
		JOIN Warehouse.StockItemStockGroups AS sisg ON ws.StockItemID = sisg.StockItemID
		JOIN Warehouse.StockGroups AS sg ON sisg.StockGroupID = sg.StockGroupID
	 GROUP BY StockGroupName,sg.StockGroupID) AS a

	JOIN
		(SELECT StockGroupName,sgg.StockGroupID,SUM(Quantity) AS total_sale
		 FROM Warehouse.StockItems AS ws
			JOIN Sales.OrderLines AS ol ON ws.StockItemID = ol.StockItemID
			JOIN Warehouse.StockItemStockGroups AS sisg ON ws.StockItemID = sisg.StockItemID
			JOIN Warehouse.StockGroups AS sgg ON sisg.StockGroupID = sgg.StockGroupID
		 GROUP BY StockGroupName,sgg.StockGroupID) AS b

	ON a.StockGroupID = b.StockGroupID;