--20.Create a function, input: order id; return: total of that order.
--List invoices and use that function to attach the order total to the other fields of invoices. 


CREATE FUNCTION totalOrder(
 @OrderId int
) RETURNS int AS BEGIN RETURN(
SELECT 
	SUM(Quantity) AS totalQ 
FROM
	sales.OrderLines AS ol
JOIN Sales.Orders AS o
	ON ol.OrderID = o.OrderID
WHERE o.OrderID = @OrderID
) END;
----------------------------------------------------------
SELECT * 
FROM sales.Invoices
CROSS APPLY totalOrder(OrderID) F;
