IF OBJECT_ID (N'udfEarnedFraction') IS NOT NULL
    DROP FUNCTION udfEarnedFraction
GO

CREATE FUNCTION udfEarnedFraction (@EffectiveDate datetime
								, @ExpirationDate datetime
								, @PeriodStart datetime
								, @PeriodEnd datetime)
RETURNS float
AS
BEGIN

DECLARE @EarnedFraction float
DECLARE @PolicyTerm float
DECLARE @Remainder float

SET @PolicyTerm = DATEDIFF(dd, @EffectiveDate, @ExpirationDate) + 1

-- TODO Check to ensure that there is no zero condition
IF @EffectiveDate < @PeriodStart 
	BEGIN
	IF @ExpirationDate > @PeriodEnd 
		SET @EarnedFraction = (DATEDIFF(dd, @PeriodStart, @PeriodEnd) + 1) / @PolicyTerm
	ELSE
		BEGIN
		SET @Remainder = DATEDIFF(dd, @PeriodStart, @ExpirationDate) + 1
		SET @EarnedFraction = @Remainder / @PolicyTerm 
		END
	END
ELSE
	BEGIN
	IF @ExpirationDate > @PeriodEnd 
		BEGIN
		SET @Remainder = DATEDIFF(dd, @EffectiveDate, @PeriodEnd ) + 1
		SET @EarnedFraction = @Remainder / @PolicyTerm 
		END
	ELSE
		SET @EarnedFraction = 1.0
	END

RETURN @EarnedFraction
END