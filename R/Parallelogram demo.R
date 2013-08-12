EarnPeriodStart = ymd("2001-1-1")
EarnPeriodEnd = ymd("2001-06-30")

PolicyTerm = period(1, "years") 

PolicyTermDays = PolicyTerm / days(1)

EarnMinusOne = EarnPeriodStart - PolicyTerm

Rate1 = dfRateChanges$RateDates[1]

EarnMinusOne.x = new_interval(EarnMinusOne, EarnMinusOne) / days(1)
Rate1.x = new_interval(EarnMinusOne, Rate1) / days(1)
EarnStart.x = new_interval(EarnMinusOne, EarnPeriodStart) / days(1)
EarnEnd.x = new_interval(EarnMinusOne, EarnPeriodEnd) / days(1)

totalArea.x = c(EarnMinusOne.x, EarnMinusOne.x, EarnEnd.x, EarnEnd.x, EarnMinusOne.x)
totalArea.y = c(0, PolicyTermDays, PolicyTermDays, 0, 0)
plot(cbind(totalArea.x, totalArea.y), type = "l")

lines(c(Rate1.x, Rate1.x+PolicyTermDays), c(0, PolicyTermDays))

EarnArea.x = c(EarnStart.x, EarnStart.x, EarnEnd.x, EarnEnd.x, EarnStart.x)
EarnArea.y = c(0, PolicyTermDays, PolicyTermDays, 0, 0)
polygon(EarnArea.x, EarnArea.y, col="blue")

trap1 = new_interval(Rate1, EarnPeriodStart) / days(1)
trap2 = new_interval(Rate1, EarnPeriodEnd) / days(1)
trap.x = c(EarnStart.x, EarnStart.x, EarnEnd.x, EarnEnd.x, EarnStart.x)
trap.y = c(0, trap1, trap2, 0, 0)
polygon(trap.x, trap.y, col="green")