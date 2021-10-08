#set working dir
setwd("C:\\Users\\FELIX\\Downloads\\Data Mining\\Project\\Data Visualization")

#read csv
participant <- read.csv("Data/Participant.csv", fileEncoding = "UTF-8-BOM")
result <- read.csv("Data/Result.csv", fileEncoding = "UTF-8-BOM")
question <- read.csv("Data/Question.csv", fileEncoding = "UTF-8-BOM")

#Data Filtering
result <- result[!is.na(result$Question.1),] #drop na

#Data Grouping - Set freq from result (get distinct and value)
q2.result <- table(result$Question.2)
q2.percentage <- round(q2.result/sum(q2.result)*100,1)

#Pie visualization
q2.title <- question$Question[2] # $=iloc of collumn
q2.title <- paste("Result percentage of Question 2: ",q2.title, sep = "\n")
q2.title

pie(q2.result, labels = q2.percentage, col=rainbow(length(q2.result)),
    main=q2.title)

legend("topright",c("Strongly Disagree","Disagree","Neutral",
                    "Agree","Strongly Agree"), 
       fill = rainbow(length(q2.result)),cex = 0.6)
