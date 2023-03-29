#!/bin/bash
# kubectl delete configMap https-proxy-config
# kubectl delete configMap mongodb-config
# kubectl delete --all deployment --namespace=default
# kubectl delete pvc --all
kubectl create configmap mongodb-config --from-file=mongodb-config
kubectl create configmap https-proxy-config --from-file=https-proxy-config
kubectl create configmap freeswitch-config1 --from-file=freeswtich-config1
kubectl create configmap freeswitch-config2 --from-file=freeswtich-config2
kubectl apply -f ./yaml --recursive
