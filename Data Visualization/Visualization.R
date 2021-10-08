#R project <- save various file R

#Data Visualization
foodSales.types <- c('Fried Egg',
                'sushi',
                'Sashimi',
                'Bakso',
                'Sate',
                'KFC')

foodSales.freq <- c(20,30,60,10,50,70) 

foodSales.piePercent <- round(foodSales.freq/sum(foodSales.freq) * 100,1)

foodSales.labels <- paste(foodSales.types,as.character(foodSales.freq),
                          sep=" ")#paste = concat

#pie
pie(foodSales.freq, main="Food Sales",labels = foodSales.labels,
    col=rainbow(length(foodSales.freq)))

legend("topleft",foodSales.types, fill = rainbow(length(foodSales.freq))
       , cex =0.7) #cex = size

#set rainbow color as global var
globals.col <- rainbow(length(foodSales.freq))

#bar plot
barplot(foodSales.freq, xlab="Food type",ylab="Sales Freq",
        names.arg = foodSales.types, col = globals.col) #names.arg = label

#histogram
hist(foodSales.freq, xlab="Food interval", ylab="Sales Freq",
     col = "light blue",border="red")
#2 food bought between 0 to 20 times, etc

#line plot (p (point), l (line), o (mix))
plot(foodSales.freq, type = "o", main = "Sales graph", 
     xlab = "Food Type", ylab = "Sales Freq")

#boxplot (based on quartiles visualization)
boxplot(foodSales.freq, main="Food box plot", ylab="Number", col = "Pink")
