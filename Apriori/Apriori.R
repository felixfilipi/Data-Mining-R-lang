cuisine <- read.csv("data/chefmozcuisine.csv",stringsAsFactors = FALSE,
                    fileEncoding = "UTF-8-BOM") #not read as vector, encoding
place <- read.csv("data/geoplaces2.csv",stringsAsFactors = FALSE,
                    fileEncoding = "UTF-8-BOM") #not read as vector, encoding
rating <- read.csv("data/rating_final.csv",stringsAsFactors = FALSE,
                    fileEncoding = "UTF-8-BOM") #not read as vector, encoding

View(cuisine) #view data in form of df

data.cuisine <- merge(cuisine,place,by="placeID") 
#placeId namanya sama di table cuisine dan place, jadi bisa pakai by
#kalau ga sama pakai by.x dan by.y
View(data.cuisine)

data.rating <- merge(rating,place,by="placeID")
View(data.rating)

#example of different attribute
data.test <- merge(cuisine,place, by.x="placeID",by.y="userID") #example sajo
#by.x = kolom dataset 1 (di table 1 kolom apa yang digabung)
#by.y = kolom dataset 2 (di table 2 kolom apa yang digabung)

?pie() #return help about pie

#show cuisine distribution which more than 5 restaurant(cari Rcuisine yang lebih dari 5)
vis1 <- table(data.cuisine$Rcuisine) # ambil kolom Rcuisine di data.cuisine
vis1 <- vis1[vis1>5]
vis1.label <- paste(as.data.frame(vis1)$Var1, as.data.frame(vis1)$Freq, sepc=" ")
pie(vis1,main= "Cuisine Distribution",labels=vis1.label)

#vis2
vis2 <- table(data.cuisine$name)
hist(vis2, main = "Cuisines Count Frequency based on Restaurant", 
     xlab = "Cuisines count", col="lightblue", ylim=c(0,80))
#main=title,xlab=label,col=color
#breaks = pembagian per berapa data

#vis3 (show restaurant rate from average rating,food_rating,) dan diatas 1.2 dalam satuan state
data.rating$average.rating <- (data.rating$rating + data.rating$food_rating + 
                                 data.rating$service_rating) / 3 #dolar specify kolom

data.rating <- data.rating[data.rating$average.rating > 1.2, ]
View(data.rating)
#data tidak clean, ada yang s.l.p ada yang san louis potos dll
data.rating$state <- tolower(data.rating$state)
data.rating$state <- ifelse(data.rating$state == "s.l.p" | 
                              data.rating$state == "san luis potos"|
                              data.rating$state == "san luis potosi",
                            "slp",data.rating$state)

vis3 <- table(data.rating$state,data.rating$average.rating)
barplot(vis3)

vis3 <- t(vis3)
barplot(vis3, beside = TRUE, xlab = "State", main = "Average Rating", 
        col = c("Red","Blue","Pink"),ylim=c(0,200)) #from upper to beside
legend("top",rownames(vis3), fill = c("Red","Blue","Pink"), cex = 0.8)

#Data preprocessing

data.apriori <- data.cuisine[data.cuisine$franchise != "t",] #klo dataframe kasih , di akhir
data.apriori <- data.apriori[data.apriori$other_services == "none",]
data.apriori <- data.apriori[data.apriori$country != "?",]
data.apriori$Rcuisine <- gsub("_"," ", data.apriori$Rcuisine)
View(data.apriori)

# data transformation
trans <- split(data.apriori$Rcuisine, data.apriori$placeID)

#Data Mining (apriori) apriori ini untuk cari pattern dari suatu data
#bisa pakai apriori sama fpground apriori ini cara lama, versi barunya fpground
#jadi dia bakal ngecek 
#jadi dia kayak seberapa besar yakin dia bakal beli item b jika dia beli item a gitu

library(arules) #apriori ada di arules
freq <- apriori(trans, parameter = list(supp = 0.008, 
                                        target = "frequent itemsets"))
inspect(freq)

rules <- ruleInduction(freq, confidence = 8)#sort gitu lah sort
inspect(rules)
?ruleInduction
