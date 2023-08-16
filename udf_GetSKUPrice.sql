USE ICS_IT
GO
CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU INT) RETURNS decimal(18, 2)
BEGIN
DECLARE @sumValue DEC (18,2), @sumQuantity DEC(18,2), @result DEC(18, 2)
        SELECT @sumValue = SUM (Value) FROM Basket WHERE Basket.ID_SKU = @ID_SKU
		SELECT @sumQuantity = SUM (Quantity) FROM Basket WHERE Basket.ID_SKU = @ID_SKU
        SET @result = @sumValue /@sumQuantity
        RETURN @result
END;