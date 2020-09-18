# Serie 01
## Aufgabe 1.1
### a
x <- c(4,2,1,3,3,5,7)

### b
x[3]

### c
x[c(1,4)]

### d
length(x)

### e
#### Meine Vermutung ist, dass die Zahl 2 dem Vektor hinzugefügt wird (als Eintrag)
x + 2

### f
#### Meine Vermutung ist, dass alle Elemente des Vektors mit zwei addiert werden und daraus die Summe gebildet wird
sum(x)
sum(x+2)

### g
#### Meine Vermutung ist, dass die Elemente die kleiner gleich 3 sind, ausgegeben werden
x <= 3

### h
#### Meine VErmutung ist, dass die Elemente die kleiner gleich 3 sind, ausgegeben werden
x[x <= 3]

### i
#### sortiert die Elemente im Vektor
sort(x)

### j
#### order reiht die Elemente temporär ein
order(x)
x
#### order(x) gibt den Index aller Elemente in einer sortierten Form zurück

### k
x[4] <- 8
x

## Aufgabe 1.2
### a
fahrenheit <- c(51.9, 51.8, 51.9, 53)
fahrenheit

### b
celsius <- 5/9 * (fahrenheit - 32)
celsius

### c
fahrenheit2 <- c(48, 48.2, 48, 48.7)
fahrenheit - fahrenheit2

## Aufgabe 1.3
weight = c(60, 72, 57, 90, 95, 72)
height = c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)

bmi <- weight/height^2
bmi

## Aufgabe 1.4
### a
seq(from, to, by = , length.out = ) 
seq(1, 10, by = 3) 
seq(1, 800, length.out =20) 
# generiert eine Sequenz mit definiertem Start, sowie Endpunkt.
# Die Option By definiert die Grösse zwischen den Werten
# length.out definiert die Menge an Werte die zwischen from und to generiert werden

# b
x <- c(4, 10, 3, NA, NA, 1, 8)
# b.1
mean(x)
# ein Mittelwert kann nicht gebildert werden, weil nicht genügend Daten zur Verfügung stellen
# b.2
mean(x, na.rm=TRUE)
# b.3
sort(x, decreasing = T)
order(x)
x
# sort() sortiert die Werte aufsteigend, NA wird gefiltert
# order() retourniert die Indexe der kleinsten Werte aufsteigend
# decreasing = T : sortiert absteigend
# na.last: stellt NA Werte ans Ende

# c
z <- c(4, 2, 8, 9, 7, 5, 2, 1) 
plot(z)
plot(z,
     type = "l",
     col = "blue",
     lty = 2,
     main = "Haupttitel", xlab = "Ein paar Zahlen", ylab = "Andere Zahlen")
# https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/plot

# c.2
abline(a = NULL, b = NULL, h = NULL, v = 3, col = "green", lty=1)
abline(a = NULL, b = NULL, h = 4, v = NULL, col = "red", lty=3)
abline(a = 1, b = 2, col = "brown", lty=4)

# Aufgabe 1.5
setwd("/Users/stofers/SwitchDrive/Private/__Studium__/BScI/ASTAT/SW01/")
data = read.csv("weather.csv")
# a
data
# b
data[2:3]
# c
data[4]
# d
data[c(1,4)]
# e
data1 = data[c(1,4)]
write.csv("weather2.csv")           
# f
colnames(data[c(3)])
# g
colnames(data)[2] <- "Genf"
colnames(data)
# h
data3 <- data[order(data[, "Zurich"]), ]
data3
# Der Befehl erzeugt eine neue Tabelle mit den Temperaturen aufsteigend anhand Spalte Zurich
# data[, "Zurich"] exptrahiert nur die Werte von Zurich, order gibt die Indexe entsprechend aufsteigender
# Werte zurück und damit wird der neue Vektor gebildet.

# Aufgabe 1.6
# a
d.fuel <- read.table(file = "./d.fuel.dat", header = T, sep = ",")
d.fuel
summary(d.fuel)
# b
d.fuel[5,]
# c
head(d.fuel)
# d
d.fuel[c(1:3,57:60),]
# e
mean(d.fuel[,3])
# f
mean(d.fuel[7:22,3])
# g
t.kml <- 1.6093 * d.fuel[,3] / 3.7891
t.kml
t.kg <- 0.45359 * d.fuel[,2]
t.kg
mean(t.kml)
mean(t.kg)