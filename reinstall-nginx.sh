#! /bin/bash

kubectl delete deployment nginx
kubectl delete configMap nginx-config
kubectl delete configMap nginx-default-config 

kubectl create configmap nginx-config --from-file=nginx-config
kubectl create configmap nginx-default-config --from-file=nginx-default-config
kubectl apply -f yaml/deployment/nginx-deployment.yaml