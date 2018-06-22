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
* Kubernetes

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


