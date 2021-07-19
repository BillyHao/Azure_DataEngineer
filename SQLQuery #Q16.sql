---16.List all stock items that are manufactured in China. (Country of Manufacture)
USE WideWorldImporters
SELECT  ws.StockItemName, CustomFields
FROM Warehouse.StockItems AS ws
WHERE CustomFields LIKE '%China%';