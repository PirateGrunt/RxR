USE RxR 
GO

CREATE VIEW qryClaimByAccount
AS 
SELECT
	tblAccount.AccountName
	, SUM(tblClaimEvaluation.PaidLoss) AS PaidLoss
	, COUNT(DISTINCT tblClaimEvaluation.ClaimID) AS ClaimCount
FROM 
	tblAccount
	INNER JOIN tblPolicy ON tblAccount.AccountID = tblPolicy.AccountID
	INNER JOIN tblClaim ON tblPolicy.PolicyID = tblClaim.PolicyID
	INNER JOIN tblClaimEvaluation ON tblClaim.ClaimID = tblClaimEvaluation.ClaimID
GROUP BY
	tblAccount.AccountName