# Variablenselektion
Mit Hilfe der Variablenselektion haben wir eine Methode, wie wir eine bessere *Vorhersagegenauigkeit* und *Modellinterpretierbarkeit* erreichen.

* *Vorhersagegenauigkeit*: Der wahre Zusammenhang zwischen den $X_i$ und $Y$ ist annähernd linear, wenn $n$ sehr viel grösser als $p$ ist. Die Varianz ist klein und Vorhersagen entsprechend gut. Durch *Schrumpfen* oder auch *Shrinking* kann die Varianz oft verkleinert und die Vorhersagekraft gesteigert werden.
* *Modellinterpretierbarkeit*: Oft haben einige Variablen keinen Zusammenhang mit der Zielvariable und können weggelassen werden. Das Modell kann einfacher interpretiert werden.

Die Methode der kleinsten Quadrate liefert keine Koeffizienten die exakt 0 sind. Folgende Verfahren entfernen automatisch *irrelevante* Variablen aus dem multiplen Regressionsmodell.

## Schrittweise Vorwärtsselektion
Ist eine rechnerisch effiziente Methode, um Variablen zu eliminieren. Sie beginnt mit einem Modell ohne erklärenden Variablen und fügt die Variablen hinzu, welche die *grösste zusätzliche* Verbesserung mit sich bringen. Die Methode startet mit dem *Nullmodell* $M_0$.
$$M_0 = \beta_0 + \varepsilon$$
Danach wird die *beste* Variable ausgewählt und hinzugefügt. Das Auswahlkriterium ist der kleinste RSS-Wert (Summe der Quadrate der Residuen). Je kleiner dieser Wert, umso besser passen die Daten zum System. Die Variable wird mit dem `R`-Befehl `add1` hinzugefügt. Danach ist ein `update` notwendig. Jede weitere hinzugefügte Variable ergibt ein neues Modell $M_i$. Mit Hilfe des AIC-Wertes wird entschieden, welches das beste Modell unter den $M_i$'s ist.

```{.r .numberLines}
reg <- regsubsets(y~., data = list, method = "forward")
reg.sum <- summary(reg)
reg.sum$which
```
Obiger Befehl führt gesamtes Verfahren automatisch ohne `add1` und `update` durch. Sobald ein *TRUE* erscheint, wird die Variable verwendet.

## Schrittweise Rückwärtsselektion
Funktioniert ähnlich wie die Vorwärtsselektion, allerdings wird mit einem vollen Modell begonnen, welches alle erklärenden Variablen enthält. Schrittweise wird die Variable vom Modell entfernt, welche am wenigsten nützlich ist. Es wird wiederum der RSS-Wert (kleinste) verwendet, um zu entscheiden welche Variable entfernt wird.

## Anzahl Variablen / Abbruchbedingung
Die Vorwärts- und Rückwärtsselektion beschreibt nur in welcher Reihenfolge Variablen ausgewählt werden, jedoch nicht wieviele. Das Problem bei der Vorwärtsselektion ist, dass der RSS-Wert mit jeder weiteren Variable abnimmt. Aber auch der $R^2$ ist kein Abbruchkriterium, weil dieser mit jeder Variable zunimmt. Der *adjusted $R^2$* ist abhängig von der Anzahl Variablen und nimmt zu Beginn zu. Er erreicht irgendwann ein Maximum und würde dann wieder abnehmen.
Weiter könnte auch der AIC (Akaike information criterion) verwendet werden. Ein kleiner AIC ist besser und die Variablen werden addiert, solange der AIC-Wert abnimmt. Sobald er zunimmt, werden Die restlichen Variblen weggelassen.
