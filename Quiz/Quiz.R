food <- read.csv("favorite_food_data.csv",stringsAsFactors = FALSE, 
                 fileEncoding = "UTF-8-BOM")
student <- read.csv("student_data.csv",stringsAsFactors = FALSE, 
                 fileEncoding = "UTF-8-BOM")

#A.
fav_food <- table(food$Favorite.Food)
percentage <- floor(fav_food/sum(fav_food)*100)

fav_food.label <- paste(percentage, as.data.frame(fav_food)$Var1, sep = " % ")
pie(fav_food, main="Food Type Appeal",labels = fav_food.label,
    col = rainbow(length(fav_food)))

#B.
#View(student)
grade <- paste(student$Education.Grade,student$Education.Year, sep=" ")
student.grade <- table(grade)

barplot(student.grade, main= "Number of Student By Grade", xlab = "Student Grade", 
     ylab = "Student Count", col = rainbow(length(student.grade)), ylim=c(0,100))

#C
student_grade <- student[student$Education.Grade =="SD" & student$Age <= 12,]
student_avg <- mean(student_grade$Height)
student_height <- aggregate(student_grade$Height,list(student_grade$Education.Year), mean)
plot(student_height, type = "o", col = "red", xlab = "Education Year", ylab = "Grades",
     main = "Primary School Average Height")


# A. data preprocessing
preprocessed_student <- student[!is.na(student$Student),]
preprocessed_student <- preprocessed_student[!preprocessed_student$Education.Grade == "SD",]
preprocessed_student <- preprocessed_student[!duplicated(preprocessed_student),]

dataset <- merge(food,preprocessed_student, by.x = "Student.Name", by.y = "Student")

# B. data transformation
transformed <- split(dataset$Favorite.Food, dataset$Student.Name)

# data mining
library(arules)
aprior <- apriori(transformed, parameter=list(supp=0.25, target="frequent itemsets"))
inspect(aprior)

rules <- ruleInduction(aprior, confidence = 0.6)
inspect(aprior)
