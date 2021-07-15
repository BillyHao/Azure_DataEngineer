SELECT 
	a.FullName,
	a.PhoneNumber AS Personal_PhoneNumber,
	a.FaxNumber AS Personal_FaxNumber,
	c.PhoneNumber AS Compony_PhoneNumber,
	c.FaxNumber AS Compony_FaxNumber
FROM 
	Application.People AS a
LEFT JOIN (SELECT p.PrimaryContactPersonID, p.AlternateContactPersonID, p.PhoneNumber, p.FaxNumber
			FROM Purchasing.Suppliers AS p
			UNION 
			SELECT s.PrimaryContactPersonID, s.AlternateContactPersonID, s.PhoneNumber,s.FaxNumber
			FROM Sales.Customers AS s) AS c
ON a.PersonID = c.PrimaryContactPersonID 
OR a.PersonID = c.AlternateContactPersonID;

