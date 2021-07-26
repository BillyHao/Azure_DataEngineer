--19.Create a view that shows the total quantity of stock items of each stock group sold (in orders) by year 2013-2017. 
--[Year, Stock Group Name1, Stock Group Name2, Stock Group Name3, … , Stock Group Name10] 


CREATE VIEW	view1 AS 

SELECT 
	sub.StockGroupName,
	sub.totalQ,
	sub.dateYear
	
FROM (
		SELECT 	SUM(Quantity)AS totalQ, sp.StockGroupName, YEAR(OrderDate) AS dateYear
		FROM Warehouse.StockItemStockGroups AS isp
		JOIN Warehouse.StockGroups AS sp	
			ON isp.StockGroupID = sp.StockGroupID
		JOIN Warehouse.StockItems AS si
			ON si.StockItemID = isp.StockItemID
		JOIN sales.OrderLines AS ol
			ON si.StockItemID = ol.StockItemID
		JOIN sales.Orders AS o
			ON ol.OrderID = o.OrderID
		WHERE YEAR(o.OrderDate) Between 2013 AND 2017
		GROUP BY sp.StockGroupName, YEAR(OrderDate)
		) AS sub
;
