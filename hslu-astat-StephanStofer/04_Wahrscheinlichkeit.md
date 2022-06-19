# Wahrscheinlichkeit

## Wahrscheinlichkeitsmodelle

Wir verwenden oft Modelle um die Wahrscheinlichkeit zu bestimmen. Dazu treffen wir Annahmen (z. B. dass ein Würfel fair ist), die dann im Modell umgesetzt/berechnet werden. Mit Hilfe des Modells können wir dann auch untersuchen, ob dieser Würfel fair ist. Wenn wir einen Würfel wiederholt werfen und oft die Zahl 2 vorkommt, können wir annehmen, dass der Würfel nicht fair ist.

### Definition Wahrscheinlichkeitsmodelle

Wir betrachten *Zufallsexperimente*, bei denen der Ausgang *nicht exakt* vorhersagbar ist (z.B. # Anrufe in Callcenter). Das Wahrscheinlichkeitsmodell beschreibt grob welche Ergebnisse möglich sind und beinhaltet die Wahrscheinlichkeiten, wie die Ergebnisse eintreten können.

Das Wahrscheinlichkeitsmodell besteht aus folgenden Komponenten:

* *Grundraum* $\Omega$, der aus der Menge der *Elementarereignissen* $\omega$ besteht
* *Elementarereignisse* sind mögliche Ergebnisse oder Ausgänge des Experiments, die alle zusammen den Grundraum bilden.
* *Ergebnisse* $A, B, C,...$ als Teilmengen von $\Omega$
* *Wahrscheinlichkeiten* $P$, die zu den Ereignissen $A, B, C,...$ gehören

#### Grundraum, Elementarereignisse

Bei einem Experiment wird aus dem Grundraum *ein* Elementarereignis *zufällig* gewählt. Als Beispiel das Würfeln. Grundraum gegeben durch
$$
\Omega = \{1,2,3,4,5,6\}
$$

Element $\omega$ ist ein Elementarereignis und bedeutet, dass bei Würfeln die Zahl 2 geworfen wird.

#### Ereignis

Unter einem Ereignis versteht man eine Teilmenge von $\Omega$. Das Ereignis $A$ bedeutet, dass das Ergebnis $\omega$ des Experiments zu $A$ gehört.

Beispiel für ein Ereignis $A$: "eine ungerade Augenzahl würfeln", dann ist $A=\{1,3,5\}$ und tritt ein, wenn eine der drei Zahlen gewürfelt wird. Eine Leere Menge ist auch ein Ereignis $\{\} \subset \Omega$.

## Disjunkte Ereignisse

Zwei Ereignisse $A$ und $B$ heissen *disjunkt*, wenn sich $A$ und $B$ gegenseitig ausschliessen und nicht gemeinsam eintreten können. Dann gilt $$A \cap B = \{\}$$ Dieses Ereignis ist somit unmöglich.

## Axiome und Rechenregeln der Wahscheinlichkeitsrechnung

Die Wahrscheinlichkeitsrechnung baut auf die folgenden drei Grundregeln (Kolmogorov Axiome):

* A1: $P(A) \geq 0$
* A2: $P(\Omega) = 1$
* A3: $P(A \cup B) = P(A) + P(B)$ falls $A \cap B = \{\}$

### Rechenregeln

Für dieses Modul relevante Rechenregeln:

1. $P(\overline{A}) = 1 - P(A)$
2. $P(A \cup B) = P(A) + P(B) - P(A \cap B)$

Die zweite Regel für nicht diskjunkte Ereignisse. Die Schnittmenge wird doppelt gezählt, weshalb wir diese einmal abziehen müssen.

![Wahrscheinlichkeit für nicht disjunkte Ereignisse](venn_r2.png){width=30%}

## Diskrete Wahrscheinlichkeit

Mit diskret sind endliche und unendliche Mengen gemeint, welche ganzzahlige Elemente in $\Omega$ enthalten.

## Laplace Wahrscheinlichkeit
Beim *Modell von Laplace* wird für jedes Elementarereignis die gleiche Wahrscheinlichkeit angenommen. Um diese Wahrscheinlichkeit zu berechnen, zählen wir die Anzahl der *günstigen* Elemtentarereignisse, durch die Anzahl der *möglichen* Elementarereignisse.
Wenn alle Ereignisse $E$ gleich wahrscheinlich sind, ist das Eintreten des Ereignisses $E$ nach dem Laplace-Modell:
$$
P(E) = \frac{\lvert E \rvert}{\lvert \Omega \rvert}
$$

## Der Begriff der Unabhängigkeit
Hat der Ausgang von Ereignis $A$ keinen Einfluss auf den Ausgang des Ereignisses $B$, sind die Ereignisse $A$ und $B$ stochastisch unabhängig. Dann gilt
$$
P(A \cap B) = P(A) * P(B)
$$

Als Beispiel: $A$ sei mit einem fairen Würfel eine eis oder zwei zu würfeln und Ereignis $B$ sei Kopf beim Werfen einer fairen Münze. Weil die beiden Ereignisse keinen Einfluss aufeinander haben gilt obige Formel.

Sind Ereignisse *nicht* stochastisch unabhängig, gibt es keine allgemeine Formel für die Brechnung der Wahrscheinlichkeit von zwei Ereignissen.
