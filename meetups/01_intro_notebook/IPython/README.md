# IPython
Vedremo come installare e provare la funzionalità dell'esecuzione
in parallelo di alcuni task.

## Installazione
La versione di Python di riferimento è la 3.6 o successive.

```
pip install --user "ipython[all]"
iptest
ipcluster start -n 4
```
A questo punto si dovrebbero avere in esecuzione sulla propria 
macchina 4 engine.

## Parallelismo
L'architettura di IPython si compone di quattro componenti fondamentali:
* Engine
* HUB
* scheduler
* client


### Engine
L'interprete Python che riceve i comandi via rete. Durante l'esecuzione
rimane bloccato, per poter eseguire task in parallelo servono più engine.

### HUB
Connette tutti i pezzi dell'archiettura. Mette in comunicazione engine,
scheduler e client.

### scheduler
Fanno da interfaccia tra il client e gli engine. Essendo gli engine bloccanti,
gli scheduler si occupano di gestire i comandi in ingresso per distribuirli
tra gli engine liberi.

### client
La parte con cui l'utente interagisce.

## Esecuzione Parallela
Posto che ci siano 4 engine operativi sulla propria macchina, 
proviamo ad utilizzare il parallelismo.

```
# avvia il client 
ipython

#  all'interno del client

# importa il gestore del parallelismo
import ipyparallel as ipp

# collega al cluster
c = ipp.Client()
c.ids

# definiamo i dati in ingresso per ogni engine
batch = [x+2 for x in range(len(c.ids))]

# tutti gli engine
cluster = c[:]

# l'elaborazione da eseguire su ogni engine
def power(x):
    return x**x

# avvio dell'esecuzione parallela
results = cluster.map(power, batch)

# mostra i risultati
for b,r in zip(batch, results):
    print(b,r)

exit()
```
