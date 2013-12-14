DROP TABLE IF EXISTS "RxR".tbl_policy;

CREATE  TABLE "RxR".tbl_policy (
	account_id bigint NOT NULL
	, policy_id SERIAL PRIMARY KEY
	, policy_number varchar(5) NOT NULL
	, policy_effective_date timestamp
	, policy_expiration_date  timestamp
	, FOREIGN KEY (account_id) REFERENCES "RxR".tbl_account (account_id) MATCH FULL);