# 1 - Introduzione ai Notebook

Venerdì 13 Dicembre 2019

Campus Scientifico Università Caà Foscari (Mestre) AULA D

## Cos'è un Notebook
Precisamente si parla di di *notebook interface* o *computational notebook*.
Sono dei programmi software usati per permettere il *literate programming* 
e sono un misto tra un editor di testo, una shell dei comandi e una REPL.

### Literate Programming
Si tratta di un paradigma di programmazione che vorrebbe permettere al
programmatore di scrivere il codice seguendo l'ordine dei suoi pensieri
piuttosto che quello imposto dalla logica dei computer.

Il concetto è di fornire uno strumento di elaborazione che sia più
vicino al linguaggio naturale che a quello macchina.

## Come funziona un Notebook
L'idea alla base della realizzazione dei notebook è quella di fornire 
una comoda interfaccia grafica, spesso slegata dal linguaggio usato,
nella quale mescolare appunti e codice eseguibile strutturati in una
sequenza ordinata di *celle* (cells) che vengono eseguite da un *kernel*
e il cui output è facilmente comprensibile.

Questa struttura permette di utilizzare questi editor come pagine di appunti
e hanno trovato largo uso nel mondo dell'analisi dati perché spesso
si tratta di elaborazioni ad hoc, che non necessitano di tutta l'infrastruttura
di un programma, ma si focalizzano sulle operazioni. La possibilità di 
vedere immediatamente i risultati, testuali e grafici, amplifica ulteriormente
questo scenario.

Un altro punto di forza dei notebook è la caratteristica di mantenere 
memoria del risultato delle elaborazioni delle celle precedenti, così
da poter continuare l'esplorazione dei dati senza dover ogni volta rieseguire
tutte le celle precedenti, con notevoli risparmi di tempo.

## IPython
Nonostante sia stato pensato per poter funzionare con altri linguaggi,
sicuramente IPython è conosciuto come interfaccia per Python.

IPython non solo migliora la parte interattiva (di qui la I nel nome)
dell' interprete Python aggiungendo auto completamento, colori e output 
leggibili, ma offre una serie di feature aggiuntive che lo rendono
di fatto una specie di notebook. Una delle caratteristiche principali
di IPython è l'esecuzione parallela dei task.

IPython ha fatto da base al suo spin-off più importante: Jupyter Notebook.

## Juptyer Notebook

## Apache Zeppelin
Andera Cannella ha presentato uno stesso caso d'uso usando il dataset Titanic
e confrontando l'operatività tra Jupyter e Apache Zeppelin.

Consiglio: installare Zeppelin su server linux, piuttosto che su windows
locale.
