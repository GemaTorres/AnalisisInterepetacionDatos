#Limpiar la memoria
rm(list = ls())

#Printing
print("Hola MUNDO")

#R is also a calculator
1+1+2+3+5+8
8-13
13*21
34*34
55/34 * sqrt(89)
exp(5) # el número "e" elevado a (función exponencial)
log(5) # logaritmo neperiano
log10(5) # logartimo en base 10
pi # el número "pi" está definido
sin(pi/2) # la función seno (ángulo en radianes)
factorial(5) # el factorial, 5!
choose(5,3) # número combinatorio (5 sobre 3)

#To save a result we assign the value to an object. We can
#use "=" or "<-"
x = 2+1 #x <- 2+1
x

#We can carry out operations with objects
otro_numero = 55/34 * sqrt(89)
otro_numero
otro_numero*x

#We can create arrays with c()
Ventas = c(1,1,2,3,5,8,13)
Ventas

#Operations on arrays are carried out in all array objects
Ventas + 5

#We can use functions to describe arrays
sum(Ventas)
mean(Ventas)
max(Ventas)
min(Ventas)
range(Ventas) #Minimum and maximum values
unique(Ventas)  #Unique values
length(Ventas) #How many elements
which(Ventas==1) #Positions in which Ventas=1

#And we can sort
sort_increase=sort(Ventas)

#We can assign names to values with names()
frutas = c("manzana" , "banana" , "sandía" , "ananá" , "limón" , "frutilla" , "naranja")
names(Ventas) = frutas
Ventas

#We can see individual values
Ventas[3]

#Or several
Ventas[c(1,3:7)]

#We can drop an element
Ventas[-c(1,5)]

#Relational operators are also applied to the entire array
Ventas>5
Ventas == 5

#Now we count and select
sum(Ventas > 5)
Ventas[Ventas > 5]

#For loop
for (i in 1:10) {print(i)}
for (i in c(2010,2011,2012,2013,2014,2015)) print(i)

for (i in 1:length(Ventas)) if (Ventas[i]>5) print(Ventas[i])

#Creating a dataframe
name <- c("Jon", "Bill", "Maria")
age <- c(23, 41, 32)

df <- data.frame(name, age)
#See it all
print (df)
#Only the first 10
head(df)

#Dimensions of datafram
dim(df)
nrow(df)
ncol(df)

fumadores <- matrix(c(23, 134, 34, 167, 41, 130), ncol=2)
colnames(fumadores) <- c("Fumadores", "No fumadores")
rownames(fumadores) <- c("Obesos", "sobrepeso", "normal")
fumadores

#Read local dataframes or through a URL
mtcars <- read.csv("/Users/gemaitzeltorresmejia/Documents/MAESTRIA/ANALISIS E INTERPRETACION DE DATOS/EJERCICIOS 5 JUNIO/Data mtcars.csv", sep = ",")
mtcars <- read.csv("https://raw.githubusercontent.com/rramirez-tec-mx/data/main/Data%20mtcars_db.csv")
