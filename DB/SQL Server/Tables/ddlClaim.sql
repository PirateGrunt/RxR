USE [RxR]
GO

DROP TABLE tblClaim 
GO

CREATE TABLE [dbo].[tblClaim](
	[ClaimID] [bigint] NOT NULL,
	[PolicyID] [bigint] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[OccurrenceDate] [datetime] NULL,
	[ReportDate] [datetime] NULL,
	[CloseDate] [datetime] NULL,
	[CoverageID] [bigint] NULL
	, CONSTRAINT [PK_tblClaim] PRIMARY KEY CLUSTERED ([ClaimID] ASC)
	, CONSTRAINT [FK_PolicyID] FOREIGN KEY(PolicyID) 
		REFERENCES tblPolicy (PolicyID)
) 
GO