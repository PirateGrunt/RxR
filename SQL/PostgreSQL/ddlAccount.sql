CREATE SCHEMA "RxR";

CREATE  TABLE "RxR"."tblAccount" (
  "AccountNumber" BIGINT NOT NULL ,
  "AccountName" VARCHAR(255) NULL ,
  PRIMARY KEY ("AccountNumber") );