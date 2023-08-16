CREATE TRIGGER dbo.TR_Basket_insert_update  ON Basket AFTER INSERT
AS BEGIN
IF (SELECT COUNT(*) FROM inserted WHERE inserted.ID_SKU IN 
(SELECT ID_SKU FROM dbo.Basket GROUP BY ID_SKU HAVING COUNT(*) > 1)) > 1 
BEGIN  
UPDATE Basket
SET DiscountValue = Value * 0.05 
END
ELSE 
BEGIN
UPDATE Basket
SET DiscountValue = 0
END

END