DROP TABLE IF EXISTS "RxR".tbl_claim;

CREATE  TABLE "RxR".tbl_claim (
	 claim_id SERIAL PRIMARY KEY
	, policy_id bigint NOT NULL
	, occurrence_date timestamp
	, description varchar
	, 
	, FOREIGN KEY (policy_id) REFERENCES "RxR".tbl_policy (policy_id) MATCH FULL);