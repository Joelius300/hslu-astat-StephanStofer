# Lineare Regression

Mit Hilfe der lineare Regression soll ein *Modell* entwickelt werden, womit eine *Vorhersage* über den Verlauf gemacht werden kann. Dabei suchen wir nach der *Zielgrösse* oder *Outputvariable* $Y$, welche wir nur approximativ darstellen können, weil die Datenpunkte aus mathematischer Sichtweise keinen Graph einer Funktion darstellt, sondern Streudiagramme. Aus disem Grund gilt

$$Y \approx f(X_1,X_2,X_n)+\varepsilon$$

wobei $X_n$ als *Prädikatoren*, *Inputvariablen* oder *erklärende Variablen* bezeichnet werden. $\varepsilon$ ist ein *zufälliger Fehlerterm* der von $X_n$ unabhängig ist und den Mittwert $0$ hat.

Die Funktion $f$ ist im Allgemeinen unbekannt und wir müssen das optimale Modell wählen. Polynome $n$-ten Grades passen meinstens zwar besser, sind aber deutlich komplizierter als lineare Abbildungen. Es kann auch zu *Overfitting* führen, einem Phänomen welches Fehler oder Ausreisser zu stark berücksichtigt. Der grosse Vorteil von linearen Modellen ist das einfache geometrische interpretieren. $\beta_0$ entspricht dem $y$-Achsenabschnitt und $\beta_1$ der Steigung der Geraden.

## Das einfache Regressionsmodell
Das *einfache lineare Regressionsmodell* ist ein einfaches Verfahren, um einen quantitativen Output $Y$ auf der Basis einer einzigen Inputvariable $X$ verherzusagen. Es wird eine annähernde lineare Beziehung zwischen $X$ und $Y$ angenommen.
$$Y \approx \beta_0 + \beta_1X$$
Es wird eine Gerade gesucht, welche möglichst nahe an der wahren Gerade anliegt. Um die *Nähe* jedes Datenpunktes zu messen wird meistens die *die Methode der kleinsten Quadrate* verwendet. Der erhaltene Wert ist das $i$-te *Residuum*, welches der Differenz zwischem dem $i$-ten *beobachteten* Wert der Zielgrösse und dem $i$-ten vom linearen Modell *vorhergesagten* Wert der Zielgrösse entspricht. Die Residuen oberhalb der Geraden sind positiv, diejenigen unterhalb der Geraden negativ. Die *Summe* der Residuen ist kein guter Wert für die Nähe der Punkte zur Gerade, weil sich diese aufheben. Dazu eignet sich die Summe der *Quadrate* der Residuen (Residual Sum of Squares - RSS).
$$RSS = r_1^2+r_2^2+...+r_n^2$$
oder äquivalent
$$RSS=(y_1-\hat{\beta}_0-\hat{\beta}_1x_1)^2+...+(y_n-\hat{\beta}_0-\hat{\beta}_1x_n)^2$$
Mit der Methode der kleinsten Quadrate wird nun $\hat{\beta}_0$ und $\hat{\beta}_1$ so gewählt, dass RSS *minimal* wird.

In `R` wird die Regressionsgerade mit dem Befehl `lm(y~x)` berechnet. Wobei der *intercept* den $y$-Achsenabschnitt bestimmt. Die Inputvariable bestimmt die Steigung der Gerade.

## Vertrauensintervall im linearen Modell
Mit dem Vertrauensintervall bestimmen wir wie *genau* unsere Schätzungen für die Koeffizienten sind. Meistens hat man in der Statistik nicht alle nötigen Daten zur Verfügung um eine Vorhersage zu machen. Um einen ungefähren Wert von $\mu$ zu erhalten währen wir aus einer Messreihe z. B. 1000 Werte und verwenden den Durchschnitt $\bar{y}$ und damit $\mu \approx \hat{\mu} = \bar{y}$.

Mit `R` erhalten wir nun für $\beta_0$ und $\beta_1$ das 95%-Vertrauensintervall:

```R
confint(lm(Y~X),level=0.95)
```

## Hypothesentest im linearen Modell
Der häufigste Hypothesentest besteht aus dem Testen der *Nullhypthese* von
$$H_0 = Es gibt keinen Zusammenhang zwischen X und Y$$
gegen die *Alternativhypothese*
$$H_A = Es gibt einen Zusammenhang zwischen X und Y$$

Mathematisch entspricht dies $H_0: \beta_1 = 0$ gegen $H_A: \beta_1 \neq 0$. Ist $\beta_1 = 0$, dann gilt $Y=\beta_0 + \varepsilon$ und damit hängt $Y$ *nicht* von $X$ ab.

