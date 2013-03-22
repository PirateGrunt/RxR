CREATE TABLE [dbo].[tblWrittenPremiumByCoverage](
	[AccountNumber] [int] NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[EffectiveYear] [int] NOT NULL,
	[Coverage] [varchar](25) NOT NULL,
	[WrittenPremium] [real] NULL
) ON [PRIMARY]

GO