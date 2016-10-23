credit_data <- read.csv("../../data/Credit.csv")

#Quantitative variables 

##Income 
income_min <- min(credit_data$Income)
income_max <- max(credit_data$Income)
income_range <- income_max - income_min

income_median <- median(credit_data$Income)
income_first_quartile <- quantile(credit_data$Income)[2]
income_third_quartile <- quantile(credit_data$Income)[4]
income_interquartile_range <- IQR(credit_data$Income)

income_mean <- mean(credit_data$Income)
income_std_dev <- sd(credit_data$Income)

png("../../images/income_histogram.png")
hist(credit_data$Income, main="Histogram of Income", xlab="Income")
dev.off() 

png("../../images/income_boxplot.png")
boxplot(credit_data$Income, main="Boxplot of Income", xlab="Income")
dev.off() 

##Limit
limit_min <- min(credit_data$Limit)
limit_max <- max(credit_data$Limit)
limit_range <- limit_max - limit_min

limit_median <- median(credit_data$Limit)
limit_first_quartile <- quantile(credit_data$Limit)[2]
limit_third_quartile <- quantile(credit_data$Limit)[4]
limit_interquartile_range <- IQR(credit_data$Limit)

limit_mean <- mean(credit_data$Limit)
limit_std_dev <- sd(credit_data$Limit)

png("../../images/limit_histogram.png")
hist(credit_data$Limit, main="Histogram of Limit", xlab="Limit")
dev.off() 

png("../../images/limit_boxplot.png")
boxplot(credit_data$Limit, main="Boxplot of Limit", xlab="Limit")
dev.off() 

##Rating
rating_min <- min(credit_data$Rating)
rating_max <- max(credit_data$Rating)
rating_range <- rating_max - rating_min

rating_median <- median(credit_data$Rating)
rating_first_quartile <- quantile(credit_data$Rating)[2]
rating_third_quartile <- quantile(credit_data$Rating)[4]
rating_interquartile_range <- IQR(credit_data$Rating)

rating_mean <- mean(credit_data$Rating)
rating_std_dev <- sd(credit_data$Rating)

png("../../images/rating_histogram.png")
hist(credit_data$Rating, main="Histogram of Rating", xlab="Rating")
dev.off() 

png("../../images/rating_boxplot.png")
boxplot(credit_data$Rating, main="Boxplot of Rating", xlab="Rating")
dev.off() 

##Cards 
cards_min <- min(credit_data$Cards)
cards_max <- max(credit_data$Cards)
cards_range <- cards_max - cards_min

cards_median <- median(credit_data$Cards)
cards_first_quartile <- quantile(credit_data$Cards)[2]
cards_third_quartile <- quantile(credit_data$Cards)[4]
cards_interquartile_range <- IQR(credit_data$Cards)

cards_mean <- mean(credit_data$Cards)
cards_std_dev <- sd(credit_data$Cards)

png("../../images/cards_histogram.png")
hist(credit_data$Cards, main="Histogram of Cards", xlab="Cards")
dev.off() 

png("../../images/cards_boxplot.png")
boxplot(credit_data$Cards, main="Boxplot of Cards", xlab="Cards")
dev.off() 

##Age
age_min <- min(credit_data$Age)
age_max <- max(credit_data$Age)
age_range <- age_max - age_min

age_median <- median(credit_data$Age)
age_first_quartile <- quantile(credit_data$Age)[2]
age_third_quartile <- quantile(credit_data$Age)[4]
age_interquartile_range <- IQR(credit_data$Age)

age_mean <- mean(credit_data$Age)
age_std_dev <- sd(credit_data$Age)

png("../../images/age_histogram.png")
hist(credit_data$Age, main="Histogram of Age", xlab="Age")
dev.off() 

png("../../images/age_boxplot.png")
boxplot(credit_data$Age, main="Boxplot of Age", xlab="Age")
dev.off() 

##Education
education_min <- min(credit_data$Education)
education_max <- max(credit_data$Education)
education_range <- education_max - education_min

education_median <- median(credit_data$Education)
education_first_quartile <- quantile(credit_data$Education)[2]
education_third_quartile <- quantile(credit_data$Education)[4]
education_interquartile_range <- IQR(credit_data$Education)

education_mean <- mean(credit_data$Education)
education_std_dev <- sd(credit_data$Education)

png("../../images/education_histogram.png")
hist(credit_data$Education, main="Histogram of Education", xlab="Education")
dev.off() 

png("../../education/income_boxplot.png")
boxplot(credit_data$Education, main="Boxplot of Education", xlab="Education")
dev.off() 

##Balance
balance_min <- min(credit_data$Balance)
balance_max <- max(credit_data$Balance)
balance_range <- balance_max - balance_min

balance_median <- median(credit_data$Balance)
balance_first_quartile <- quantile(credit_data$Balance)[2]
balance_third_quartile <- quantile(credit_data$Balance)[4]
balance_interquartile_range <- IQR(credit_data$Balance)

balance_mean <- mean(credit_data$Balance)
balance_std_dev <- sd(credit_data$Balance)

png("../../images/balance_histogram.png")
hist(credit_data$Balance, main="Histogram of Balance", xlab="Balance")
dev.off() 

png("../../images/balance_boxplot.png")
boxplot(credit_data$Balance, main="Boxplot of Balance", xlab="Balance")
dev.off() 

#Qualitative Variables 
##Frequency Table 
frequency_count_table <- table(credit_data$Gender, credit_data$Married, credit_data$Student, credit_data$Ethnicity) 
frequency_proportion_table <- prop.table(frequency_count_table)
frequency_table <- merge(frequency_count_table, frequency_proportion_table, by=c("Var1", "Var2", "Var3", "Var4"))
colnames(frequency_table)<- c("Gender", "Married", "Student", "Ethnicity", "Frequency", "Relative Frequency")

sink("../../data/eda-output.txt")
print("Frequency Table")
print(frequency_table)
sink()

##Barcharts 
png("../../images/ethnicity_barchart.png")
barchart(table(credit_data$Ethnicity), main="Frequency of Ethnicity")
dev.off()

png("../../images/student_barchart.png")
barchart(table(credit_data$Student), main="Frequency of Student")
dev.off()

png("../../images/married_barchart.png")
barchart(table(credit_data$Married), main="Frequency of Married")
dev.off()

png("../../images/gender_barchart.png")
barchart(table(credit_data$Gender), main="Frequency of Gender")
dev.off()
