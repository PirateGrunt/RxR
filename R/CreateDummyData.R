libraries = c("lubridate", "RODBC", "RMySQL")

lapply(libraries, install.packages)
lapply(libraries, library)
# library(lubridate)
# library(RODBC)
# library(RMySQL)

set.seed(1234)

NumPolicies = 100
PolicyNumberLength = 5
FirstPolicyDate = ymd("2000-01-01")
PolicyPeriod = period(1, "years")

policyNumber = character(NumPolicies)

policyNumber = sapply(policyNumber, function(x){
  x = paste0(sample(LETTERS, 2, replace=TRUE), collapse="")
  x = 
})

head(policyNumber)

policyEffectiveDate = vector(mode = "numeric", length=NumPolicies)
policyEffectiveDate = rep(FirstPolicyDate, NumPolicies)
policyEffectiveDate = policyEffectiveDate + sample(0:364, NumPolicies, replace=TRUE) * days(1)

head(policyEffectiveDate)

policyExpirationDate = policyEffectiveDate + PolicyPeriod

AccountNumber = 1:100

dfPolicy = data.frame(AccountNumber = AccountNumber
                      , PolicyNumber = policyNumber
                      , PolicyEffectiveDate = policyEffectiveDate
                      , PolicyExpirationDate = policyExpirationDate)

channel = odbcConnect(dsn = "RxR")

sqlSave(channel, dfPolicy, "tblPolicy", rownames=FALSE, append=TRUE)