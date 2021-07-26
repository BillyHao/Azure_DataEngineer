---18.Create a view that shows the total quantity of stock items of each stock group sold (in orders) by year 2013-2017. 
--- [Stock Group Name, 2013, 2014, 2015, 2016, 2017]

CREATE VIEW totalQ AS 
SELECT sg.StockGroupName, SUM(sol.Quantity) AS totol_Quantity
FROM Warehouse.StockGroups AS sg
	JOIN Warehouse.StockItemStockGroups AS ssg ON sg.StockGroupID = ssg.StockGroupID
	JOIN Warehouse.StockItems AS si ON si.StockItemID = ssg.StockItemID 
	JOIN Sales.OrderLines AS sol ON sol.StockItemID = si.StockItemID
	JOIN Sales.Orders AS so ON so.OrderID = sol.OrderID
WHERE YEAR(OrderDate) BETWEEN 2013 AND 2017
GROUP BY sg.StockGroupName;
