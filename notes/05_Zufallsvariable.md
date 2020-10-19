# Zufallsvariable

Bei einem Zufallsexperiment mit dem Grundraum $\Omega$ ordnen wir mit der *Funktion* $X$ jedem Elementarereignis $\omega$ von $\Omega$ einen *Zahlwert* zu. Die Funktion $X$ wird als *Zufallsvariable* bezeichnet und ordnet damit jedem Element *eine Zahl* zu.

Eine Wertemenge bezeichnet die Werte, welche die Zufallsvariable annehmen kann.

**Bermerkungen**  

* die *Zufallsvariable wird mit einem Grossbuchstaben bezeichnet ($X$)
* der entsprechende *Kleinbuchstabe* $x$ stellt einen konkreten Wert dar, den die Zufallsvariable annehmen kann (die Zahl)
* für das Ereignis, welches $X$ annimmt, schreiben wir $X=x$
* bei der Zufallsvariable ist nicht die Funktion $X$ zufällig, sondern das Argument $\omega$. Je nach Ausgang erhalten wir einen anderen Wert $X(\omega)=x$
* $x$ wird auch als *Realisierung* der Zufallsvariable $X$ bezeichnet

## Wahrscheinlichkeitsverteilung einer Zufallsvariable

Berechnen wir für *jede* Realisierung einer Zufallsvariable die zugehörige Eintretenswahrscheinlichkeit, so bilden alle diese Wahrscheinlichkeiten zusammen die *Wahrscheinlichkeitsverteilung* dieser Zufallsvariablen. Dabei gilt 

$$P(X=x_1)+P(X=x_2)+...+P(X=x_n)=1 $$

oder

$$\sum_{i=1}^{n} P(X=x_n)=1$$

## Kennzahlen einer Verteilung

Eine beliebige *diskrete* Verteilung kann durch zwei Kennzahlen, den *Erwartungswert* $E(X)$ und die *Standardabweichung* $\sigma(X)$. Der Erwartungswert beschreibt die mittlere Lage der Verteilung:

$$E(X)=x_1*P(X=x_1)+x_2*P(X=x_2)+...+x_n*P(X=x_n)=\sum_{i=1}^{n} x_i*P(X=x_i)$$

Die Standardabweichung oder *Varianz* beschreibt die Streuung der Verteilung.

$$Var(X)\sum_{i=1}^{n} (x_n-(E(X))^2 * P(X=x_n)$$
$$\sigma(X) = \sqrt{Var(x)}$$

### Standardabweichung mit R

```{.r .numberLines}
x <- 1 : 6 
p <- 1 / 6
E_X <- sum(x * p)
var_X <- sum((x - E_X)^2 * p)
sd_X <- sqrt(var_X) 
sd_X
# [1] 1.707825
```

Beispiel eines nicht-fairen Würfels auch mit `R` berechnet:

```{.r .numberLines}
x <- 1 : 6
p <- c(4, 2, 1, 3, 1, 1) / 12
E_X <- sum(x * p) 
E_X
## [1] 2.833333
var_X <- sum((x - E_X)^2 * p)
sd_X <- sqrt(var_X) 
sd_X
## [1] 1.674979
```

Der Erwartungswert ist 2.8333 und die Standardabweichung ist 1.675 (die Werte weichen im "Durchschnitt" so viel ab).

## Unterschied empirischer und theoretischer Kennzahlen

### Unterschied Mittelwert und Erwartungswert

Der arthmetische Mittelwert $\overline{x}$ wird aus *konkreten* Daten gewonnen. Wir haben also Messwerte $x_1,...,x_n$ und können $\overline{x}$ berechnen. Der Erwartungswert $\sigma_{X}$ ist ein *theoretischer* Wert, der sich aus dem Modell der Wahrscheinlichkeitsverteilung ergibt.

Die Hoffnung ist, dass sich das arithmetische Mittel für immer mehr Versuche an den theoretischen Wert annähert, sofern sich die konkreten Daten der Wahrscheinlichkeitsverteilung von $X$ folgen.

Derselbe Unterschied wie für Mittelwert und Erwartungswert gilt auch für die *empirische Standardabweichung* $s_X$ und die *Standardabweichung* $\sigma_X$
