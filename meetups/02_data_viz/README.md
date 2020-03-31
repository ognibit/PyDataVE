#PyDataVE Data Visualization (31 Marzo 2020 - Online Version)
Viene qui riportata una carrellata di tool open source e free per visualizzare
i dati in maniera standard, ossia con grafici vari.

## Per Iniziare
### pygal
Ottima libreria per creare semplici grafici da includere nei siti html.
Il risultato è in SVG e pensato per il web. 
API intuitive e un numero adeguato di tipologie di grafici per tutte quelle
elaborazioni in cui non sia richiesto nulla di speciale.
[http://www.pygal.org/en/stable/](http://www.pygal.org/en/stable/)

### missigno
Utile per una prima analisi dei dati, per verificare quanto siano completi. 
Gli strumenti messi a disposizione dalla libreria sono focalizzati al riconoscimento dei "missing values".
Basata su **Matplotlib**

[https://github.com/ResidentMario/missingno](https://github.com/ResidentMario/missingno)

### leather
Uno strumento per l'indagine di piccoli dataset o campioni; utile per capire a grandi linee su quali grafici orientaci
e pensato come forma puramente prototipale. Realizza il grafico con poche e semplicissime righe di codice.
Scritto in python non è pensato per le performance o la precisione, ma con l'ottica di analisi grezza iniziale.
Output in SVG.

[https://leather.readthedocs.io/en/0.3.3/examples.html](https://leather.readthedocs.io/en/0.3.3/examples.html)

## Tool Professionali
Quando si deve approfondire l'analisi e i dataset sono grandi, le performance 
e le API diventano fondamentali. Di seguito le librerie più note e usate nel
mondo Python. Tutte vengono spesso utilizzate in combinazione con altre
librerie di analisi dati, come Scikit-Learn e Pandas (tutti basati su Numpy).

### matplotlib
Un punto di riferimento nel mondo Python. Ha possibilità vastissime, è stabile
e ben documentata. Il suo funzionamento non è però *pythonic* perchè nata
prendendo ispirazione da Matlab. Esistono due approcci, quello classico e
quello ad oggetti. Il secondo è quello preferibile e più moderno.
Le API non sono banali e i grafici appaiono un po' datati nella grafica.

[https://matplotlib.org/](https://matplotlib.org/)

### searborn
Si tratta di una libreria che frutta la potenza di matplotlib, ma ne rende
l'utilizzo più semplice e la resa grafica molto più attraente. Di fatto una
delle libreria di punta nel mondo Python. Scikit-learn e Pandas si integrano
già con essa e possono renderizzare i dati con estrema facilità e ottima resa
estetica.

[https://seaborn.pydata.org/](https://seaborn.pydata.org/)

### GGPLOT
La versione Pythion è il porting della libreria ggplot2 di R. Porta con sè la
semplicità d'uso e l'esperienza tipici della comunità R. Fondato su principi di
design grafico solidi e riconosciuti nel mondo accademico, ha una foltissima
schiera di utilizzatori entusiasti.

[http://ggplot.yhathq.com/](http://ggplot.yhathq.com/)

### Bokeh
Tool per poter realizzare grafici web interattivi con backend in Python,
riducendo al minimo lo sforzo. 

[https://bokeh.org/](https://bokeh.org/)


