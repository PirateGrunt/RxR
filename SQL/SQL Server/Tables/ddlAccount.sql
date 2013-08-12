CREATE TABLE tblAccount(
	AccountNumber bigint NOT NULL,
	AccountName nvarchar(255) NULL,
	SegmentID bigint NOT NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
		(AccountNumber ASC)
) 
