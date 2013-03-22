IF EXISTS(SELECT *
			FROM sys.views
			WHERE name = 'qryEarnedPremium' AND
			schema_id = SCHEMA_ID('dbo'))
	DROP VIEW qryEarnedPremium
GO

CREATE VIEW qryEarnedPremium
AS
SELECT 
	  AccountNumber
	, Coverage
	, EarnedStart
	, EarnedEnd
	, SUM(WrittenPremium * dbo.udfEarnedFraction(EffectiveDate, ExpirationDate, EarnedStart, EarnedEnd)) AS EarnedPremium
FROM
	tblWrittenPremiumByCoverage 
	INNER JOIN tblEarnedPremiumDates ON
		EffectiveDate <= EarnedEnd 
		AND ExpirationDate >= EarnedStart 
GROUP BY
	  AccountNumber
	, Coverage
	, EarnedStart
	, EarnedEnd
GO