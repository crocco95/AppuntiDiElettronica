# Elettronica dei sistemi digitali

Una reference per le mie conoscenze in campo elettronico. Iniziata come riassunti dei miei appunti del corso di elettronica dei sistemi digitali, edizione del a.a. 2015-2016, tenuto da [Codeluppi Rossano](https://www.unibo.it/sitoweb/rossano.codeluppi2), ma chi lo sa cosa diventerà? 🤔

[Visualizza gli appunti come sito web](https://elquero93.github.io/Elettronica-dei-Sistemi-Digitali/).

Tutto il contenuto è rilasciato in licenza XXX nel repository GitHub :octocat: [elQuero93/Elettronica-dei-Sistemi-Digitali](https://github.com/elQuero93/Elettronica-dei-Sistemi-Digitali).

Dubbi? Saluti? [Contattami!](#contatti)

## Sommario

- [Cenni matematici](cenni_matematici.md): notazioni o "regole" matematiche utilizzate nella stesura delle altre voci;
- [Materia ed elettricità](materia_ed_elettricita.md): cos'è l'elettricità, la corrente, la tensione ed i segnali;
- [Circuiti elettrici: topologia e teoremi](topologia_teoremi_circuito.md): un circuito elettrico ed i teoremi che ne modellano il comportamento;
- [Dispositivi elettrici: nozioni e dispositivi di base](dispositivi_elettrici.md): il dispositivo elettrico ed i parametri che ne descrivono i comportamenti. Applicazione dei concetti sulle componenti elettroniche più utilizzate, come la resistenza, il condensatore e l'induttanza;
- [Segnali e trasmissioni](segnali.md): i protagonisti che entrano in gioco in una trasmissione di dati elettronica;
- [Scaling](scaling.md): cosa comporta la riduzione delle dimensioni dei dispositivi elettronici;
- [Semiconduttori](semiconduttori.md): una panoramica su diodi, BJT e MOS;
- [Circuiti logici](circuiti_logici.md);
  - [La logica CMOS](logica_cmos.md);
- [VHDL](vhdl/vhdl.md): introduzione al linguaggio.
  - [Esercizi dal libro "Free Range VHDL"](vhdl/esercizi/free_range_VHDL.md).

# Linee guida alla contribuzione

Partiamo dal presupposto che ogni contribuzione è benvenuta! Lo stile di scrittura adottato è il seguente:

- **concetti base**: quando si spiega un nuovo concetto scrivere ogni nuova parola chiave, mai introdotta nella reference, in **grassetto**. Se possibile riportare in grassetto la parola in italiano, seguita subito dopo dalla traduzione in inglese in corsivo. Esempio: **condensatore** o *capacitor*. Inoltre:
  - sinonimi della stessa parola che si sintende riportare sono da indicare in *corsivo*;
  - evitare di riportare la definizione di un termine più volte. È preferibile linkare la sezione, o solamente il file, in cui è riportata la sua spiegazione;
  - introdurre un argomento con una definizione di base che ne dia una visione d'insieme, per poi approfondirla con successive sezioni;
- **simboli**:
  - riportare qualsiasi formula matematica, anche semplici numeri come $4V$, sottoforma di espressione *LaTeX*. Non sai come fare? [:book:Una guida veloce alle espressioni matematiche in *LaTeX*](https://en.wikibooks.org/wiki/LaTeX/Mathematics);
  - preferire sempre l'utilizzo dei simboli per indicare determinati elementi, più che la loro nomenclatura. In caso si introduca un nuovo simbolo, riportarlo dopo il nome del dell'entità e tra parentesi. Esempio: **Culomb** ($C$).
- **circuiti**: tutti i circuiti sono disegnati con [FidoCadJ](http://darwinne.github.io/FidoCadJ/).
  - per i circuiti composti da più componenti li esporto in PDF (convertito poi in SVG) con il "Magnification" impostato a 7.0;
  - per i simboli, come nel caso dei simboli dei transistor MOS, esporto in PDF (convertito poi in SVG) con il "Magnification" impostato a 9.0;

# TODO

## Tema appunti Github

- [ ] Aggiungere references a istruzioni e/o file su cui contribuire ad un determinato file;

# Contatti

Puoi contattarmi in vari modi:

- :e-mail:: [riccardo.quercetti.93@gmail.com](mailto:riccardo.quercetti.93@gmail.com);
- :octocat:: [elQuero93](https://github.com/elQuero93).