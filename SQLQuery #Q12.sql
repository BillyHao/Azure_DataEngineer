---12.	List all the Order Detail 
---(Stock Item name, delivery address, delivery state, city, country, customer name, customer contact person name, customer phone, quantity) 
---for the date of 2014-07-01. Info should be relevant to that date.

SELECT si.StockItemName, cus.DeliveryAddressLine1, cus.DeliveryAddressLine2, ac.CountryName, c.CityName, sp.StateProvinceName,
	   cus.CustomerName, cus.PrimaryContactPersonID, cus.PhoneNumber,sol.Quantity

FROM Application.Cities AS c
	JOIN Application.StateProvinces AS sp ON c.StateProvinceID = sp.StateProvinceID
	JOIN Application.Countries AS ac ON ac.CountryID = sp.CountryID
	JOIN Sales.Customers AS cus ON cus.PostalCityID = c.CityID
	JOIN Sales.Orders AS so ON so.CustomerID = cus.CustomerID
	JOIN Sales.OrderLines AS sol On sol.OrderID = so.OrderID
	JOIN Warehouse.StockItems AS si ON si.StockItemID = sol.StockItemID

WHERE so.OrderDate='2014-07-01'