![Null- und Alternativhypothese graphisch](linReg.png){width=80%}

Bei der Abbildung links ist $\hat{\beta}_1$ praktisch 0. Es gibt *keinen* Zusammenhang zwischen den Variablen $x$ und $y.1$. Das bedeutet, egal welches $x$ wir wählen, der $y$-Wert bleibt immer gleich.

Im Graph in der Mitte ist $\hat{\beta}_1$ ungleich 0. Es *gibt* einen Zusammenhang zwischen den Variablen $x$ und $y.2$. Das heisst je grösser wir $x$ wählen, umso grösser wird der $y$-Wert.

Im dritten Graph ist die Gerade zwar leicht steigend, aber es ist schwer einen Zusammenhang im Streudiagramm zu erkennen. Die Abweichung kann zufällig sein.

Die Frage ist nun, wie stark steigend oder fallend muss die Regressionsgerade sein, damit die Steigungn *statistisch signifikant* ungleich 0 ist? Um die Nullhypthese zu testen wenden wir einen Hypthesentest ($t$-Test) an.

```R
summary(lm(y~x))
```

Ist der Wert von *Pr(>|t|)* unter dem Eintrag *Coefficients* kleiner als 0.05, wird die Nullhypothese verworfen. Dann gibt es einen Zusammenhang zwischen den beiden Variablen.

## Abschätzung der Genauigkeit des Modells
Nachdem die Nullhypothese verworfen wurde stellt sich die Frage wie genau passt das Modell zu den wahren Daten. Die Qualität einer linearen Regression wird typischerweise durch den *residual standard error* (RSE) und die $R^2$-Statistik abgeschätzt.

### $R^2$-Statistik
Die $R^2$-Statistik ist ein Wert zwischen 0 und 1. Sie gibt an, welcher Anteil der Variablität in $Y$ mit Hilfe des Modells durch $X$ erklärt werden. Ein Wert nahe bei 1 bedeutet, dass ein grosser Anteil der Variabilität durch die Regression erklärt wird. Das Modell beschreibt die Daten sehr gut. Ist der Wert nahe bei 0 bedeutet, dass die Regression die Variabilität der erklärenden Variablen nicht erklärt. Wurde nun die Nullhypothese verworfen, erklärt, stellt sich die Frage in welchem Ausmass das Modell zu den Daten passt.

Der $R^2$-Wert wird durch zwei Varianzen berechnet. Er ergibt sich aus dem Durchschnitt der quadrierten Länge vom Abstand des Mittelwertes von $y$ zum *Modell*, geteilt durch den den Durchschnitt der quadrierten Länge vom Abstand des Mittelwertes von $y$ zum *Sample* (Messreihe).

Siehe in der folgenden Abbildung. Die roten Linien sind die Abstände zum Modell, die pinken die Abstände zu den Datenpunkten.

![Definition von $R^2$](definition-r2.png){width=80%}

Der $R^2$-Wert wird definiert durch:
$$R^2 = \frac{Varianz Modell}{Varianz Sample}$$

```R
summary(lm(y~x))$r.squared
```

### Alternative Darstellung von $R^2$
$R^2$ lässt sich auch durch die Differenzen der Daten zum Modell berechnen. Dazu wird der Durchschnitt der Quadrate der Differenzen von Modell zu den Daten berechnet. Dadurch ergibt sich folgende Definition:
$$R^2=1-\frac{Varianz Differenz}{Varianz Sample}$$

Die Berechnung mit `R` ist identisch wie vorhin.

Der Vorteil dieser Variante ist, dass sich der $R^2$-Wert einfacher interpretieren lässt

* Varianz Differenz: Ist die Varianz des Samples, die *nicht* durch das Modell erklärt wird
* $\frac{Varianz Differenz}{Varianz Sample}$: Ist der *Anteil* der Varianz vom Sample, der *nicht* vom Modell erklärt wird
* $1-\frac{Varianz Differenz}{Varianz Sample}$: *Anteil* der Varianz vom Sample, der vom Modell erklärt wird
* $R^2$: *Anteil* der Varianz vom Sample, der vom Modell erklärt wird.

Die Varianz lässt sich in `R` einfach berechnen

```R
var(y)
```

Liegt die Varianz der Differenz nahe bei 0, passt das Modell gut zu den Daten. Die jeweiligen Abweichungen sind sehr klein. Der $R^2$-Wert liegt dann nahe bei 1.
