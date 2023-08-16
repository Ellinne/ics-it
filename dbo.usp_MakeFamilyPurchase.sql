
CREATE PROCEDURE dbo.usp_MakeFamilyPurchase (@FamilySurName varchar(255)) 
AS BEGIN TRY
UPDATE Family 
SET BudgetValue = Family.BudgetValue - ( SELECT SUM(Value) FROM dbo.Basket WHERE Family.SurName = @FamilySurName )
WHERE Family.SurName = @FamilySurName;
END TRY

BEGIN CATCH
Print 'Данной семьи нет'
END CATCH;