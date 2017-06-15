# VHDL

Il **VHDL** (*VHSIC Hardware Description Language*, dove *VHSIC* è l'acronimo di di *Very High Speed Integrated Circuits*) **è un linguaggio descrittivo** che permette di modellare circuiti logici digitali come un insieme di **blocchi funzionali**, o *design units*, ed **interazioni** tra questi. Un blocco funzionale è un circuito digitale che adempie ad un certo scopo (ad esempio una porta logica od un contatore) e può essere descritto in vari modi o *paradigmi*. Le interazoni, a loro volta, sono esenzialmente segnali di controllo e di dati scambiati tra i vari blocchi funzionali.

Una volta descritto un **compilatore**, o *synthesizer*, traduce la dichiarazione in una schema elettronico fisico, creato in base all'hardware che si sta programmando (ad esempio per implementarlo in un FPGA saranno usate le porte da lui fornite).

## Sintassi di base

La sintassi VHDL ha queste caratteristiche:

- **non è case sensitive**;
- **non è white-spaces sensitive;**
- **non richiede utilizzo di parentesi**, ma è consigliabile metterle per aumentare la leggibilità del codice;
- **ogni istruzione è terminata da un** `;`;

### Commenti

```vhdl
-- This next section of code is used to blah-blah
-- There is no other way to write comment block than write multiple lines starting with "--"
PS_reg <= NS_reg; -- Example of function block logic declaration
```

### Identificatori

Un identificatore è il **nome** associato ad un oggetto VHDL (ad esempio una variable).

Un identificatore è valido quando:

- **non è una parola del linguaggio**;
- è **composto soltanto da lettere, numeri e underscores **`_`. L'identificatore può iniziare solo con una lettera e non si possono usare multipli underscore consecutivi.

### Librerie

Il VHDL è un linguaggio estendibile attraverso librerie, come i normali linguaggi di programmazione. Ci sono librerie per moltissime applicazioni, ad esempio per il protocollo USB o per animazioni grafiche su monitor VGA.

Ogni libreria pù contenere uno o più **package**, permettendo così di *importarle anche solo in parte*. Segue un esempio di import:

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;
```

Essendo VHDL un linguaggio sviluppato dalla [IEEE](https://www.ieee.org/index.html), la libreria che che contiene i costrutti delle strandardizzazioni del linguaggio è la libreria `IEEE`. Attenzione che la libreria contiene anche package *non standard*!

`use libreria.package[.subpackage]` indica quale package una certa libreria si vuole includere nel progetto. `all` è una keyword che indica **qualsiasi package**.

## Blocchi funzionali

Per descrivere un blocco funzionale si utilizza l'approccio *black-box*. Questo approccio coinsiste nel dividere la dichiarazione del blocco funzionale in:

- **entity**: si descrivono gli **input** ed **output** che il blocco mette a disposizione, ignorando come sia stata implementata la logica, proprio come se si stesse parlando di una black-box;
- **architecture**: descrive la logica del blocco. Questa è la parte più algoritmica della dichiarazione.

### Entity

Segue un esempio di progamma VHDL contenente soltanto la dichiarazione del circuito in figura come unica entity:

![Circuito my_circuit, la cui funzione è $\overline{L} \cdot \overline{M} \cdot N + L \cdot M$](immagini/vhdl_my_circuit.svg)

```vhdl
-- libraries
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration
entity my_circuit is -- my_circuit is the entity name
port (
  L,M,N : in std_logic;	-- ports declaration
  F3 : out std_logic
);
end my_circuit;
```

La parte saliente è la descrizione delle **porte** del blocco, che in VHDL sono equiparate ai [segnali pubblici](#data-object-e-data-type) (la porta non è altro che il pin da cui si legge o scrive un segnale).

### Architecture

Ogni architecture ha un **nome** associato: questo permette di associare **molteplici architecture** ad una unica entity, quindi più logiche per un circuito. Non è possibile il contrario, cioè che una architecture sia associata a più entity.

VHDL definisce 3 tipi di **architecture declaration modes** o *paradigmi dichiarativi*:

- [**behavioural**](behavioural.md) o *comportamentale*: si descrive il **comportamento** osservabile dall'esterno **di un'entity** con un algoritmo le cui istruzioni sono eseguite l'una dopo l'altra, come un qualsiasi linguaggio di programmazione sequenziale;
- [**dataflow**](dataflow.md): la logica di una entity è descritto con una serie di flussi di dati, cioè **relazioni tra segnali**;
- [**structural**](structural.md) o *strutturale*: permette semplicemente di specificare **relazioni tra entity**. Non permette quindi di specificare funzioni logiche di basso livello, ma solo collegare le porte di una entity a quelle di un'altra.

Segue una possibile architecture per l'entity *my_circuit* descritta sopra:

```vhdl
-- architecture
architecture my_circuit_arc of my_circuit is -- my_circuit_arc is the architecture name
  -- intermediate signals
  signal A_out, B_out, buffer : std_logic;
begin
  -- data flow CSs
  A_out <= (not L) and (not M) and N; -- A gate description
  B: process (M, N) is -- B gate description
    -- behavioural SSs
    buffer <= M and N;
    B_out <= buffer;
  end process
  F3 <= A_out and B_out; -- C gate description
end my_circuit_arc;
```

Si noti che questa non è assolutamente la migliore dichiarazione dell'architecture, in quanto si sarebbero potuti usare solo costruitti behavioural, ma permette di vedere i vari declaration modes visti in precedenza. 

Sempre dall'esempio si può notare che la dichiarazione di una architecture è un insieme di **descrizioni di comportamento** dei componenti di un circuito, chiamati [Concurrent Statement o CS](dataflow.md), quindi alla radice l'architecture è dichiarato con il paradigma **dataflow**. Anche un `process` è un CS, ma è composto da più istruzioni sequenziali ognuna dei quali è un [Sequental Statement o SS](behavioural.md), quindi è dichiarato secondo il paradigma **behavioural**.

Molto importante è **frammentare** la logica che si deve scrivere in una sorta di *dispositivi minimi* (esempio: porte, registri, flipflop, ...) ed utilizzare, per ognuno, il paradigma più adatto alla sua dichiarazione. L'errore che si fa spesso è descrivere tutto il circuito con il paradigma behavioural, ma questo non permetterebbe di sfruttare la **concorrenzialità intrinseca** del linguaggio. Nel circuito risultante dalla compilazione del programma VHDL ad ogni blocco funzionale corrisponde una porzione a se stante di circuito, collegata agli altri blocchi come indicato dalle interazioni. Si deduce quindi che tutti i blocchi funzionali saranno eseguiti parallelamente tra loro e per questo è consigliabile suddividere il circuito il più possibile.

I vari declaration modes possono essere comparati secondo questi aspetti:

- **espressività**: il behavioural è utilizzato quando è difficile descrivere in circuito con blocchi funzionali e relazioni, e quindi ci si affida al synthesizer per la traduzione in circuito;
- **astrazione**: behavioural è il paradigma che più astrae la descrizione dell'hardware, mentre dataflow o structural sono a livello molto più basso.

Da entrambi i confroti si deduce che il paradigma behavioural non permette di avere molto controllo sull'ottimizzazione del circuito, per cui il circuito risultante dalla compilazione potrebbe risultare più complesso di un circuito descritto soltanto con gli altri paradigmi.

## Data object e data type

I data object sono i tipi di **oggetti** che è possibile dichiarare in un programma VHDL. Ogni tipo di oggetto contiene dei dati di un certo **data type** o *tipo di dato* e le modalità in cui saranno dsponibili sono definite dal tipo di oggetto.

### Data object

I data object previsti dal linguaggio VHDL sono:

- **signal** o *segnale*;
- **variable**: ha lo stesso scopo delle variabili di un qualsiasi linguaggio di programmazione, serve ad **immagazzinare dati** localmente;
- **constant**: come nei linguaggi di programmazione, per costant si intende una **variable immutabile** o un valore hard-coded;
- **file**.

#### Signal

La caratteristica fondamentale di un signal, che lo rende differente da una variable, è che ad un signal non si assegna un valore, ma lo si associa ad una espressione che indica il suo valore in funzione di altri segnali o costanti, similarmente a quanto accade in un linguaggio funzionale. Si deduce che il suo valore non sarà sempre lo stesso e non si è consapevoli di quando il segnale assumerà un certo valore; per questo non sono adatti ad immagazzinare dati.

Ci sono più tipi di segnali:

- **pubblici**: possono essere di input (`in`), output (`out`) od entrambe (`inout`). Sono utilizzabili da altre entity per comunicare con l'entity in oggetto. Sono dichiarabili solo nel blocco entity ed utilizzabili solo a destra di un assegnamento se di input, a sinistra se di output;
- **locali**: utilizzati per collegare i [Concurrent Signal Assignment o CSA](dataflow.md) interni al programma. Dichiarabili solo nell'architecture, non hanno una keyword per specificarne il tipo, in quanto i segnali locali ad una architecture sono tutti sia di input che di output, ma non verso l'esterno dell'entity;

I segnali sono dichiarati secondo la sintassi `signal_name : [signal_type] data_type`.

- `signal_type`: indica il tipo di segnale;
- `data_type`: indica il tipo di dato trasmesso da quel segnale.

L'assegnazione di un valore segue la sintassi `target <= expression` ed assume un funzionamento diverso in base alla **declaration mode** del CS in oggetto.

- `target`: segnale obiettivo dell'istruzione;
- `expression`: un'**[espressione](#espressioni)** di altri signal o costanti.

#### Variable

Sono dichiarabili solo in costrutti con declaration mode **behavioural**.

Sono dichiarati secondo la sintassi `variable variable_name : integer`. ==TODO==: forse al posto di integer ci va datatype.

L'assegnamento di un valore ad una variabile segue la sintassi `variable_name := value`.

### Data type

I data type previsti da una delle ultime standardizzazioni, la *IEEE 1164*, sono raccolte nel package `IEEE.std_logic_1164` e sono:

- `std_logic`: può assumere i valori `0`, `1`, `U`, `X`, `Z`, `W`, `L`, `H`, `-`. Sono stati previsti così tanti valori per poter riconoscere altri segnali oltre ai semplici valori digitali. Un valore di questo tipo va indicato tra apici (esempio: `'Z'`);

- `std_logic_vector` o *bundles*: indica che il segnale è composto da words di `std_logic`. La sintassi di dichiarazione è: `std_logic_vector(indice_primo_bit ordine indice_ultimo_bit)` (esempio: `std_logic_vector(0 to 7) data`).
  - `indice_primo_bit` e `indice_secondo_bit`: indicano l'indice (numero identificativo) del primo ed ultimo bit della parola del segnale. La differenza tra i due indici è la lunghezza della word;
  - `ordine`: può assumere i valori `to` o `downto` e dichiarano se il bit più significativo sia, rispettivamente, quello indicato dal primo o dal secondo indice.
  
  Il valore di un `std_logic_vector` può essere indicato secondo le segenti sintassi:

  - `"un_carattere_per_ogni_bit"` per indicare il valore di tutta la word in un'unica volta (esempio: `data := "10UX1-H0"`);
  - `nome_vector(index_carattere) assegnamento` per modificare soltanto una posizione della word (esempio: `data(3) := '1'`).

- `bit`: può assumere soltanto `0` ed `1`.


VHDL permette anche di dichiarare **data type personalizzati**.


## Espressioni

==TODO==

Miscuglio di data object ed operatori AND, OR (shortand: `|`), NAND, NOR, XOR, XNOR, NOT

`&` è l'operatore di concatenazione, con cui possono essere uniti, ad esempio, due std_logic_vector in uno unico.

### Condizioni

Le condizioni sono espesse secondo la seguente sintassi: ``.

There are actually six different relational operators available in VHDL. Two of the more common
relational operators are the “=” and “/=” relational operators which
are the “is equal to” and the “is not equal to” operators, respectively.
Operators are discussed at greater length in further sections