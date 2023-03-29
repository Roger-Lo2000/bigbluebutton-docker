#!/bin/bash
# kubectl delete configMap https-proxy-config
# kubectl delete configMap mongodb-config
# kubectl delete --all deployment --namespace=default
kubectl create configmap mongodb-config --from-file=mongodb-config
kubectl create configmap https-proxy-config --from-file=https-proxy-config
kubectl apply -f ./yaml --recursive