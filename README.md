# Progetto ASW Luglio2018

Il progetto è stato realizzato per testare il rilascio di un'applicazione a microservizi, contenitorizzata, tramite l'utilizzo dell'orchestratore di contenitori Kubernetes. L'applicazione scelta per il progetto è Sentence, usata per la generazione di frasi casuali.

### Applicazione **Sentence**
L'applicazione è composta da più servizi:

* **sentence-service**: Servizio per la generazione delle frasi.

* **word-service**: Servizio per la generazione delle parole casuali.

Inoltre abbiamo altri tre servizi per la generazione di subject, verb e object che vengono chiamati tramite chiamate feign dal word service che produrrà, in modo casuale, le varie parti della frase.


## Software da installare sul proprio PC

* [VirtualBox](https://www.virtualbox.org/)
* [Docker](https://www.docker.com/)


## Kubernetes
