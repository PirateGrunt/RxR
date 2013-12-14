IF OBJECT_ID (N'tblEarnedPremiumDates') IS NOT NULL
	DROP TABLE tblEarnedPremiumDates
GO

SELECT 
	  dbo.udfBeginningOfSemi(EffectiveDate) AS EarnedStart
	, dbo.udfEndOfSemi(EffectiveDate) AS EarnedEnd
INTO tblEarnedPremiumDates
FROM
	tblWrittenPremiumByCoverage 
GROUP BY	
	  dbo.udfBeginningOfSemi(EffectiveDate) 
	, dbo.udfEndOfSemi(EffectiveDate) 
GO
