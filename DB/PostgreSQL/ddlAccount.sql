DROP TABLE IF EXISTS "RxR".tbl_account;

CREATE  TABLE "RxR".tbl_account (
	account_id SERIAL PRIMARY KEY
	, account_name VARCHAR(255) NOT NULL 
	, customer_segment_id bigint NOT NULL);