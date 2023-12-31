#Por Raul V. Ramírez Velarde
#Agosto 2020
#De multiples fuentes
"
[, 1]	mpg	Miles/(US) gallon
[, 2]	cyl	Number of cylinders
[, 3]	disp	Displacement (cu.in.)
[, 4]	hp	Gross horsepower
[, 5]	drat	Rear axle ratio
[, 6]	wt	Weight (1000 lbs)
[, 7]	qsec	1/4 mile time
[, 8]	vs	Engine (0 = V-shaped, 1 = straight)
[, 9]	am	Transmission (0 = automatic, 1 = manual)
[,10]	gear	Number of forward gears
[,11]	carb	Number of carburetors"

#Libraries

require(car)
require(data.table)
require(corrplot)
require(ggplot2)

#Getting data included in E
data(mtcars) # LLAMAR
attach(mtcars) #guardar en el ambiente
print(mtcars)
str(mtcars) # 

#Or this
#To read from file
#library(readr)
#mtcars <- read.csv("Clases y Cursos/Analisis e Interpretacion UNIR/R/Data mtcars_db.csv")
#mtcars <- read.csv("https://raw.githubusercontent.com/rramirez-tec-mx/data/main/Data%20mtcars_db.csv")
#print(mtcars)
#str(mtcars)
#mtcars <- subset(mtcars, select = -c(Manufacturer, Brand ))

summary(mtcars)

mean(mpg)
var(mpg)
sd(mpg)
quantile(mpg)
summary(mpg)

library(pastecs)
stat.desc(mtcars)

library(psych)
describe(mtcars)

corr_mpg_hp=cor(mtcars$mpg,mtcars$hp)
print(corr_mpg_hp)
correlations=cor(mtcars)

library(corrplot)
corrplot(correlations, method = "circle")

res <- cor.test(wt, mpg, method = "pearson")
print(res)

#Exploring the variable of interest
#Line plots. See data series behaviour

plot(mpg)
plot(mpg,type="o")
plot(mpg,type="l")

plot(drat)
plot(wt)
plot(qsec)
plot(vs)
plot(am)
plot(gear)
plot(carb)

#Scatterplots. Plotting Relationships
plot(wt,mpg)
plot(disp,mpg)
plot(disp,mpg)
plot(qsec,mpg)
plot(hp,mpg)

pairs(~.,data=mtcars)
pairs(~wt+mpg+disp+hp,data=mtcars)

# Give the chart file a name.
png(file = "line_chart_2_lines.jpg")

# Plot two consecutive lines
plot(mpg,type = "o",col = "red", xlab = "Seq", ylab = "mpg", 
     main = "mpg line chart")

lines(qsec, type = "o", col = "blue")

library(lattice)
xyplot(mpg~disp,
       data=mtcars,
       groups=cyl,
       auto.key=list(corner=c(1,1)))

#Histogram
hist(mpg)
hist(mpg,xlab="mpg", main="mpg histogram",
     breaks=30L)
hist(mpg,xlab="mpg", main="mpg histogram",
     breaks=sqrt(nrow(mtcars)))

install.packages("ggplot2")
library(ggplot2)

#With ggplot2
ggplot(mtcars) +
  aes(x = mpg) +
  geom_histogram(bins = 30L, fill = "#0c4c8a") +
  theme_minimal()

#With ggplot2
ggplot(mtcars) +
  aes(x = mpg) +
  geom_histogram(bins = sqrt(nrow(mtcars)), fill = "#0c4c8a") +
  theme_minimal()

#Boxplot
boxplot(mpg,ylab = "mpg")

#grouped data
boxplot(mpg~vs)
boxplot(mpg~gear)
boxplot(mpg~cyl)

low_mpg = mpg< 20
low_mpg <- ifelse(mpg<20, 1, 0)
low_mpg <- ifelse(mpg<20, "Low mpg", "High mpg")

boxplot(wt~low_mpg)

ggplot(mtcars) +
  aes(x = "", y = mpg) +
  geom_boxplot(fill = "#0c4c8a") +
  theme_minimal()

#Groupping data

#Basic plot
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point(size = 4)
p + geom_line(size = 2)
p + geom_line(aes(linetype = factor(cyl)))

# Using the colour aesthetic
p + geom_point(aes(colour = factor(cyl)), size = 4)

# Using the shape aesthetic
p + geom_point(aes(shape = factor(cyl)), size = 4)

# Using fill
p <- ggplot(mtcars, aes(factor(cyl)))
p + geom_bar()
p + geom_bar(aes(fill = factor(cyl)))
p + geom_bar(aes(fill = factor(vs)))

#Creating Tables
mytable <- table(gear,mpg)
ftable(mytable)

# 3-Way Cross Tabulation Table
#mytable <- xtabs(~cyl+vs+mpg, data=mtcarsb)
mytable <- xtabs(~cyl+vs+mpg)
ftable(mytable) # print table
summary(mytable) # chi-square test of indepedence 

# 2-Way Cross Tabulation
install.packages("gmodels")
library(gmodels)
CrossTable(gear, mpg) 

#Pretty printing Frequency Table
install.packages('epiDisplay')
library(epiDisplay)
tab1(mtcars$cyl, sort.group = "decreasing", cum.percent = TRUE)

#Creating a frequency table by hand

range(hp)
table(cut(hp, breaks=50:350)) #Wont work
table(cut(hp, breaks=seq(50,350,by=50))) #Fast

#Create bins
breaks = seq(from = min(hp),to = max(hp), by=20)

#Separate 
#right = FALSE mean [#,#)
#include.lowest = TRUE means include the minimum hp
hp_by_ranges <- cut(hp, breaks,right = FALSE, include.lowest = TRUE)

#Create table
print(table(hp_by_ranges))

#Create dataframe
hp_freq_tab <- cbind(table(hp_by_ranges))
colnames(hp_freq_tab) <- c("Frequency")
print(hp_freq_tab)
