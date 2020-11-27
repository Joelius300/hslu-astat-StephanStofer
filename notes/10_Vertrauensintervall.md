# Vertrauensintervall, Zweistichprobentest und Wilcoxon-Test

## Vertrauensintervall für $\mu$

Das Intervall gibt an, wo der wahre Mittelwert $\mu$  mit einer bestimmten 95%-Wahrscheinlichkeit liegt. Bei der Bestimmung des Verwerfungsbereiches beim $z$-Test gehen wir von einem wahren (aber unbekannten) Wert $\mu$ aus mit einer bekannten Standardabweichung.

```{.R .numberLines}
qnorm(p=c(0.025, 0.975), mean= 5, sd =2)
## 1.080072 8.919928
```

In obiger Ausgabe sehen wir das **Vertrauensintervall**. In diesem Intervall liegt mit bestimmter Wahrscheinlichkeit der **wahre** Mittelwert. Liegt nun $\bar{x}_n$ im Vertrauenintervall, wird $H_0$ nicht verworfen. Liegt der Mittelwert ausserhalb, wird $H_0$ verworfen.

Dies ist eine weitere Möglichkeit für einen Testentscheid. `R` gibt das Vertrauenintervall auch im $t$-Test als **confidence interval** aus. Dieses besagt, dass bei einem Signifikanzniveau von 5% das wahre $\mu$ zu 95% in diesem Intervall liegt. Je schmaler das Vertrauensintervall ist, umso sicherer sind wir, wo sich der wahre Mittelwert befindet. Bei einem grossen Intervall besteht eine grosse Unsicherheit wo das wahre $\mu$ liegt.

## Der Wilcoxon-Test
Der Wilcoxon-Test ist eine Alternative zum $t$-Test, setzt dabei aber weniger voraus. Er wird vorallem bei **nicht-normalverteilten** Daten eingesetzt. Grundsätzlich hat er die grössere *Macht*. Macht ist die Wahrscheinlichkeit, dass die Nullhypothese richtigerweise verworfen wird. Einzige Voraussetzung bei einem Wolcoxon-Test ist dass die Verteilung unter der Nullhypothese *symmertrisch* bezüglich $\mu_0$ ist.

Der Test berechnte den $V$-Wert, der die sogenannte *Rangsumme* repräsentiert. Ist der $V$-Wert zu weit weg vom Median, wird die Nullhypothese verworfen, ansonsten beibehalten.

## Statistische Tests bei zwei Stichproben
Wird ein Vergleich zwischen zwei Proben gemacht spricht man von gepaarten und ungepaarten Stichproben.

### Gepaarte Stichproben
Um eine gepaarte Stichprobe zu sein müssen folgende Voraussetzungen gelten:

* beide Versuchsbedingungen müssen an derselben Versuchseinheit eingesetzt werden
* jeder Versuchseinheit aus der einen Gruppe kann genau eine Versuchseinheit aus der anderen Grupper zugeordnet werden
* die Stichprobengrösse $n$ ist für beide Versuchsbedingungen dieselbe
* $x_i$ und $y_i$ sind abhängig, weil die Werte von der gleichen Versuchseinheit kommen

#### Beispiele gepaarte Stichproben

* Messung vor und nach einem Ereignis
* Zwei Messungen vom selben Punkt/Objekt (Zuordnung ist eindeutig)

#### Statistischer Test für gepaarte Stichproben
Bei der Analyse arbeitet man mit den Differenzen innerhalb der Paare $d_i=x_i-y_i (i=1,...,n)$ welche wir als Zufallsvariablen $D_1,...,D_n$ auffassen. **Kein** Unterschied zwischen den beiden Versuchsbedingungen heisst dann einfach $E[\,D_i]\,=0$. Falls die Daten normalverteilt sind eignet sich ein $t$-Test, sonst Wilcoxon-Test. Bei beiden Tests kann für eine gepaarte Stichprobe die Option `paired=TRUE` mitgegeben werden.

**Hinweise**

* man kann auf die Differenzen $d_i$ berechnen und dann den Test durchführen
* das erste Argument im Funktionsaufruf bezieht sich auf das **nachher**, das zweite auf die Messung **vorher**

### Ungepaarte Stichproben
Oft kann nicht jede Messung einer Messung aus der zweiten Gruppe eindeutig zuordnen. Dann spricht man von einer **ungepaarten** Stichprobe. Im Allgemeinen ist die Anzahl der Messungen beider Gruppen unterschiedlich (muss aber nicht). Entscheidend ist dass $x_i$ und $y_i$ zu verschiedenen Versuchseinheiten gehören und unabhängig angenommen werden.

#### Beispiele für ungepaarte Stichproben

* Messung wird nacheinander von zwei versch. Geräten gemacht (nicht gleichzeitig)
* verschieden lange Messreihen
* Zufällige Zuordnung in zwei Gruppen

## Tests mit `R` bei zwei Stichproben
Folgende Parameter können bei $t$-Test oder Wilcoxon-Test mitgegeben werden:

* `x`: erste Messreihe (nachher)
* `y`: zweite Messreihe (vorher)
* `alternative=`: `"less"`, `"greater"` oder `"two.sided"` als Varianten, je nach Test
* `mu=`: gibt an welcher Unterschied in den Mittelwerten der beiden Gruppen getestet werden soll. Wenn Test prüfen soll ob Gruppenmittelwerte gleich, dann `mu=0`
* `paired=`: `TRUE` oder `FALSE` für gepaarte/ungepaarte Messreihen
* `conf.level=`: definiert Vertrauenintervall - default `0.05`

