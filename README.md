# Progetto ASW Luglio2018

Il progetto è stato realizzato per testare il rilascio di un'applicazione a microservizi, contenitorizzata, tramite l'utilizzo dell'orchestratore di contenitori Kubernetes. L'applicazione scelta per il progetto è Sentence, usata per la generazione di frasi casuali.

### Applicazione **Sentence**
L'applicazione è composta da più servizi:

* **sentence-service**: Servizio per la generazione delle frasi.

* **word-service**: Servizio per la generazione delle parole casuali.

Inoltre abbiamo altri tre servizi per la generazione di subject, verb e object che vengono chiamati tramite chiamate feign dal word service che produrrà, in modo casuale, le varie parti della frase.

## Prerequisiti

### Software da installare sul proprio PC

* [VirtualBox](https://www.virtualbox.org/)
* [Docker](https://www.docker.com/)


### Una versione di Kubernetes

Per quanto riguarda l'installazione di Kubernetes, la versione utilizzata nel progetto è [Minikube] (https://kubernetes.io/docs/tasks/tools/install-minikube/) , un tool in grado di lanciare un single-node Kubernetes cluster localmente, o all'interno di un ambiente virtuale. 

Prima di installare Minikube, è necessario installare **Kubectl**, un tool da linea di comando che ci permetterà di rilasciare e gestire la nostra applicazione all'interno di Kubernetes. 
