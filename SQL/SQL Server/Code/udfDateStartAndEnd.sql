/* udfBeginningOfYear **********************************************************/
IF OBJECT_ID (N'udfBeginningOfYear') IS NOT NULL
    DROP FUNCTION udfBeginningOfYear
GO

CREATE FUNCTION udfBeginningOfYear  (@DateIn datetime)
RETURNS datetime
AS
BEGIN

DECLARE @DateOut datetime

SET @DateOut = DATEADD(yy, DATEDIFF(yy, 0, @DateIn), 0)
RETURN @DateOut

END
GO

/* udfEndOfYear **********************************************************/
IF OBJECT_ID (N'udfEndOfYear') IS NOT NULL
	DROP FUNCTION udfEndOfYear
GO

CREATE FUNCTION udfEndOfYear  (@DateIn datetime)
RETURNS datetime
AS
BEGIN

DECLARE @DateOut datetime

SET @DateOut = DATEADD(dd, -1, DATEADD(yy, 1, DATEADD(yy, DATEDIFF(yy, 0, @DateIn), 0)))
RETURN @DateOut

END
GO

/* udfBeginningOfSemi **********************************************************/
IF OBJECT_ID (N'udfBeginningOfSemi') IS NOT NULL
	DROP FUNCTION udfBeginningOfSemi
GO

CREATE FUNCTION udfBeginningOfSemi  (@DateIn datetime)
RETURNS datetime
AS
BEGIN

DECLARE @DateOut datetime
DECLARE @SemiNumber int

SELECT @SemiNumber = SemiNumber  FROM tblMonthMap WHERE MonthNumber = MONTH(@DateIn)
SET @DateOut = dbo.udfBeginningOfYear(@DateIn)
SET @DateOut = DATEADD(mm, 6 * (@SemiNumber  - 1), @DateOut)
RETURN @DateOut

END
GO

/* udfEndOfSemi **********************************************************/
IF OBJECT_ID (N'udfEndOfSemi') IS NOT NULL
	DROP FUNCTION udfEndOfSemi
GO

CREATE FUNCTION udfEndOfSemi (@DateIn datetime)
RETURNS datetime
AS
BEGIN

DECLARE @DateOut datetime
DECLARE @SemiNumber int

SELECT @SemiNumber = SemiNumber  FROM tblMonthMap WHERE MonthNumber = MONTH(@DateIn)
SET @DateOut = dbo.udfBeginningOfYear(@DateIn)
SET @DateOut = DATEADD(mm, 6 * @SemiNumber, @DateOut)
SET @DateOut = DATEADD(dd, -1, @DateOut)
RETURN @DateOut

END
GO

/* udfBeginningOfQuarter **********************************************************/
IF OBJECT_ID (N'udfBeginningOfQuarter') IS NOT NULL
	DROP FUNCTION udfBeginningOfQuarter
GO

CREATE FUNCTION udfBeginningOfQuarter  (@DateIn datetime)
RETURNS datetime
AS
BEGIN

DECLARE @DateOut datetime
DECLARE @QuarterNumber int

SELECT @QuarterNumber = QuarterNumber  FROM tblMonthMap WHERE MonthNumber = MONTH(@DateIn)
SET @DateOut = dbo.udfBeginningOfYear(@DateIn)
SET @DateOut = DATEADD(mm, 3 * (@QuarterNumber  - 1), @DateOut)
RETURN @DateOut

END
GO

/* udfEndOfQuarter **********************************************************/
IF OBJECT_ID (N'udfEndOfQuarter') IS NOT NULL
	DROP FUNCTION udfEndOfQuarter
GO

CREATE FUNCTION udfEndOfQuarter  (@DateIn datetime)
RETURNS datetime
AS
BEGIN

DECLARE @DateOut datetime
DECLARE @QuarterNumber int

SELECT @QuarterNumber = QuarterNumber  FROM tblMonthMap WHERE MonthNumber = MONTH(@DateIn)
SET @DateOut = dbo.udfBeginningOfYear(@DateIn)
SET @DateOut = DATEADD(mm, 3 * @QuarterNumber, @DateOut)
SET @DateOut = DATEADD(dd, -1, @DateOut)
RETURN @DateOut

END
GO