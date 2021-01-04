# Normalverteilung

## Stetige Zufallsvariable und Wahrscheinlichkeitsverteilungen

Der Unterschied einer *stetigen* und *diskreten* Zufallsvariable besteht darin, dass die stetige *jeden* Wert eines bestimmten Bereiches annehmen. Diskrete hingegeben aus einer definierten und endlicher Menge (z.B. von 0 bis 100, jeweils ganze Zahlen). Wichtig auch, es kann kein Wert zwischen zwei Werten aus einer Wertemenge ausgewählt werden. Dabei gilt:

* die Variable $X$ ist eine Funktion
* die Variable $x$ ist ein konkreter Wert (*Realisierung*) von $X$

### Stetige Verteilungen

Stetig sind die Verteilungen wenn keine Lücken in einem Bereich vorhanden sind. Die jeweilige Wahrscheinlichkeit ist $P(X=x) = 0$. Diese werden *Punktwahrscheinlichkeiten* genannt. Diese Wahrscheinlichkeit bringt uns aber nicht weiter. Weshalb wird die Wahrscheinlichkeit zwischen zwei Punkten berechnen. Dazu wird das Konzept der *Wahrscheinlichkeitsdichte* angewendet.

### Wahrscheinlichkeitsdichte

Wahrscheinlichkeitsdichten können unter der Berücksichtigung folgender Einschränkungen fast beliebig aussehen. Relevant für uns sind aber lediglich die Normalverteilung und die dazu verwandte $t$-Verteilung.

#### Eigenschaften Wahrscheinlichkeitsdichte

Für eine Wahrscheinlichkeitsdichte $f(x)$ gelten folgende Eigenschaften:

* es gilt $f(x) \geq 0 \longrightarrow$ Kurve auf oder oberhalb der x-Achse
* die Wahrscheinlichkeit $P(a < X \leq b)$ entspricht der Fläche zwischen $a$ und $b$ unter $f(x)$
* die gesamte Fläche unter der Kurve ist 1 $\longrightarrow$ W'keit dass *irgendein* Wert gemessen wird.

![Dichte einer Zufallsvariable und der Wahrscheinlichkeit in ein Intervall $(a,b)$ zu fallen (grüne Fläche)](dichte_zv.png){width=60%}

Bei stetigen Wahrscheinlichkeitsverteilungen entsprechen Wahrscheinlichkeiten den Flächen unter der Dichtefunktion.

### Quantile

Bei stetigen Verteilungen ist das $\alpha$-Quantil $q_\alpha$ derjenige Wert, wo die Fläche unter der Dichtefunktion von $-\infty$ bis $q_\alpha$ gerade $\alpha$ entspricht. Das 50%-Quantil heisst der *Median*.

![Quantil $q_\alpha$ anhand der Dichte $f(x)$ für $\alpha = 0.75$](quantil.png){width=60%}

Dies bedeuetet, dass 75% einer Menge maximal diese Messgrösse erreichen.

### Kennzahlen von stetigen Verteilungen

Der Erwartungswert $E(X)$ und die Standardabweichung $\sigma_X$ werden gleich wie im diskreten Fall interpertiert:

* $E(X)$ beschreibt die mittlere Lage der Verteilung
* $\sigma_X$ beschreibt die Streuung der Verteilung um den Erwartungswert

Im stetigen Fall, sind die beiden Funktionen aber mit Integralen statt Summen definiert.

## Normalverteilung (Gaussverteilung)

Die *Normalverteilung* ist die häufigste Verteilung für Messwerte und spielt vor allem für Durchschnitte von Messwerten eine wichtige Rolle. Wichtigte Wahrscheinlichkeitsverteilung in der Statistik.

**Normalverteilung**
$$f(x) = \frac{1}{\sigma \sqrt{2 \pi}}exp(-\frac{(x - \mu)^2}{2\sigma^2})$$

