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
#### permutiert die Elemente

### k
x[4] <- 8
x

## Aufgabe 1.2
### a
fahrenheit <- c(51.9, 51.8, 51.9, 53)
fahrenheit

### b
celsius <- 5/9(fahrenheit -32)
### c
