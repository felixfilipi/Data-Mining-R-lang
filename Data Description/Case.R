#1 
npex <- read.csv('Data/Exchange Rate.csv', fileEncoding = 'UTF-8-BOM', 
                 stringsAsFactors = TRUE)

btc <- npex[npex$Cryptocurrency == "BTC",] #return only BTC value
eth <- npex[npex$Cryptocurrency == 'ETH',]
xrp <- npex[npex$Cryptocurrency == 'XRP',]

#2 (ascending)
btc <- btc[order(btc$Date, btc$Time), ]
eth <- eth[order(btc$Date, btc$Time),]
xrp <- xrp[order(btc$Date, btc$Time),]

#btc <- btc[order(btc$Date, btc$Time,decreasing = TRUE), ] #Descending

#3
eth.16Aug <- eth[eth$Date == "16-Aug-18",]
eth.16Aug.open <- eth.16Aug$Price[1] #open price
eth.16Aug.close <- eth.16Aug$Price[length(eth.16Aug$Price)] #close price
paste("Open: ", eth.16Aug.open) #Paste(print, paste value)
paste("Close: ", eth.16Aug.close)

#4
btc.15Aug <- btc[btc$Date == "15-Aug-18",]
btc.15Aug$Price
price <- as.numeric(gsub(".","", btc.15Aug$Price, fixed = TRUE)) #convert to int
format(max(price), big.mark = ".", decimal.mark = ",") #convert to str
format(min(price), big.mark = ".", decimal.mark = ",") #convert to str

#5
xrp.18Aug <- xrp[xrp$Date == "18-Aug-18",]
summary(xrp.18Aug)
price <- as.numeric(gsub(".","",xrp.18Aug$Price, fixed = TRUE))
