credit_data <- read.csv("../../data/Credit.csv")

#Quantitative variables 

##Income 

income_stats <- c(min(credit_data$Income),max(credit_data$Income), (max(credit_data$Income)-min(credit_data$Income)), median(credit_data$Income), quantile(credit_data$Income)[2], quantile(credit_data$Income)[4],IQR(credit_data$Income),mean(credit_data$Income),sd(credit_data$Income))
names(income_stats) <- c("Min", "Max", "Range", "Median", "First Quartile", "Third Quartile", "IQR", "Mean", "Std. Deviation")
income_stats <- as.data.frame(round(income_stats, digits=0))
colnames(income_stats) <- "Income"

png("../../images/income-histogram.png")
hist(credit_data$Income, main="Histogram of Income", xlab="Income")
dev.off() 

png("../../images/income-boxplot.png")
boxplot(credit_data$Income, main="Boxplot of Income", xlab="Income")
dev.off() 

##Limit
limit_stats <- c(min(credit_data$Limit),max(credit_data$Limit), (max(credit_data$Limit)-min(credit_data$Limit)), median(credit_data$Limit), quantile(credit_data$Limit)[2], quantile(credit_data$Limit)[4],IQR(credit_data$Limit),mean(credit_data$Limit),sd(credit_data$Limit))
names(limit_stats) <- c("Min", "Max", "Range", "Median", "First Quartile", "Third Quartile", "IQR", "Mean", "Std. Deviation")
limit_stats <- as.data.frame(round(limit_stats, digits=0))
colnames(limit_stats) <- "Limit"

png("../../images/limit-histogram.png")
hist(credit_data$Limit, main="Histogram of Limit", xlab="Limit")
dev.off() 

png("../../images/limit-boxplot.png")
boxplot(credit_data$Limit, main="Boxplot of Limit", xlab="Limit")
dev.off() 

##Rating

rating_stats <- c(min(credit_data$Rating),max(credit_data$Rating), (max(credit_data$Rating)-min(credit_data$Rating)), median(credit_data$Rating), quantile(credit_data$Rating)[2], quantile(credit_data$Rating)[4],IQR(credit_data$Rating),mean(credit_data$Rating),sd(credit_data$Rating))
names(rating_stats) <- c("Min", "Max", "Range", "Median", "First Quartile", "Third Quartile", "IQR", "Mean", "Std. Deviation")
rating_stats <- as.data.frame(round(rating_stats, digits=0))
colnames(rating_stats) <- "Rating"

png("../../images/rating-histogram.png")
hist(credit_data$Rating, main="Histogram of Rating", xlab="Rating")
dev.off() 

png("../../images/rating-boxplot.png")
boxplot(credit_data$Rating, main="Boxplot of Rating", xlab="Rating")
dev.off() 

##Cards 

cards_stats <- c(min(credit_data$Cards),max(credit_data$Cards), (max(credit_data$Cards)-min(credit_data$Cards)), median(credit_data$Cards), quantile(credit_data$Cards)[2], quantile(credit_data$Cards)[4],IQR(credit_data$Cards),mean(credit_data$Cards),sd(credit_data$Cards))
names(cards_stats) <- c("Min", "Max", "Range", "Median", "First Quartile", "Third Quartile", "IQR", "Mean", "Std. Deviation")
cards_stats <- as.data.frame(round(cards_stats,digits=0))
colnames(cards_stats) <- "Cards"

png("../../images/cards-histogram.png")
hist(credit_data$Cards, main="Histogram of Cards", xlab="Cards")
dev.off() 

png("../../images/cards-boxplot.png")
boxplot(credit_data$Cards, main="Boxplot of Cards", xlab="Cards")
dev.off() 

##Age

age_stats <- c(min(credit_data$Age),max(credit_data$Age), (max(credit_data$Age)-min(credit_data$Age)), median(credit_data$Age), quantile(credit_data$Age)[2], quantile(credit_data$Age)[4],IQR(credit_data$Age),mean(credit_data$Age),sd(credit_data$Age))
names(age_stats) <- c("Min", "Max", "Range", "Median", "First Quartile", "Third Quartile", "IQR", "Mean", "Std. Deviation")
age_stats <- as.data.frame(round(age_stats, digits=0))
colnames(age_stats) <- "Age"

png("../../images/age-histogram.png")
hist(credit_data$Age, main="Histogram of Age", xlab="Age")
dev.off() 

png("../../images/age-boxplot.png")
boxplot(credit_data$Age, main="Boxplot of Age", xlab="Age")
dev.off() 

##Education

