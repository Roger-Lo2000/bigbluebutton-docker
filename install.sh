#!/bin/bash
kubectl delete configMap https-proxy-config
kubectl delete configMap mongodb-config
kubectl delete --all deployment --namespace=default
kubectl delete pvc --all
kubectl delete pv --all

kubectl get pods --all-namespaces | grep ContainerStatusUnknown | awk '{print $2 " --namespace=" $1}' | xargs kubectl delete pod
kubectl get pods --all-namespaces | grep Evicted | awk '{print $2 " --namespace=" $1}' | xargs kubectl delete pod
kubectl get pods --all-namespaces | grep Error | awk '{print $2 " --namespace=" $1}' | xargs kubectl delete pod
kubectl get pods --all-namespaces | grep Complete | awk '{print $2 " --namespace=" $1}' | xargs kubectl delete pod

kubectl get endpoints ##入口

kubectl create configmap mongodb-config --from-file=mongodb-config
kubectl create configmap https-proxy-config --from-file=https-proxy-config
kubectl create configmap freeswitch-config1 --from-file=freeswitch-config1
kubectl create configmap freeswitch-config2 --from-file=freeswitch-config2
kubectl create configmap nginx-config --from-file=nginx-config
kubectl create configmap coturn-config --from-file=coturn-config
kubectl create configmap coturn-server-conf --from-file=coturn/turnserver.conf

kubectl apply -f ./yaml --recursive 
