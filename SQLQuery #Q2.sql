SELECT c.CustomerName 
FROM Sales.Customers AS c
WHERE c.PhoneNumber IN 
					(SELECT a.PhoneNumber
					FROM Application.People AS a 
					Join Sales.Customers AS s
					ON a.PersonID = s.PrimaryContactPersonID);
	