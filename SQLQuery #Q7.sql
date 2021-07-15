---Sales.Customers(CustomerID,DeliveryCityID)
---Sales.Orders(OrderID, ExpectedDeliveryDate, OrderDate)
---Application.Cities(CityIDStateProvinceID)
---Application.StateProvinces(StateProvinceID, StateProvinceName)
---Sales.Invoices(ConfirmedDeliveryTime)

SELECT 
	StateProvinceName, 
	AVG(datediff (DAY,OrderDate, ConfirmedDeliveryTime)) AS DayDiffer
FROM 
	Application.StateProvinces AS asp
	JOIN Application.Cities AS ac ON asp.StateProvinceCode = ac.StateProvinceID
	JOIN Sales.Customers AS sc ON ac.CityID = sc.DeliveryCityID
	JOIN Sales.Orders AS so ON sc.CustomerID = so.CustomerID
	JOIN Sales.Invoices AS si ON sc.CustomerID = si.CustomerID
GROUP BY 
	StateProvinceName;
