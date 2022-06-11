# Multiple lineare Regression
Die einfache lineare Regression ist ein nützliches Vorgehen, um eine Vorhersage einer einzelnen erklärenden Variable zu treffen. Allerdings hängt die Vorhersage in der Praxis meist von mehr als einer erklärenden Variable ab. Man könnte die Vorhersage mit drei separate linearen Regressionen treffen. Allerdings ist dann nicht klar, wie eine geeignte Vorhersage für die drei erkärenden Variablen auszusehen hat, weil jeweils der Input durch eine andere Regressionsgleichung mit der Zielvariable verknüpft ist. Zweitens ignoriert jede der Regressionsgleichungen die anderen erklärenden Variablen zur Bestimmung der Regressionskoeffizienten. Die führt zu irreführenden Schätzungen der Wirkung der erklärenden Variablen.

Um dies zu umgehen empfiehlt es sich die einfache lineare Regression mit allen erklärenden Variablen zu erweitern. Allgemein gehen wir davon aus, dass wir $p$ verschiedene erklärenden Variablen haben. Daraus ergibt sich die Form für das *multiple lineare Regressionsmodell*:
$$Y=\beta_0+\beta_1X_1+\beta_2X_2+...+\beta_pX_p+\varepsilon$$

## Graphische Interpretation
Die graphische Interpretation entfällt bei multipler linearen Regression vollends, da wir mehr als zwei Variablen haben und so nicht in einem Koordinatennetz dargestellt werden können. Pro Variable wäre eine Achse nötig.

![Datenpunkte im Raum mit zwei erklärenden Variablen](multiLinReg.png){width=60%}

Analog zum einfachen linearen Regressionsmodell wird hier einfach eine *Ebene* gesucht, die am «besten» zu den Datenpunkten passt.

## Koeffizienten mit `R`
Um die Koeffizienten $\hat{\beta}_0, \hat{\beta}_1$ und $\hat{\beta}_p$ zu schätzen, kann folgender `R`-Befehl verwendet werden. Beachte das hinzufügen der weiteren erklärenden Variable mit *+*.

```R
coef(lm(y~x+z))
```

Um die multiple lineare Regression auszuführen verwenden wir den Befehl

```R
summary(lm(y~x+z))
```

Es ist möglich, dass sich eine Grösse mit fremden Lorbeeren schmückt. Wobei wir entsprechend den $p$-Wert genau prüfen, ob die Grösse signifikanten Einfluss auf das Ergebnis hat. Es kann nämlich sein, dass bei der Evaluation einer einzelnen Variable eine Steigung der Gerade resultiert, diese aber eigentlich nicht von dieser Variable, sondern einer anderen die nicht im Modell betrachtet wird, ausgeht. Dies heisst, man muss bei der Interpretation genau aufpassen und die Aussage der Daten überdenken (Beipsiel mit TV, Radio, Zeitung).

## Wichtige Fragestellungen
Bei der Durchführung einer multiple linearen Regression, möchten wir folgende Fragen beantworten:

1. Ist mindestens eine der erklärenden Variablen nützlich, um die Zielgrösse vorherzusagen?
1. Spielen alle erklärenden Variablen für die Vorhersage von $Y$ eine Rolle, oder ist es nur eine Teilmenge?
1. Wie gut passt das Modell zu den Daten?
1. Welche Zielgrösse können wir aufgrund konkreter Werte der erklärenden Variablen vorhersagen und wie genau ist diese Vorhersage?

### Zusammenhang zwischen erklärenden Variablen und der Zielgrösse
Bei der multiplen linearen Regression mit $p$ erklärenden Variablen müssen wir uns fragen ob *alle* Regressionskoeffizienten ausser $\beta_0$ Null sind. Wie bei der einfachen linearen Regression verwenden wir dazu einen Hypothesentest und testen die Nullhypothese
$$H_0: \beta_1=\beta_2=...=\beta_p=0$$
gegen die Alternativhypothese
$$H_A: \text{min. ein } \beta_i \neq 0$$

Bei dem Hypothesentest wird die *$F$-Statistik* und ein $F$-Wert berechnet. Ist dieser «weit» weg von 0, wird die Nullhypothese verworfen. Anhand des $F$-Wertes wird auch ein $p$-Wert berechnet. Damit wird der Testentscheid getroffen.

```R
summary(lm(y~x+z))
```

Obiger Befehl liefert die $F$-Statistik unter *F-statistic*. Ist er grösser als 1 liefert er ein überzeugender Hinweis gegen die Nullhypothese. Die bedeutet, dass mindestens eine erklärende Variable Einfluss auf die Zielgrösse hat. Wie nahe der F-Wert sein muss, ist von $n$ und $p$ abhängig. Ist $n$ gross, kann $F$-Wert wenig grösser als 1 genügend starken Hinweis gegen $H_0$ sein. Wenn $n$ klein, muss $F$-Wert gross sein.

Auf Basis des $p$-Wertes können wir entscheiden, ob wir die Nullhypothese verwerfen oder nicht (muss unter Signifikanzniveau liegen). Damit ist mindestens eine erklärende Variable für die Zunahme der Zielgrösse verantwortlich.

Der $F$-Wert ist aber nur aussagekräftig bei wenigen $p$'s, so müssen zusätzlich die $t$-Werte der einzelnen Variablen betrachtet werden. Sind diese signifikant, haben auch nur diese Variablen Einfluss auf die Zielgrösse. Die $F$- und $p$-Wert ergeben dabei kein signifikantes Resultat.

