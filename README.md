# Progetto ASW Luglio2018

Il progetto è stato realizzato per testare il rilascio di un'applicazione a microservizi, contenitorizzata, tramite l'utilizzo dell'orchestratore di contenitori Kubernetes.

## Prerequisiti

### Software da installare sul proprio PC

* [VirtualBox](https://www.virtualbox.org/)
* [Docker](https://www.docker.com/)
* **Kubernetes**

## Installazione
Per quanto riguarda l'installazione di Kubernetes, la versione utilizzata nel progetto è **minikube**, un tool in grado di lanciare un single-node Kubernetes cluster localmente, o all'interno di un ambiente virtuale. Prima di installare Minikube, è necessario installare **kubectl**, un tool da linea di comando che ci permetterà di rilasciare e gestire la nostra applicazione all'interno di Kubernetes. 

### Kubectl 
Per effettuare l'installazione di kubectl su **Ubuntu** o **Debian** si eseguono i seguenti comandi:
```
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```

Se si vuole installare kubectl su macOS, è possibile usare il package manager [Homebrew](https://brew.sh/index_it) :
```
brew install kubectl
```

### Minikube
Per effettuare l'installazione di minikube:
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.15.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
```

A questo punto possiamo lanciare il nostro cluster, impostando VirtualBox come hypervisor e configuriamo kubectl per poter parlare con il cluster minikube:
```
minikube start
minikube config set vm-driver virtualbox
kubectl config use-context minikube
```
Dopo aver fatto questi passi, possiamo verificare che kubectl sta comunicando correttamente con il cluster:
```
kubectl cluster-info
```

## Applicazione **Sentence**
L'applicazione scelta per il progetto è Sentence, usata per la generazione di frasi casuali. L'applicazione è composta da più servizi:

* **sentence-service**: Servizio per la generazione delle frasi.

* **word-service**: Servizio per la generazione delle parole casuali.

Inoltre abbiamo altri tre servizi per la generazione di subject, verb e object che vengono invocati tramite chiamate **Feign** dal word service che produrrà, in modo casuale, le varie parti della frase.


### Creazione delle immagini Docker
Il primo passo per effettuare il deploy dell'applicazione è la creazione delle immagini Docker a partire dalla build dell'applicazione:

* Lanciamo lo script per la build dell'applicazione all'interno della directory del progetto:
```
./buildGradle.sh
```

* Lo script per la creazione delle immagini Docker:
```
./buildDocker.sh
```

Possiamo verificare che le immagini sono state create correttamente con il comando:
```
docker images
```


### Creazione dei Service e dei Deployment dell'applicazione
In Kubernetes un **Pod** è la più piccola unità di deploy che è possibile creare e gestire. Un pod è costituito da uno o più contenitori distribuiti su un singolo nodo. I Pod possono essere distrutti e le risorse assegnate ad essi (come indirizzo IP), cambiano dinamicamente. Per questo in Kubernetes vengono definiti i **Service** un'astrazione logica di un insieme di Pod e una politica di accesso ad essi. Inoltre abbiamo bisogno, per ogni Service, di un **Deployment** per gestire la scalabilità dei Pod.

Per la creazione dei Service e dei relativi Deployment usiamo lo script:
```
./createServiceDeploy.sh
```
Se tutto è andato a buon fine, dovremmo essere in grado di visualizzare nella bash i servizi appena creati usando il comando:
```
kubectl get services
```

## Esecuzione 
Ora che abbiamo effettuato il deploy della'applicazione, possiamo eseguirla con il comando:
```
minikube service sentence-service
```

## Scalabilità
Per garantire la scalabilità, ma anche la disponibilità, della nostra applicazione, Kubernetes fornisce il **ReplicaSet**. Il ReplicaSet consente di creare diverse repliche di un singolo Pod e assicura che, in caso di fallimento, il numero delle repliche rimanga lo stesso. Usiamo lo script per replicare la nostra applicazione:
```
./scaleUP.sh
```
Possiamo verificare che la nostra applicazione è stata effettivamente scalata tramite il comando:
```
kubectl get deployments
```
L'attributo **AVAILABLE** specifica il numero di copie presenti all'interno del cluster per ogni singolo servizio.
