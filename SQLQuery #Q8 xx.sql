USE WideWorldImporters
---8.List of States and Avg dates for processing (confirmed delivery date – order date) by month.
SELECT 
	asp.StateProvinceName, 
	AVG(datediff (MONTH,so.OrderDate,si.ConfirmedDeliveryTime)) AS DayDiffer
FROM 
	Application.StateProvinces AS asp
	JOIN Application.Cities AS ac ON asp.StateProvinceCode = ac.StateProvinceID
	JOIN Sales.Customers AS sc ON ac.CityID = sc.DeliveryCityID
	JOIN Sales.Orders AS so ON sc.CustomerID = so.CustomerID
	JOIN Sales.Invoices AS si ON sc.CustomerID = si.CustomerID
GROUP BY 
	StateProvinceName;