### Passung des Modells zu den Daten
Wie beim einfachen linearen Modell deutet ein $R^2$-Wert nahe bei 1 an, dass ein grosses Anteil der Varianz in der Zielvariable  durch das Modell gut erklärt werden kann. Der Wert von $R^2$ nimmt mit der Anzahl Variablen zu, sogar dann, wenn diese keinen oder kaum Einfluss auf die Zielgrösse haben. Der Grund ist, weil die Anpassung an die Daten genauer wird. Bei unrevelanten Variablen ist die Zunahme aber *sehr klein*.

### Vorhersagen
Auf Basis des multiplen linearen Regressionsmodells können wir die Zielgrösse vorhersagen. Allerdings gibt es dabei *Ungewissheiten*, wie stark $Y$ von $\hat{Y}$ abweichen wird. Als Antwort darauf kann das *Prognoseintervall* berechnet werden. Dieses ist breiter als das Vertraueninstervall, weil es den Fehler in der Schätzung von $f(X_1,...X_p)$ (reduzibler Fehler) und die Unsicherheit, wie weit ein einzelner Punkt in der wahren Regressionsebene abweicht (irreduzibler Fehler), beinhaltet.

Vertrauensintervall (95%) für eine Zielgrösse mit `R` mit dem Einsatz von z. B. CHF $100000$ für x und CHF $20000$ für z.

```R
predict(lm(y~x+z), interval = "confidence", data.frame(x = 100, z = 20))
```

$$[\, lwr, upr ]\,$$

Die Interpretation lautet: 95% aller Intervalle dieser Form enthalten den wahren Wert in diesem Intervall. Wenn wir die Prognose in einem spezifischen Gebiet machen möchten, ersetzen wir im `R`-Befehl den Parameter `interval` mit *prediction*.

```R
predict(lm(y~x+z), interval = "prediction", data.frame(x = 100, z = 20))
```

Normalerweise ist dann der Progronsebereich wesentlich breiter. Dies widerspiegelt die grössere Unsicherheit in Bezug auf eine breite Anwendung gegenüber einer Anwendung in einem spezifischen Gebiet.

## Erweiterung des linearen Modells
Die Beziehung zwischen den erklärenden Variablen und der Zielgrösse beinhaltet im Standardregressionsmodell einschneidende Einschränkungen:

1. *Additivität*: Die Annahme hat den Effekt, dass eine Änderung einer erklärenden Variable unabhängig von den Werten der anderen erklärenden Variablen ist. Dies heisst, dass kein Synergieeffekt auf die andere Variable entsteht.
2. *Linearität*: Die Annahme hat den Effekt, dass die Veränderung der Zielvariable konstant ist, unabhängig der Änderung von $X_j$

In der Statistik spricht man dabei von einem *Interaktionseffekt*. Um das Modell zu erweitern, fügt man einen *Interaktionsterm* hinzu, welcher sich aus dem Produkt von $X_1$ und $X_2$ zusammensetzt. Dies resultiert im folgendem Modell
$$Y=\beta_0 + \beta_1X_1+\beta_2X_2+\beta_3X_1X_2+\varepsilon$$

Das Modell bleibt aber bestimmten Einschränkungen unterworfen. Sofern ein $X_j$ auf Null gesetzt wird, können Vorhersagen in einem Bereich gemacht werden, für welche das Modell nicht geeignet ist (unrealistisch). Dieses Problem wird als *Extrapolation* bezeichnet.

## Interpretation des Interaktionsterm
Die Koeffizienten für ein solches Modell können mit folgenden `R`-Befehl ausgegeben werden:

```R
summary(lm(y~x+z+x*z))
```

Sofern der $p$-Wert von $\beta_3$ unter dem Signifikanzniveaus liegt, deutet dies darauf hin, dass der wahre Zusammenhang nicht additiv ist. Das Modell, welches nur die *Haupteffekte* beinhaltet, ist dem erweiterten Modell unterlegen. Sofern alle $p$-Werte signifikant sind, können sie im Modell enthalten bleiben. Es ist allerdings auch möglich, dass die $p$-Werte der Haupteffekte nicht klein sind. Das *hierarchische Prinzip* besagt aber, dass falls ein Interaktionsterm im Modell vorhanden ist, dass dann auch deren Haupteffekte vorhanden sein sollten, auch wenn ihre $p$-Werte nicht klein sind.

## Qualitative erklärende Variablen
Erklärende Variablen sind nicht nur *quantitativ* sondern auch *qualitativ*. Zum Beispiel kann eine Variable *gender* nur spezifische Werte annehmen. Eine entsprechende Variable wird *Indikatorvariable* genannt. Nachfolgend die Geschlechtervariable mit zwei *Levels*:
$$x_i = \begin{cases}0, & \text{falls $i$te Person weiblich} \\
    1, & \text{falls $i$-te Person männlich}\end{cases}$$
Daraus resultiert folgendes Modell
$$y_i=\beta_0+\beta_1x_i+\varepsilon_i= \begin{cases}\beta_0+\beta_1+\varepsilon_i, & \text{falls $i$-te Person weiblich} \\
      \beta_0+\varepsilon_i, & \text{falls $i$-te Person männlich} \end{cases}$$
Die Kodierung (1,0/w,m) kann beliebig gewählt werden und hat keinen Einfluss auf das Regressionsmodell. Lediglich die Interpretation der Koeffizienten ist unterschiedlich. Die Anzahl Levels kann beliebig gewählt werden, es gibt aber folgendes zu beachten:

* Es gibt immer eine Indikatorvariable weniger, als es Levels hat
* Der Level ohne Indikatorvariable heisst auch *Baseline*
