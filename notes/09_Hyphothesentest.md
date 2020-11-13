# Hypothesentest für Messdaten

Mittels eines Hypothesentests wird eine Angabe (z.B Inhaltsmenge einer Pet-Flasche) überprüft ob diese wahr ist. Solche Tests sind stadardisiert und ist eine reproduzierbares Verfahren. Diese geben auch ein klares Kriterium an, wann ein Druchschnitt zu weit von einer Angabe entfernt ist.
Der Hypothesentest ist *nie* ein Beweis das eine Angabe wahr ist oder falsch, sonder lediglich ob die Angabe mit einer gewissen Wahrscheinlichkeit stimmt oder nicht.

## Statistische Tests und Vertrauensintervall für eine Stichprobe bei normalverteilten Daten

Messungen können wir als Realisierungen von unabhängigen, identisch verteilten Zufallsvariablen $X_i$ betrachten und die Kennzahlen $E(X_i)=\mu$ und $Var(X_i) = \sigma^2_X erfassen. Typischerweise sind diese (und andere) Kennzahlen *unbekannt*.Trotzdem möchten wir eine Aussage über das wahre, aber eben unbekannte $\mu$ und $\sigma^^$ machen.
Das Ziel ist es den Daten $\mu$ und $\sigma^2$ anzunähern und sprechen dabei von einer *Schätzung* der Parameter $\mu$ und $\sigma^2$. Geschätzte Werte werden mit einem $\hat$ bezeichnet $\hat{\mu}$.
Für die (Punkt-)Schätzungen für den Erwartungswert und Varianz gilt:
$$\hat{\mu}=\bar{X_n}=\frac{X_1+...+X_n}{n}=\frac{1}{n}\sum_{i=1}^nx_i$$
$$\hat{\sigma^2_X}=\frac{(X_1-\bar{X_n})^2+...+(X_1-\bar{X_n})^2}{n-1}=\frac{1}{n-1}\sum_{i=1}^n (X_i-\bar{X_n})^2$$

Beachte, dass $\hat{\mu}$ und $\hat{\sigma_{X}^2}$ selbst Zufallsvariablen sind und für jede neue Messung sich neue $\hat{\mu}$ und $\hat{\sigma_{X}^2}$ ergeben.
Obwohl im Allgmeinen $\hat{\mu}\ne \mu$ und $\hat{\sigma_{X}^2} \approx \sigma_{X}^2$ ist die Hoffnung dass $\hat{\mu}\ne \mu$ und $\hat{\sigma_{X}^2} \approx \sigma_{X}^2$ und damit annähert.

### Ziel des Hypothesentests

Das Ziel des Hypothesentests ist das feststellen ob der waare Mittelwert wahr
ist. Entstehen bei den Schätzungen grössere Standardabweichungen muss die Angabe
hinterfragt werden.

## Hypothesentest

Hypothesentests sind ein wichtiges statistisches Mittel um zu entscheiden, ob
eine Messreihe zu einer gewissen Grösse passt. Wir gehen davon aus, dass wir den
wahren Mittelwert *nicht* kennen, gehen aber von einem *Idealwert* oder einem
vermuteten Wert aus.

Unter der Annahme, dass die Daten normalverteilt sind, wird überprüft ob eine
Messreihe, unter der Annahme von $\mu=a$ (der Mittelwert) warhscheinlich ist
oder nicht.

### Modell
Eine Anuahl Messwertel sind die Realisierung der Zufallsvariablen $X_1,
X_2,...,X_n$, wobei $X_i$ eine kontinuierliche Messgrösse ist. Dabei soll
gelten:
$$X_1,...X_n {i.i.d.}\sim \mathcal{N}(\mu,\sigma_x^2)$$

### Nullhypothese
$$H_0: \mu = \mu_{0}=a$$

Die Nullhypothese ist eine Annahme über den wahren Mittelwert. Diese Annahme
wird mit dem Mittelwert $\hat{\mu}$ überprüft, ob er sich dem wahren Mittelwert
annähert.

