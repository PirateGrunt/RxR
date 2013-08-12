library(RODBC)
library(lubridate)

GenerateMonthOLF = function(dfMonth)
{
  dfMonth = dfMonth[order(dfMonth$EffectiveDate),]
  dfMonth$CumulativeRateLevels = cumprod(dfMonth$RateLevel)
  PolicyTerm = period(1, "years")
  
  someList = mapply(AverageRateLevel, EarnStart, EarnEnd
                    , MoreArgs = list(PolicyTerm = PolicyTerm, dfRateChanges = dfMonth))
  
  someList = as.vector(someList)
  
  dfMonthlyOLF = data.frame(EarnStart = EarnStart
                            , EarnEnd = EarnEnd
                            , AvgRate = someList
                            , Coverage = dfMonth$Coverage[1]
                            , MonthlyWeight = dfMonth$MonthlyWeight[1]
                            , Month = month(dfMonth$EffectiveDate[1]))
  
  return (dfMonthlyOLF)
}

GenerateOLF = function(df)
{
  require(lubridate)
  Coverage = df$Coverage[1]
  MonthList = split(df, month(df$RateDate))
  MonthList = lapply(MonthList, GenerateMonthOLF)
  dfByMonth = do.call("rbind", MonthList)
  
  dfByMonth$WeightedRate = with(dfByMonth, AvgRate * MonthlyWeight)
  
  df = aggregate(dfByMonth[,"WeightedRate"], by=list(dfByMonth$EarnStart, dfByMonth$EarnEnd), sum)
  colnames(df) = c("EarnStart", "EarnEnd", "AvgRate")
  
  df = df[order(df$EarnStart),]
  
  df$OLF = df$AvgRate[nrow(df)] / df$AvgRate 
  
  df$Coverage = Coverage
  
  return(df)
}

EarnStart = rep(ymd("2000-01-01"), 26)

EarnStart = EarnStart + months(6) * 0:25
EarnEnd = EarnStart + months(6) - days(1)

channel = odbcConnect(dsn = "BAFSQL")

dfRateChanges = sqlQuery(channel, "SELECT * FROM qryRateChange")

dfRateChanges$RateLevel = 1 + dfRateChanges$RateChange

dfRateChanges$RateDate = dfRateChanges$EffectiveDate

aList = split(dfRateChanges, dfRateChanges$Coverage)
aList = lapply(aList, GenerateOLF)
dfOLF = do.call("rbind", aList)
row.names(dfOLF)= NULL

names(dfOLF) = c("EarnStart", "EarnEnd", "AverageRate", "OnLevelFactor", "Coverage")
sqlSave(channel, dfOLF, "dbo.tblOLF", rownames=FALSE, append=TRUE)
