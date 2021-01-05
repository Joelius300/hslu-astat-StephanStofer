# Deskriptive Statistik - Zweidimensionale Daten

Bei zweidimensionalen Daten werden an *einem* Versuchobjekt jeweils *zwei* verschiedene Grössen ermittelt. Als Beispiel dient uns das *Versuchsobjekt* Mensch mit den Messungen zu der *Körpergrösse* und *Körpergewicht*.

## Streudiagramme
Zweidimensionale Daten werden häufig mit *Streudiagrammen* (Scatterplot) dargestellt. Dabei werden die beiden Messungen einer Versuchseinheit als *Koordinaten* in einem Korrdinatensystem interpretiert und dargestellt. Sind die Daten in dieser Form gegeben, interessieren wir uns in erster Linie für die *Zusammenhänge* und *Abhängigkeiten* zwischen den beiden Variablen.

![Streudiagramm für die Mortalität und Weinkonsum](bsp-streudiagramm.png){width=70%}

Dabei ist ein Punkt als ($x_1,y_1)$ mit den Grössen $x=Weinkonsum$ und $y=Mortalitaet$ zu interpretieren.

* Einfluss auf andere Körperorgane wird hier nicht berücksichtigt
* *Kausaler* Zusammenhang muss nicht zwingend zwischen den beiden Grössen vorhanden sein
* Die Zuweisung der Grösse und X/Y-Achse könnte auch vertauscht werden. Die Entscheidung hängt von der Problemstellung ab
* Die Punkte im Streudiagramm werden auch als *Punktwolke* bezeichnet

### Streudiagramm in `R`

```{.r .numberLines}
wein <- c(2.8, 3.2, 3.2, 3.4, 4.3, 4.9, 5.1, 5.2, 5.9, 5.9, 6.6, 8.3, 12.6, 15.1, 25.1, 33.1, 75.9, 75.9)
mort <- c(6.2, 9.0, 7.1, 6.8, 10.2, 7.8, 9.3, 5.9, 8.9, 5.5, 7.1, 9.1, 5.1, 4.7, 4.7, 3.1, 3.2, 2.1)
plot(wein,
	mort,
	xlab = "Weinkonsum (Liter pro Jahr und Person)",
	ylab = "Mortalität",
	main = "Zusammenhang zwischen Weinkonsum und Mortalität", pch = 20,
	col = "blue"
)
```

## Abhängigkeit und Kausalität
Bei Streudiagrammen müssen wir aufpassen, dass *Abhängigkeit* und *Kausalität* nicht miteinander verwechselt werden. Nur weil eine Gesetzmässigkeit vorhanden ist, heisst das nicht, dass diese Gesetzmässigkeit auch kausal erklärt werden kann. Man muss sich *bewusst* sein, auf *welchen Daten* das Streudiagramm basiert. Man soll sich *nie* blindlings auf Grafiken verlassen. Die Daten müssen auf anderen Weg auf einen kausalen Zusammenhang untersucht werden.

## Einfache lineare Regression
Weil wir wissen möchten, *wie* sich Daten verhalten, versuchen wir einem Muster ein Form zu geben. Dies kann eine Gerade sein. Die Beschreibung dieser Form geschieht in der Sprache der Mathematik. Dabei wird auch von einer *Modellierung* der Daten gesprochen.

Liegt ein Modell vor, können wir *Vorhersagen* machen. Dieses Modell erlaubt uns, Daten die nicht exakt *gemessen* vorliegen abzuschätzen. Als Beispiel die Wettervorhersage oder den Preis einer Ware bei x-Stücken.

### Methode der kleinsten Quadrate
Wie finden wir nun die Gerade die *möglichst gut* zu allen Punkten passt? Dazu verwenden wir den Begriff **Residuum**. Ein *Residuum* $r_i$ ist die vertikale Differenz zwischen einem Datenpunkt ($x_i,y_i)$ und dem Punkt ($x_i,a+bx_i$) auf der gesuchten Geraden:

$$r_i=y_i-(a+bx_i)=y_i-a-bx_i$$

Bei der Methode der kleinsten Quadrate werden die Summen der *Quadrate der Abweichungen* aufsummiert $r_1^2+r_2^2+...+r_n^2=\sum_{i}r_i^2$. Die Parameter $a$ und $b$ werden so gewählt, dass die Summe minimal wird. Eine Gerade passt also dann am besten zu den Punkten im Streudiagramm, wenn die Summe der Quadrate der vertikalen Abweichungen minimal ist (Optimierungsproblem).

![Residuen für Buchpreis in Abhängigkeit der Seitenanzahl](residuum.png){width=60%}

#### Gerade mit `R`

```{.r .numberLines}
seite <- c(seq(50, 500, 50))
preis <- c(6.4, 9.5, 15.6, 15.1, 17.8,23.4, 23.4, 22.5, 26.1, 29.1)
plot(seite,
	preis,
	xlab = "Seitenzahl",
	ylab = "Buchpreis",
	pch = 16,
	col = "blue"
)
abline(lm(preis ~ seite), col = "orange")

lm(preis ~ seite)
# Call:
# lm(formula = preis ~ seite)
#
# Coefficients:
# (Intercept)        seite
#     6.04000      0.04673
# y = 6.04 + 0.047x
```

* `lm()` steht für *linear model*
* Mit `lm(y ~ x)` passt `R` ein Modell der Form $y=a+bx$ an die Daten an
* Die Variabeln sind verglichen mit dem `plot(x,y)` vertauscht
* Die Gerade wird *Regressionsgerade* genannt

![Streudiagramm mit Regressionsgeraden aus obigem `R` Code](streudiagramm-regression.png){width=60%}

#### Extrapolationen
Extrapolationen sind Vorhersagen der $y$-Werte des Modelles, die *ausserhalb* des Bereiches ($x$) liegen, womit das Modell erstellt wurde. Für Extrapolationen, die weit ausserhalb des gültigen Bereichs liegen, können die Vorhersagen problematisch, wenn nicht sogar sinnlos werden.

#### Interpolationen
Interpolationen sind Vorhersagen der $y$-Werte des Modells, die *innerhalb* des Bereichs liegt, womit das Modell erstellt wurde. Die Interpolationen sind unproblematischer, aber auch nur *begrenzt* gültig.

### Empirische Korrelation
Die *empirische Korrelation* ($r$ als Kennzahl oder auch $\hat{p}$) ist die quantitative Zusammenfassung der *linearen* Abhängigkeit von zwei Grössen. Es ist eine dimensionslose Zahl zwischen $-1$ und $1$ und misst die Stärke und die Richtung der *linearen Abhängigkeit* zwischen den Daten $x$ und $y$. *Wichtig:* Der Korrelationskoeffizient misst (erkennt) nur den linearen Zusammenhang!

* Ist $r=+1$, dann liegen Punkte auf einer steigenden Geraden ($y=a+bx$ mit $b>0$)
* Ist $r=-1$, dann liegen die Punkte auf einer fallenden Geraden ($y=a+bx$ mit $b<0$)
* Sind $x$ und $y$ unabhängig (es besteht kein Zusammenhang), so ist $r=0$. Die Umkehrung gilt Allgemein aber nicht!

#### Empirische Korrelation in `R`

```{.r .numberLines}
cor(seite, preis)
# [1] 0.968112
```

Dieser Wert liegt sehr nahe bei 1 und somit besteht ein *enger* linearen Zusammenhang. Dazu ist der Wert positiv, was einem "je mehr, desto mehr" entspricht.
