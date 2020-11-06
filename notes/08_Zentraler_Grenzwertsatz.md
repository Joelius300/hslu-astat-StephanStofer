# Durchschnitte und Summen von Zufallsvariablen

Bisher haben wir lediglich untersucht, wie *eine* Zufallsvariable verteilt ist. In Vielen Anwendungen haben wir es mit *mehreren* Zufallsvariablen zu tun. Überlicherweise messen wir die *gleiche* Grösse mhermals und untersuchen, wie die Summe und der Durchschnitt von *mehreren* Zufallsvariablen verteilt sind.

Die Messungen bezeichnen wir mit $x_1, x_2,...,x_n$ und fassen diese als Realisierungen der Zufallsvariablen $X_1, X_2,...,X_n$ auf. Dies ist die Zufallsvariable für das *arithmetische Mittel*. Das arithmetische Mittel $\bar{x}_n$ ist also eine Realisierung der Zufallsvariablen $\bar{X}_n$.
$$\bar{X}_n=\frac{X_1 + X_2 +...+X_n}{n}=\frac{1}{100}\sum_{i=1}^{n}X_i$$
Analoges gilt für die *Summe* $S_n$:
$$S_n=X_1 +...+X_n = \sum_{i=1}^{n}X_i$$

## Unabhängigkeit und i.i.d. Annahme

Wir treffen oft die Annahme, dass die Zufallsvariablen *unabhängig* voneinander sind. Es gibt keine gemeinsamen Faktoren, die den Ausgang der verschiedenen Messungen beeinflussen. Damit ist gemeint, dass eine Messung keinen Einfluss auf das Resultat der nachfolgenden Messung hat. Als Beispiel für *nicht" unabhängige Zufallsvariablen die Temperaturmessung an benachbarten Sommertage. Die Tage werden ähnliche Temperaturen haben nicht 28°C und am nächsten -5°C.

Wenn die Zufallsvariablen $X_1,...,X_n$ unabhängig sind und alle *dieselbe* Verteilung haben, schreiben wir das kurz als
$$X_1,...,X_n$$ i.i.d.

Die Abkürzung i.i.d. steht für:  

**i**ndependent, **i**dentically, **d**istributed

> Sind Zufallsvariablen i.i.d., so wird dasselbe unter den gleichen Bedingungen gemessen.

Die Unabhängigkeit spielt insofern eine Rolle bei den *Regeln für Erwartungswerte und Varianzen* von Summen. Die Beziehung 
$$E(X_1+X_2)=E(X_1)+E(E_2)$$
gilt immer,
$$Var(X_1+X_2)=Var(X_1)+Var(X_2)$$
jedoch nur wenn $X_1$ und $X_2$ unabhängig sind.

## Kennzahlen von $S_n$ und $\bar{X}_n$

Wir nehmen an dass $X_1,...,X_n$ i.i.d. Wegen dem zweiten "i" in i.i.d. hat *jedes* $X_i$ dieselbe Verteilung und dieselben Kennzahlen.

### Varianz und Standardabweichung der Summe

Die Varianz und Standardabweichung nimmt mit zunehmender Anzahl Würfen zu. Je mehr Ereignisse, umso grösser wird der Wertebereich. Die Summen verteilen sich auf mehr Zahlen und damit nimmt auch die Streuung zu. Das Gesetzt für die Varianz und Standardabweichung der Summe lautet:
$$Var(S_{n})={n}Var(S_{n})$$
und für die Standardabweichung gilt 
$${\sigma}_{S_n}=\sqrt{{n}\sigma_X}$$

### Erwartungswert des Durchschnittes

Da wir gleichbleibende Ergebnisse erwarten, ob nun 2 oder 50 Experimente gemacht werden, entspricht der Durchschnitt in etwa dem Erwartungswert.

$$E(\bar{X}_n)=\mu$$

Für die Varianz und die Standardabweichung des Durchschnitts gilt folgendes Gesetz:

$$Var(\bar{X}_n=\frac{Var(X)}{n}$$

$${\sigma}_{\bar{X}_n}=\frac{\sigma_X}{\sqrt{n}}$$

Allgemein gilt:

![Regeln für die Kennzahlen von $S_n$ und $\bar{X}_n$](regeln_kennzahlen_S-X.png){width=70%}   

Die Standardabweichung der Summe wächst mit wachsendem $n$, aber langsamer als die Anzahl Beobachtungen $n$. Der Erwartungswert von $\bar{X}_n$ ist gleich demjenigen einer einzelnen Zufallsvariable $X_i$, die *Streeung nimmt jedoch mit wachsendem n ab*.

![Gesetzt der grossen Zahlen](gesetz-der-grossen-zahlen.png){width=70%}

![Standardfehler des arithmetischen Mittels](standardfehler.png){width=70%}

## Verteilungen von $S_n$ und $\bar{X}_n$

Die Verteilung der *Mittelwerte* $\bar{X}_n$ (oder auch der Summen) nähert sich mit wachsendem $n$ einer Normalverteilung an. Sind die $X_i$'s i.i.d., dann gilt der *Zentrale Grenzwertsatz*.

![Zentraler Grenzwertsatz](zentraler-grenzwertsatz.png){width=70%}

wobei die Approximation im allgemeinen besser wird mit grösserem $n$. Überdies ist die Approximation besser, je näher die Verteilung von $X_i$ bei der Normalverteilung $\mathcal{N}(\mu,\sigma_x^2)$ ist.

![4 Histogramme vom Durchschnitt von 16, 64, 256, 1024 Versuchen mit 1000 Ziehungen mit Dichtekurven](histogramm-grenzwertsatz.png){width=70%}


