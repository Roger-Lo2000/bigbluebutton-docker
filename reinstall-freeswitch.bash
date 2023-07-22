#! /bin/bash

kubectl delete deployment freeswitch
kubectl delete configMap freeswitch-config1
kubectl delete configMap freeswitch-config2
kubectl delete configMap freeswitch-config3
kubectl delete configMap freeswitch-config4
kubectl delete configMap freeswitch-config5
# kubectl delete configMap freeswitch-config6
kubectl create configmap freeswitch-config1 --from-file=freeswitch-config1
kubectl create configmap freeswitch-config2 --from-file=freeswitch-config2
kubectl create configmap freeswitch-config3 --from-file=freeswitch-config3
kubectl create configmap freeswitch-config4 --from-file=freeswitch-config4
kubectl create configmap freeswitch-config5 --from-file=freeswitch-config5
# kubectl create configmap freeswitch-config6 --from-file=freeswitch-config6
kubectl apply -f yaml/deployment/freeswitch-deployment.yaml