##Addressbook Tutoriall
====================


Installing Jenkins using Helm
--------------
helm repo add jenkinsci https://charts.jenkins.io
helm repo update
helm search repo jenkins

Configuring the jenkins for minikube cluster deployment

```
heml show values jenkinsci/jenkins > /tmp/jenkins.yaml
```
Update the values as needed
```
vi /tmp/jenkins.yaml
```

- Update the username and password
- Update the jenkins plugin
- Update the persistance storage configuration

Installing the helm chart to deploy in the cluster
```
helm install jenkins jenkinsci/jenkins --values /temp/jenkins.yaml -n jenkins
```

Installing Prometheus using Helm
--------------
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/prometheus
```

Exposing the service thru NodePort

```
kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-ext
minikube service prometheus-server-ext
```

Installing Grafana using Helm
--------------

```
helm repo add grafana https://grafana.github.io/helm-charts

helm repo update

helm install my-release grafana/grafana
```
Exposing the service thru NodePort

```
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-ext
minikube service grafana-ext
```
Get the password from secret
```
kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
This tutorial teaches you some of the basic concepts in [Vaadin Framework](https://vaadin.com). It is meant to be
a fast read for learning how to get started - not an example on how application should be
designed. Please note this example uses and requires Java 8 to work..

![Addressbook Screenshot](addressbook_screenshot.png "Addressbook Screenshot")


Prometheus Reference - https://www.youtube.com/watch?v=dk2-_DbWb80 
& https://github.com/shazforiot/Monitoring-Kubernetes-with-Prometheus-Grafana/blob/main/Helm%20Steps

KubeConfig - https://www.youtube.com/watch?v=fodA9rM5xoo

Kanikio - https://www.youtube.com/watch?v=YnZQJAMK6JI

Jenkins Helm installation - https://www.bogotobogo.com/DevOps/Docker/Docker-Kubernetes-Jenkins-Helm.php