education_stats <- c(min(credit_data$Education),max(credit_data$Education), (max(credit_data$Education)-min(credit_data$Education)), median(credit_data$Education), quantile(credit_data$Education)[2], quantile(credit_data$Education)[4],IQR(credit_data$Education),mean(credit_data$Education),sd(credit_data$Education))
names(education_stats) <- c("Min", "Max", "Range", "Median", "First Quartile", "Third Quartile", "IQR", "Mean", "Std. Deviation")
education_stats <- as.data.frame(round(education_stats, digits=0))
colnames(education_stats) <- "Education"

png("../../images/education-histogram.png")
hist(credit_data$Education, main="Histogram of Education", xlab="Education")
dev.off() 

png("../../images/education-boxplot.png")
boxplot(credit_data$Education, main="Boxplot of Education", xlab="Education")
dev.off() 

##Balance

balance_stats <- c(min(credit_data$Balance),max(credit_data$Balance), (max(credit_data$Balance)-min(credit_data$Balance)), median(credit_data$Balance), quantile(credit_data$Balance)[2], quantile(credit_data$Balance)[4],IQR(credit_data$Balance),mean(credit_data$Balance),sd(credit_data$Balance))
names(balance_stats) <- c("Min", "Max", "Range", "Median", "First Quartile", "Third Quartile", "IQR", "Mean", "Std. Deviation")
balance_stats <- as.data.frame(round(balance_stats, digits=0))
colnames(balance_stats) <- "Balance"

png("../../images/balance-histogram.png")
hist(credit_data$Balance, main="Histogram of Balance", xlab="Balance")
dev.off() 

png("../../images/balance-boxplot.png")
boxplot(credit_data$Balance, main="Boxplot of Balance", xlab="Balance")
dev.off() 

##Descriptive Statistics Summary
descriptive_var_stats <- data.frame(income_stats, limit_stats, rating_stats, cards_stats, age_stats, education_stats, balance_stats)

#Qualitative Variables 
##Frequency Table 
frequency_count_table <- table(credit_data$Gender, credit_data$Married, credit_data$Student, credit_data$Ethnicity) 
frequency_proportion_table <- prop.table(frequency_count_table)
frequency_table <- merge(frequency_count_table, frequency_proportion_table, by=c("Var1", "Var2", "Var3", "Var4"))
colnames(frequency_table)<- c("Gender", "Married", "Student", "Ethnicity", "Frequency", "Relative Frequency")


##Barcharts 
png("../../images/ethnicity-barchart.png")
barplot(table(credit_data$Ethnicity), main="Frequency of Ethnicity")
dev.off()

png("../../images/student-barchart.png")
barplot(table(credit_data$Student), main="Frequency of Student")
dev.off()

png("../../images/married-barchart.png")
barplot(table(credit_data$Married), main="Frequency of Married")
dev.off()

png("../../images/gender-barchart.png")
barplot(table(credit_data$Gender), main="Frequency of Gender")
dev.off()

#Correlation Matrix
mat <- signif(cor(credit_data[c(1:6, 12)]),2)
mat[lower.tri(mat)]=""
correlation_matrix <- data.frame(mat)

#Scatterplot Matrix 
png("../../images/scatterplot-matrix.png")
pairs(credit_data[c(1:6, 12)], pch=16, cex=.5, main="Scatterplot Matrix of Variables")
dev.off()
 
#ANOVAs 
gender_anova <- aov(Balance ~ Gender, data=credit_data)
student_anova <- aov(Balance ~ Student, data=credit_data)
married_anova <- aov(Balance ~ Married, data=credit_data)
ethnicity_anova <- aov(Balance ~ Ethnicity, data=credit_data)

#Boxplots
png("../../images/gender-boxplot.png")
plot(credit_data$Gender, credit_data$Balance, xlab="Gender", ylab="Balance", main="Boxplot of Balance over Gender")
dev.off()

png("../../images/student-boxplot.png")
plot(credit_data$Student, credit_data$Balance, xlab="Student", ylab="Balance", main="Boxplot of Balance over Student")
dev.off()


png("../../images/married-boxplot.png")
plot(credit_data$Married, credit_data$Balance, xlab="Married", ylab="Balance", main="Boxplot of Balance over Married")
dev.off()

png("../../images/ethnicity-boxplot.png")
plot(credit_data$Ethnicity, credit_data$Balance, xlab="Ethnicity", ylab="Balance", main="Boxplot of Balance over Ethnicity")
dev.off()

#eda-output.txt
sink("../../data/eda-output.txt")
print("Descriptive Statistics")
print(descriptive_var_stats)
print("Frequency Table")
print(frequency_table)
print("Correlation Matrix")
print(correlation_matrix)
sink()                         

#save Rdata
save(descriptive_var_stats, frequency_table, correlation_matrix, file="../../data/eda-output.Rdata")                 