### Alternativhypothese
$$H_A: \mu \neq \mu_{0}=a$$ oder
$$H_A < oder >$$
Wenn die Annahme nicht gleich $\mu$ ist

### Teststatistik
Es wird getestet, ob diese Verteilung mit der Annahme $\mu=a$ gerechtfertigt
ist. Oder Mathematisch: Die Verteilung der Teststatistik T unter Nullhypothese
$H_0$
$$T=\bar{H_n}/mathcal{N}(\mu,\frac{\sigma^2}{n})$$

Ist die Wahrscheinlichkeit kleiner als 2.5% ist sie zu klein und der 
Mittelwert zu unwahrscheinlich, als dieser zur Aussgangsgrösse a passen könnte.

![Normalverteilungskurve eines
Hypothesentests](normkurve-hypotest.png){width=70%}

Die *Abmachung*, dass die Grenze 2.5% gilt, kommt daher, dass der symmetrische
Teil um den Mittelwert 95% betragen soll.

### Signifikanzniveau $\alpha$
Das Signifikanzniveau $\alpha$ gibt an, wie hoch das Risiko ist, eine falsche
Entscheidung zu treffen. Normalerweise 0.05 bzw. 0.01.

### Verwerfungsbereich
Liegt der gemessene Mittelwert im roten Bereich (der Abbildung), so zweifelt man
an der Nullhypothese und *verwerfen* diese. Diese werden im einem Intervall
angegeben:
$$K=(-\infty,a-\alpha] \, \cup [ \, a+\alpha, \infty)$$

### p-Wert
Der P-Wert ist die Wahrscheinlichkeit, unter der Nullhypothese ein mindestens so extremes Ereignis (in Richtung der Alternative) zu beobachten wie das aktuell beobachtete.
Damit wird angedeutet, wie extrem das Ergebnis ist. Je kleiner der p-Wert desto
mehr spricht das Ergebnis gegen die Nullhypothese.

* 0: passt gar nicht
* 1: passt sehr gut

![Wahrscheinlichkeit unter Gültigkeit der Nullhypothese das erhaltene Ergebnis
oder ein extremeres zu erhalten](p-value.png)

### p-Wert und Statistischer Test
Bei einem vorgegebenen Signifikanzniveaus $\alpha$ gilt aufgrund der Definition
des p-Werts für einen einseitigen Test:

* Verwerfe $H_0$ falls p-Wert $\leq \alpha$
* Belasse $H_0$ falls p-Wert $> \alpha$

Computerprogramme liefern den Testentscheid nur mit p-Wert und *immer* auf
Signifikanzniveau an.

#### Signifikanz

* p-Wert $\approx 0.05 \implies$ schwach signifikant, "."
* p-Wert $\approx 0.01 \implies$ signifikant, "*"
* p-Wert $\approx 0.001 \implies$ stark signifikant, "**"
* p-Wert $\leq 10^{-4} \implies$ äusserst signifikant, "***"

## t-Test
Entgegen dem bisherigen Verfahren (z-Test) wo die Standardabweichung bekannt
ist, setzt der t-Test keine Standardabweichung voraus. Dies ist auch praktisch
kaum der Falls das SD vorliegt.

### t-Verteiltung
Die Verteilung der Teststatistik beim t-Test unter der Nullhypothese
$$H_0: \mu = \mu_0$$
ist gegeben durch
$$T=\bar{X_n}\sim T_{n-1}(\mu, \frac{\hat{\sigma_{X}}}{\sqrt{n}})$$
wobei $t_{n-1}$ eine Verteilung mit $n-1$ Freiheitsgraden ist.

Die Normalverteilung wird also durch t-Verteilung ersetzt. Gleicht aber
Normalverteilung, ist aber flacher, wegen der grösseren Unsicherheit. Dies hängt
von der Anzahl Beobachtungen ab.
