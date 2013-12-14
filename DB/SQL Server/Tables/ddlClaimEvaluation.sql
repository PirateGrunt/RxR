USE RxR 
GO

DROP TABLE tblClaimEvaluation
GO

CREATE TABLE tblClaimEvaluation(
	  ClaimID bigint NOT NULL
	, EvaluationDate datetime
	, PaidLoss float
	, OutstandingLoss float
	CONSTRAINT [PK_tblClaimEvaluation] PRIMARY KEY  
		(ClaimID, EvaluationDate)
	CONSTRAINT FK_ClaimID FOREIGN KEY (ClaimID)
		REFERENCES tblClaim (ClaimID)
) 