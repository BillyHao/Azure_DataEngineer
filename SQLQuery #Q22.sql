CREATE TABLE StockItem (
StockItemID int PRIMARY KEY,
StockItemName nvarchar(100),
SupplierID int,
colorID int, 
UnitPackageID int, 
OuterPackageID int,
Brand nvarchar(50),
Size nvarchar(20),
LeadTimeDays int,
QuantityPerOuter int,
IsChillerStock bit,
Barcode nvarchar(50),
TaxRate decimal(18,3),
UnitPrice decimal(18,2),
RecommendedRetailPrice decimal(18,2),
TypicalWeightPerUnit decimal(18,3),
MarketingComments nvarchar(max),
InternalComments nvarchar(max),
CountryOfManufacture varchar,
[Range] int,
Shelflife varchar
);

INSERT INTO dbo.StockItem
SELECT [StockItemID], [StockItemName] ,[SupplierID] ,[ColorID] ,[UnitPackageID] ,[OuterPackageID] ,[Brand] ,[Size] ,[LeadTimeDays] ,[QuantityPerOuter] ,[IsChillerStock] ,[Barcode] ,[TaxRate]  ,[UnitPrice],[RecommendedRetailPrice] ,[TypicalWeightPerUnit] ,[MarketingComments]  ,[InternalComments]
FROM Warehouse.StockItems;