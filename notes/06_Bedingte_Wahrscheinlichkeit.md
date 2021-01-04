# Bedingte Wahrscheinlichkeit

Die *bedingte Wahrscheinlichkeit* betrachtet nicht die gesamte Grundmenge, sondern nur einen Teil davon. Die neue Grundmenge in der Formel ist die Variable nach dem Längsstrich. Die bedingte Wahrscheinlichkeit bedeutet die Wahrscheinlichkeit von A unter der Voraussetung von B.

$$P(B|A) = \frac{P(A \cap B)}{P(A)}$$

Das wir wissen, dass B schon eingetreten ist, haben wir einen neuen Grundraum $\Omega' = B$. Damit müssen wir nur noch den Teil anschauen, der auch in $B$ auftritt (daher $A \cap B$). Dies muss dann noch in Relation zur Wahrscheinlichkeit von $B$ (neue Grundmenge) gesetzt werden.

## Rechenregeln der bedingten Wahrscheinlichkeit

![Rechenregeln der bedingten Wahrscheinlichkeit](rechenregeln_bedWahrscheinlichkeit.png){width=60%}

## Bayes Theorem und totale Wahrscheinlichkeit

### Bayes' Theorem

Das Theorem ist oft sehr nützlich. Es erlaubt uns die Wahrscheinlichkeit $P(A | B)$ zu berechnen, falls $P(B | A)$.

$$P(A|B) = \frac{P(B|A)*P(A)}{P(B)}$$

### Totale Wahrscheinlichkeit

Bei der totalen Wahrscheinlichkeit wird erst eine Menge $A$ in Menhen $A_1,...,A_k$ unterteilt, die untereinander keine Schnittmenge haben und zusammen (Vereinigung) die ganze Menge $A$ bilden. Dies wird *Partitionierung* genannt.

$$P(B)=P(B|A_1)*P(A_1)+...+P(B|A_k)*P(A_k)=\sum_{i=1}^k P(B|A_i)*P(A_i)$$
