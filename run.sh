#!/bin/bash

# Taiga Config MAP
microk8s kubectl create namespace taiga
microk8s kubectl create configmap taiga-config --from-env-file=.env -n taiga

#DB
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-db-data-persistentvolumeclaim.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-db-deployment.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-db-service.yaml

# RABBIT MQ EVENTS
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-events-rabbitmq-data-persistentvolumeclaim.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-events-rabbitmq-deployment.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-events-rabbitmq-service.yaml

# Taiga Events
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-events-deployment.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-events-service.yaml

# Taiga Protected
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-protected-deployment.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-protected-service.yaml

# RABBIT MQ ASYNC
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-async-rabbitmq-data-persistentvolumeclaim.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-async-rabbitmq-deployment.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-async-rabbitmq-service.yaml

# Static & Media Data
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-static-data-persistentvolumeclaim.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-media-data-persistentvolumeclaim.yaml

# Taiga ASYNC
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-async-deployment.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-async-service.yaml

# Taiga BACK
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-back-deployment.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-back-service.yaml

# Taiga Front
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-front-deployment.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-front-service.yaml

# Taiga Gateway
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-gateway-configmap.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-gateway-deployment.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-gateway-service.yaml
microk8s kubectl apply -n taiga -f ./taiga-k8s/taiga-gateway-ingress.yaml