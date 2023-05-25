#!/bin/bash
kubectl delete configMap https-proxy-config
kubectl delete configMap mongodb-config
kubectl delete --all deployment --namespace=default
kubectl delete svc --all
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
kubectl create configmap coturn-server-conf --from-file=coturn

kubectl apply -f ./yaml --recursive 


docker stop $(docker ps -aq)
docker remove $(docker ps -aq)


## postgressql

 id | room_id | provider | uid | name | username | email | social_uid | image | 
 password_digest | accepted_terms | created_at | updated_at | email_verified | language 
 | reset_digest | 
reset_sent_at | activation_digest | activated_at | 
deleted | role_id | last_login | failed_attempts | 
last_failed_attempt | last_pwd_update


INSERT INTO users (id,room_id,provider,uid,name,username,email,social_uid,image,password_digest,accepted_terms,created_at,updated_at,email_verified,language,reset_digest,reset_sent_at,activation_digest,activated_at,deleted,role_id,last_login,failed_attempts,last_failed_attempt,last_pwd_update) VALUES (1,2,3,4,5,6,7,8,9,10,FALSE,'2023-05-25 10:30:00','2023-05-25 10:30:00',FALSE,15,16,'2023-05-25 10:30:00',18,'2023-05-25 10:30:00',FALSE,21,'2023-05-25 10:30:00',23,'2023-05-25 10:30:00','2023-05-25 10:30:00');
 id | user_id | name | uid | bbb_id | sessions | 
 last_session | created_at | updated_at | room_settings |
  moderator_pw | attendee_pw | access_code | deleted | moderator_access_code

INSERT INTO rooms (id,user_id,name,uid,bbb_id,sessions,last_session,created_at,updated_at,room_settings,moderator_pw,attendee_pw,access_code,deleted,moderator_access_code) VALUES (1,2,3,2,5,6,'2023-05-25 10:30:00','2023-05-25 10:30:00','2023-05-25 10:30:00',10,11,12,13,TRUE,15);


exec 進入 postgressql
su - postgres
psql

\l #查詢 list of databases
\c greenlight # 進去greenlight database
\dt # 查詢 list of relations