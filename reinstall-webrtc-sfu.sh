#! /bin/bash

kubectl delete deployment webrtc-sfu
kubectl delete configMap webrtc-sfu-config
kubectl create configmap webrtc-sfu-config --from-file=webrtc-sfu-config
kubectl apply -f yaml/deployment/webrtc-sfu-deployment.yaml