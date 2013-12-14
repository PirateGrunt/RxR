USE RxR
GO

CREATE TABLE tblSegment(
	SegmentID bigint NOT NULL,
	SegmentName nvarchar(255) NULL,
	SegmentDescription nvarchar(255) NOT NULL,
 CONSTRAINT [PK_tblSegment] PRIMARY KEY  
		(SegmentID ASC)
) 
