SELECT 
	sc.CustomerName,so.OrderDate
FROM 
	Sales.Customers AS sc
	JOIN Sales.Orders AS so
	ON sc.CustomerID = so.CustomerID
WHERE OrderDate < '2016-01-01'
	AND so.CustomerID NOT IN(
		SELECT CustomerID
		FROM Sales.Orders
		WHERE OrderDate >'2016-01-01');
