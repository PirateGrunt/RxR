RateDates = mdy(c("3-1-2010", "7/2/2010", "9/15/2010", "1/15/2011", "4-20-2011", "7-1-2011"))
RateChanges = c(.05, .1, .05, -.05, -.1, .12)

RateDates = mdy(c("7-1-2010", "1/1/2011", "4-1-2012"), quiet=TRUE)
RateChanges = c(.05, .1, -.01)

RateDates = mdy(c("1-1-2000", "1/1/2001"), quiet=TRUE)
RateChanges = c(.07, .11)

dfRateChanges = data.frame(RateDates = RateDates, RateChanges = RateChanges)
rm(RateDates)
rm(RateChanges)

dfRateChanges$RateLevels = 1 + dfRateChanges$RateChanges

dfRateChanges$CumulativeRateLevels = cumprod(dfRateChanges$RateLevels)

EarnPeriodStart = ymd("2001-1-1")
EarnPeriodEnd = ymd("2001-06-30")
PolicyTerm = period(1, "years")

#cy2011 = AverageRateLevel(ymd("2011-1-1"), ymd("2011-12-31"), period(1, "years"), dfRateChanges)

ay2001H1 = AverageRateLevel(ymd("2000-7-1"), ymd("2000-12-31"), PolicyTerm, dfRateChanges)

ay2001H1 = AverageRateLevel(EarnStart[2], EarnEnd[2], PolicyTerm, dfRateChanges)

someList = mapply(AverageRateLevel, EarnStart[1:2], EarnEnd[1:2]
                  , MoreArgs = list(PolicyTerm = PolicyTerm, dfRateChanges = dfRateChanges))

EarnPeriodStart = EarnStart[2]
EarnPeriodEnd = EarnEnd[2]

mojo = GetEarnArea(EarnStart[1], EarnEnd[1], PolicyTerm)













