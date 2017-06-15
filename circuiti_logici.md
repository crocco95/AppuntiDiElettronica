# Circuiti Logici

Per **circuito logico** si intende un circuito elettronico studiato per lavorare con *segnali digitali binari*, che quindi possono assumere soltanto due valori in tensione che sono associati, rispettivamente, allo $0$ ed $1$ logici.

Nei circuiti logici si è soliti associare ad un segnale logico una variabile booleana. Infatti il segnale logico può essere visto come una descrizione dei valori che una variabile booleana assume nel tempo. Si avrà quindi che il valore logico $0$ indica un valore booleano $falso$ ed il valore $1$ il valore $vero$.

# Porte logiche

In elettronica una **porta logica** o *logic gate* è un circuito logico in grado di **implementare** una particolare **operazione logica** su una o più variabili booleane in input.

In base al numero di input le porte logiche si possono classificare in:

- **porte a due o più variabili**: [AND](https://it.wikipedia.org/wiki/Algebra_Booleana#AND), [OR](https://it.wikipedia.org/wiki/Algebra_Booleana#OR), [XOR](https://it.wikipedia.org/wiki/Algebra_Booleana#XOR), [NOR](https://it.wikipedia.org/wiki/Algebra_Booleana#NOR), [NAND](https://it.wikipedia.org/wiki/Algebra_Booleana#NAND) e [XNOR](https://it.wikipedia.org/wiki/Algebra_Booleana#XNOR);
- **porte a singola variabile**: [NOT](https://it.wikipedia.org/wiki/Invertitore) e [BUFFER](https://it.wikipedia.org/wiki/Buffer_non_invertente).

In particolare le porte OR, AND e NOT costituiscono un **insieme funzionalmente completo**: attraverso gli operatori logici che implementano è possibile implementare qualsiasi funzione logica, anche complessa.

Le porte logiche possono essere implementate attraverso le **famiglie logiche**.

## Descrizione di porte e circuiti logici

Una porta logica presenta dei **pin**, cioè delle porte attraverso il quale è possibile fornire o leggere segnali. Nello specifico esistono:

- pin di **input**: per fornire un segnale alla porta. Nei circuiti sono indicati con le lettere dell'alfabeto, partendo dalla A;
- pin di **output**: per leggere il segnale risultante dall'elaborazione effettuata dalla porta. Nei circuiti sono indicati con le lettere dell'alfabeto, partendo dalla Q.

Nei circuiti logici ci sono delle **f.e.m** ben precise, che sono indicate come segue:

- $V_{CC}$ e $V_{DD}$: una alimentazione continua **positiva**. In caso di segnali digitali binari tale tensione potrebbe corrispondere al livello logico alto;
- $V_{EE}$ e $V_{SS}$: solitamente è il polo negativo del generatore di $V_{CC}$. In caso di segnali digitali binari tale tensione potrebbe corrispondere al livello logico basso.

# Famiglie logiche

Una **famiglia logica**, chiamata anche semplicemente *tecnologia*, è uno standard che indica come implementare elettronicalmente circuiti logici. In ordine cronologico le famiglie logiche che hanno riscosso più successo sono state:

- [**RTL**](https://en.wikipedia.org/wiki/Resistor-transistor_logic) o *resistor-transistor logic*;
- [**DTL**](https://en.wikipedia.org/wiki/Diode-transistor_logic) o *diode-transistor logic*;
- [**TTL**](https://en.wikipedia.org/wiki/Transistor-transistor_logic) o *transistor-transistor logic*;
- [**CMOS**](https://en.wikipedia.org/wiki/CMOS): è la più utilizzata al momento, le altre sono utilizzate solo per campi ben specifici. Ne esistono anche alcune variazioni e specializzazioni, con l'obiettivo di ottemperare ad alcuni suoi limiti tecnici.

## Caratteristiche

Come parametro di confronto tra famiglie logiche si considerano le relative implementazioni di una porta NOT. La porta NOT è considerata l'**unità** minima di una famiglia logica, in quanto è solitamente la porta logica più semplice da implementare. Ogni famiglia logica differisce per:

- quantità e tipi di **dispositivi elettronici** utilizzati. Ovviamente ogni componente o configurazione di questi potrebbe introdurre dei comportamenti parassiti che la famiglia logica potrebbe semplicemente presentare come propri limiti, oppure tentare di risolvere;
- le **tensioni** utilizzate per rappresentare i valori binari ed eventuali **margini di errore** tollerati.

In base a queste differenze ogni famiglia logica presenterà determinate caratteristiche, che la rendono più o meno adatta a certi utilizzi. Le caratteristiche di un circuito logico che risentono di tali differenze sono:

- **degradazione del segnale** elaborato dal circuito logico. Comprende:
  - **tempistiche** di commutazione del circuito, che comportano **ritardi** nell'esercizio;
  - **attenuazioni del segnale**, soprattutto diminuzione della differenza tra la tensione dei livelli logici ed introduzione di rumore;
- **complessità "media"** dei circuiti logici di una determinata famiglia logica. La si deduce dall'implementazione della porta NOT;
- **estensione** e **complessità massime** che un circuito logico può assumere;
- **consumi** statici e dinamici.

Nello specifico le tempistiche di un circuito logico sono:

- **tempi di salita e discesa**: indicano quanto tempo è necessario al segnale di output della porta per passare da un livello ad un altro, quindi indicano mediamente il tempo impiegato per variare il segnale in uscita. Nello specifico indicano il tempo che passa dalla variazione del 10% al 90% del segnale in uscita. Nella figura sono indicati come $t_f$ e $t_r$.
- **ritardo di commutazione**: tempo impiegato dalla porta logica a cambiare il suo stato a fronte di un cambiamento del suo input (ovviamente fa conto solo dei casi in cui ci debba essere una variazione). Si considera, solitamente, il tempo trascorso da metà della variazione della variazione del segnale in input $V_{in}$ a metà della variazione del segnale in output $V_{out}$. In figura sono indicati il ritardo di propagazione di una variazione in discesa $t_{pHL}$ e di una variazione in salita $t_{pLH}$, in quanto non è detto che tali tempistiche siano uguali.

![Tempistiche di un segnale digitale binario](immagini/porta_ritardo_commutazione.png)

Dalla figura si notano inoltre dei **margini di errore** tradizionali; solitamente tutte le variazioni $\le10\%$ sono considerate disturbi.

Soprattutto per quanto riguarda la degradazione del segnale si è deciso di introdurre due parametri che caratterizzano un circuito logico e che permettano, senza sapere nello specifico il funzionamento elettrico della famiglia logica, di comunicare i "limiti di utilizzo" del circuito senza che il segnale sia degradato fino a tal punto da perdere caratteristiche essenziali, quindi non essere più correttamente interpretabile. Tali parametri sono:

- **fan-in**: massimo numero di input del circuito logico. Se ne tiene conto solo durante la progettazione del circuito e non all'utilizzo, in quanto il circuito avrà già un preciso numero di ingressi disponibili;
- **fan-out**: massimo numero di circuiti logici, dello stesso tipo di quello considerato, che possono essere collegati al pin di output in parallelo tra loro. Ad esempio, il numero di porte AND CMOS che possono essere collegate al pin di output di una porta AND CMOS;

## Scaling con le tecnologie NAND e NOR

Dando una rapida occhiata alle implementazioni delle porte logiche per le varie famiglie logiche si nota che le porte logiche più piccole sono la porta NAND per alcune tecnologie, come la CMOS, e la NOR per altre. Si è quindi deciso di studiare l'implementare dei circuiti logici utilizzando soltanto NAND o soltanto NOR basandosi sui [teoremi di DeMorgan](https://it.wikipedia.org/wiki/Teoremi_di_De_Morgan) che recitano come segue:

$$\overline {A\cdot B}=\overline A+\overline B$$

$$\overline {A+B}=\overline {A}\cdot \overline {B}$$