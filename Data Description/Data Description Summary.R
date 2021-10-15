#Fillna with 0
a <- c(5,9,NA,6,NA,7,6,NA)
a[is.na(num)] <- 0 

#Fillna with defined value
b <- c(5,9,NA,6,NA,7,6,NA)
b[is.na(b)] <- c(-1, 0, -5)

#show non na value
num <- c(5,9,NA,6,NA,7,6,NA)
num <- num[!is.na(num)]

#Dataframe
value <- c(5,9,NA,6,NA,7,6,NA)
name <- c("charlie","kezia",'Budi',NA,"kezia",NA,'charlie',NA)
df <- data.frame(as.factor(name),value) 
#factor return distinct value map in summary
#without factor it return vector value, and return len, class, and mode

df[!is.na(df$name),] #remove na in column 'name' only
na.omit(df) -> df #dropna in dataframe

#return duplicated value
name[duplicated(name)]

#return non duplicated value (distinct value)
name[!duplicated(name)]

na.omit(num) -> clean_data
clean_data > 8 #return value > 8 in BOOLEAN
clean_data[clean_data >= 7] #return value >= 7
clean_data[clean_data < 7] #return value < 7
clean_data[clean_data == 6] #return value = 6

#Aggregate(SUM, LENGTH, MEAN, MEDIAN, Standard Deviation)
sum(clean_data) 
length(clean_data)
mean(clean_data)
median(clean_data) #auto sort already
max(clean_data)
min(clean_data)
sd(clean_data)

summary(df)
