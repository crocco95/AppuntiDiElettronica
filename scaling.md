# Scaling

Per scaling si intende tutto quello che concerne il **rimpicciolimento dei dispositivi elettronici**, sia di dimensioni che nella disposizione sulla PCB così da occupare meno spazio. Ovviamente ha vantaggi come l'abbattimento dei costi, dei consumi e l'ingombro, ma può inasprire dei limiti di utilizzo delle componenti, dovuti dalle caratteristiche fisiche dei materiali, o creare problematiche come nuovi fenomeni parassiti.

Lo scaling risulta utile sopratutto nei passaggi da vecchie a nuove tecnologie. Le nuove tecnologie solitamente richiedono più componenti, quindi più potenza di alimentazione, da dissipare e maggiori dimensioni: fare scaling permette di diminuire tutti questi fattori, tornando ipoteticamente alle richieste delle vecchie tecnologie, se non abbassandole ancora di più.

Le problematiche più comuni a tutti i dispositivi sottoposti a scaling sono:

- **effetto Joule**: diminuendo le dimensioni si ha una minore superfice per la dissipazione del calore, quindi occorre verificare se è possibile diminuire la potenza di lavoro;
- **capacità ed induttanze parassite**: diminuendo le dimensioni le componenti si avvicinano tra di loro e si possono creare aree in cui il materiale che separa i dispositivi è così poco da agire come dielettrico tra le componenti, oppure le onde magnetiche sprigionate da un componente potrebbero creare tensioni parassite nei componenti vicini. Un metodo per risolverle potrebbe essere la schermatura.

Le problematiche dello scaling sono molto legate alla **potenza di esercizio** delle componenti: più questa sarà bassa, più le problematiche si affievoliranno.

Per valutare la potenza di alimentazione di un componente elettronico in un circuito digitale, che sarà quindi sottoposto perlopiù a segnali digitali a determinate frequenze, si calcola la sua **potenza dinamica**. 

==TODO==

- Inserire formula per la potenza dinamica di un dispositivo generico
- Poiché $CL$ non scala, migliorare le prestazioni significa aumentare la frequenza di funzionamento $f$ e diminuire la tensione di alimentazione $V_{DD}$. D'altro canto, se si diminuisse troppo $V_{DD}$ la corrente statica dei circuiti digitali potrebbe diventare significativa. Le tecniche di scaling cercano il giusto trade-off fra le due esigenze.