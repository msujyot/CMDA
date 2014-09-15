
#first check the version of R and install updates
#http://www.r-statistics.com/2013/03/updating-r-from-r-on-windows-using-the-installr-package/
R.Version()

if(!require(installr)){
  install.packages("installr"); require(installr)}

updateR()

# Install 0.9.2 of ROAuth
install.packages("C:\\Users\\Denisa\\Downloads\\ROAuth_0.9.3.tar.gz", 
                 repos = NULL, type = "source")

#Call the required packages
library(ROAuth)
library(RJSONIO)


library(RCurl) 
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))


#Set your application keys

cKey <- 'bsDaDtyyy64Ez..(personal)'
cSecret <- 'KU..personal'
oKey <- 'Xkb..personal'
oSecret <- 'ro2ZZ5..personal'

#Set the API endpoint
tkURL <- "https://api.tradeking.com/v1/market/ext/quotes.json"
tkURL <- "https://api.tradeking.com/v1/market/ext/quotes.json"

#Create the OAuth connection - this is straight from the ROAuth documentation on CRAN
credentials <- OAuthFactory$new(consumerKey = cKey,
                                consumerSecret = cSecret,
                                oauthKey = oKey,
                                oauthSecret = oSecret,
                                needsVerifier = FALSE,
                                signMethod = 'HMAC')

#Update the connection so the handshake is TRUE
credentials$handshakeComplete <- TRUE

#Get some stock price data
#Create the parameters to be passed with the GET request
query <- list()
query[[ "symbols"]] <- "nflx, aapl"
query[[ "fids"]] <- "last,bid,ask"

#Make the GET request, passing along the parameters, storing the response,
#then parsing the response
response <- credentials$OAuthRequest(tkURL, query) 
rp <- fromJSON(response)



#Reshape data
rp
names(rp) #keys of outer list
list1 <- unlist(rp) #values of outer list
list1
list1[2] #values of inner list
m1 <- matrix(list1[2:11], ncol = 5, nrow = 2, byrow = TRUE) #create a matrix
m1
d1 <- data.frame(m1) #create a data frame
names(d1) <- c("ASK","BID", "EXCH","LAST", "Symbol") #rename var in data frame
d1
d1$spread <- as.numeric(levels(d1$BID)) - as.numeric(levels(d1$ASK)) #need to use values as numeric;
#they come as factors


