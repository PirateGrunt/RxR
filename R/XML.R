library(XML)

filepath = "C:/Users/bfannin/Documents/GitHub/RxR/Office/"
filename = "Accounts.csv"

dfAccounts = read.csv(paste0(filepath, filename))

filepath = "C:/Users/bfannin/Documents/GitHub/RxR/XML/"
filename = "Test.xml"

newDoc = newXMLDoc()
rootNode = newXMLNode("RxR", doc = newDoc)
nodeAccounts = newXMLNode("Accounts", attrs = c(name = "Accounts"), parent = rootNode)

mojo = as.matrix(dfAccounts)

for (i in 1:nrow(dfAccounts))
{
  nodeAccount = newXMLNode(as.character(dfAccounts$AccountID[i])
                           , attrs = c(name = dfAccounts$AccountName[i], state = dfAccounts$State[i])
                           , parent = nodeAccounts) 
}

apply(dfAccounts, 1, function(x){
  nodeAccount = newXMLNode(x$AccountID
                           , attrs = c(name = x$AccountName, state = x$State)
                           , parent = nodeAccounts) 
})

saveXML(newDoc, paste0(filepath, filename))
