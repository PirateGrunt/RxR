USE RxR 
GO

CREATE TABLE tblPolicy(
	  AccountNumber bigint NOT NULL
	, PolicyNumber nvarchar(5) NOT NULL
	, PolicyEffectiveDate datetime
	, PolicyExpirationDate datetime
 CONSTRAINT [PK_tblPolicy] PRIMARY KEY CLUSTERED 
		(PolicyNumber ASC)
) 
GO