USE RxR
GO

CREATE TABLE tblAccount(
	AccountID bigint NOT NULL,
	AccountName nvarchar(255) NULL,
	SegmentID bigint NOT NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY  
		(AccountID ASC)
) 