Es ist folgende Schreibweise für die Verteilung einer normalverteilten Zufallsvariable $X$ mit Parameter $\mu$ und $\sigma$ zu verwenden:
$$X \sim \mathcal{N} (\mu, \sigma^2)$$

* $E(X) = \mu$
* $Var(X) = \sigma^2$
* $\sigma_X = \sigma$

Die bedeutet, dass die Parameter $\mu$ und $\sigma^2$ eine natürliche Interpretation als Erwartungswert und Varianz einer Verteilung haben.

### Graphische Darstellung der Normalverteilung

Alle Normalverteilungskurven haben folgende Eigenschaften:

* Die Kurven sehen aus wie "Glocken", weswegen man auch von *Glockenkurven* spricht
* Die Wahrscheinlichkeitsdichtefunktion der Normalverteilung ist symmetrisch um den Erwartungswert $\mu$
* Der Parameter $\mu$ verschiebt den Graphen um $\mu$-Einheiten nach links $(\mu < 0)$ oder nach rechts $(\mu > 0)$
* Je grösser $\sigma$, desto flacher bzw. breiter wird die Dichtekurve. Je näher bei 0, wird die Kurve umso spitzer.

Der Grund dafür, weil $\sigma$ die Streuung um den Erwartungswert $\mu$ angibt. Je grösser $\sigma$ um so mehr sind die Werte um den Erwartungswert $\mu$ verteilt, die Kurve wird also breiter. Ist $\sigma$ nahe bei 0, so weichen die Werte wenig von $\mu$ ab, die Kurve wird schmaler und höher.

#### Wahrscheinlichkeiten mit `R`

```{.r .numberLines}
pnorm(q = 130, mean = 100, sd = 15)
## [1] 0.9772499
```

Dieser Befehl ermittelt die Fläche (Wahrscheinlichkeit von $-\infty$ bis $q=130$ unter der Normalverteilungskurve mit $\mu = 100$ und $\sigma = 15$

```{.r .numberLines}
qnorm(p = c(0.025, 0.975), mean = 100, sd = 15)
## [1] 70.60054 129.39946
```

`qnorm()` bestimmt die Quantile für die Normalverteilung. Bei diesem Beispiel haben wir den Wertebereich von 95% aller Beobachtungen eruiert. Diese liegen zwischen 70 bis 130.

> Ist eine Zufallsvariable normalverteilt, so liegen etwa zwei Drittel aller Messerte etwa eine Standardabweichung um den Erwartungswert.

Für *alle* Normalverteilungen $\mathcal{N}(\mu, \sigma^2)$ gilt, dass die Wahrscheinlichkeit, dass eine Beobachtung höchstens *eine* Standardabweichung vom Erwartungswert abweicht, ist etwa $\frac{2}{3}$:
$$P(\mu - \sigma \leq X \leq \mu + \sigma) \approx \frac{2}{3}$$

Die Wahrscheinlichkeit, dass eine Beobachtung höchstens *zwei* Standardabweichungen vom Erwartungswert abweicht ist:
$$P(\mu - 2 \sigma \leq X \leq \mu +2 \sigma) \approx 0.95$$

Aus diesen beiden Wahrscheinlichkeiten lassen sich auch als Flächen interpretieren. Die Fläche der Normalverteilung über dem Intervall $[\,\mu - \sigma, \mu + \sigma ]\,$ ist ca. $\frac{2}{3}$. Die Flöche über dem Intervall $[\, \mu - 2\sigma, \mu +2 \sigma ]\,$ ist ca. $0.95$.

### Standardnormalverteilung

Die Normalverteilung $\mathcal{N}(0,1)$ mit Mittelwert 0 und Standardweichung 1 heisst *Standardnormalverteilung*. Falls $X \sim \mathcal{N} (\mu, \sigma^2)$, so ist die standardisierte Zufallsvariable wieder normalverteilt, hat nun aber den Erwartungswert 0 und die Varianz 1. Man erhält also die Standardnormalverteilung:
$$Z= \frac{Z - \mu}{\sigma} \sim \mathcal{N}(0,1)$$
