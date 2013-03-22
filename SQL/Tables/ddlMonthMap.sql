CREATE TABLE tblMonthMap(
	MonthNumber int NOT NULL,
	MonthName nvarchar(255) NULL,
	QuarterNumber int NULL,
	SemiNumber int NULL,
	QuarterEndMonth int NULL,
	QuarterEndDay int NULL,
	SemiEndMonth int NULL,
	SemiEndDay int NULL,
	QuarterStartMonth int NULL,
	QuarterStartDay int NULL,
	SemiStartMonth int NULL,
	SemiStartDay int NULL
) ON [PRIMARY]
GO

INSERT INTO [dbo].[tblMonthMap]
           ([MonthNumber]
           ,[MonthName]
           ,[QuarterNumber]
           ,[SemiNumber]
           ,[QuarterEndMonth]
           ,[QuarterEndDay]
           ,[SemiEndMonth]
           ,[SemiEndDay]
           ,[QuarterStartMonth]
           ,[QuarterStartDay]
           ,[SemiStartMonth]
           ,[SemiStartDay])
     VALUES
          (1, 'January',	 1, 1,  3, 31,  6, 30,  1, 1, 1, 1)
		, (2, 'February',	 1, 1,  3, 31,  6, 30,  1, 1, 1, 1)
		, (3, 'March',		 1, 1,  3, 31,  6, 30,  1, 1, 1, 1)
		, (4, 'April',		 2, 1,  6, 30,  6, 30,  4, 1, 1, 1)
		, (5, 'May',		 2, 1,  6, 30,  6, 30,  4, 1, 1, 1)
		, (6, 'June',		 2, 1,  6, 30,  6, 30,  4, 1, 1, 1)
		, (7, 'July',		 3, 2,  7, 31, 12, 31,  7, 1, 7, 1)
		, (8, 'August',		 3, 2,  7, 31, 12, 31,  7, 1, 7, 1)
		, (9, 'September',	 3, 2,  7, 31, 12, 31,  7, 1, 7, 1)
		, (10, 'October',	 4, 2, 12, 31, 12, 31, 10, 1, 7, 1)
		, (11, 'November',	 4, 2, 12, 31, 12, 31, 10, 1, 7, 1)
		, (12, 'December',	 4, 2, 12, 31, 12, 31, 10, 1, 7, 1)
GO



