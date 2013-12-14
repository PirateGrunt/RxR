USE RxR 
GO

DROP TABLE tblPolicy 
GO

CREATE TABLE tblPolicy(
	  AccountID bigint NOT NULL
	, PolicyID bigint
	, PolicyNumber nvarchar(5) NOT NULL
	, PolicyEffectiveDate datetime
	, PolicyExpirationDate datetime
	, CONSTRAINT [PK_tblPolicy] PRIMARY KEY CLUSTERED 
		(PolicyID ASC)
	, CONSTRAINT [FK_tblAccount] FOREIGN KEY (AccountID)
		REFERENCES tblAccount (AccountID)) 
GO