#!/bin/bash
kubectl delete configMap https-proxy-config
kubectl delete configMap mongodb-config
kubectl delete --all deployment --namespace=default
kubectl delete pvc --all
kubectl delete pv --all

kubectl get pods --all-namespaces | grep ContainerStatusUnknown | awk '{print $2 " --namespace=" $1}' | xargs kubectl delete pod
kubectl get pods --all-namespaces | grep Evicted | awk '{print $2 " --namespace=" $1}' | xargs kubectl delete pod
kubectl get pods --all-namespaces | grep Error | awk '{print $2 " --namespace=" $1}' | xargs kubectl delete pod

kubectl get endpoints ##入口

kubectl create configmap mongodb-config --from-file=mongodb-config
kubectl create configmap https-proxy-config --from-file=https-proxy-config
kubectl create configmap freeswitch-config1 --from-file=freeswitch-config1
kubectl create configmap freeswitch-config2 --from-file=freeswitch-config2
kubectl create configmap nginx-config --from-file=nginx-config
kubectl delete configMap nginx-config
kubectl delete deployment nginx

kubectl apply -f ./yaml --recursive

iptables -t nat -A PREROUTING -p tcp -d 35.229.151.245 --dport 8080 \
 -j DNAT --to-destination 172.17.0.1:8080

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 \
-j DNAT --to-destination 172.17.0.1:8080

sudo iptables -t nat -A PREROUTING -i ens4 -p tcp --dport 8080 -j DNAT --to-destination 172.17.0.1:8080
route add -net 172.17.0.1 netmask 255.255.255.255 metric 1024 ens4
adds a route to the local network 192.56.76.x via "eth0".  The word "dev" can be omitted here.
iptables -t nat -I PREROUTING --src 0/0 --dst 172.17.0.1 -p tcp --dport 80 -j REDIRECT --to-ports 80
iptables -A PREROUTING -t nat -i eth0:0 -p tcp --dport 80 -j DNAT --to 172.17.0.1:80
iptables -A FORWARD -p tcp -d 172.17.0.1 --dport 80 -j ACCEPT