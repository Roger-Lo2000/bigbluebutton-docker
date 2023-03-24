#!/bin/sh
echo "start init"
mongod --oplogSize 8 --replSet rs0 --noauth \
   --config /data/config/mongod.conf \
   --bind_ip 0.0.0.0 --port 27017 \
   --tlsMode disabled \
   --logpath /proc/1/fd/1 --logappend \
   --pidfilepath /tmp/docker-entrypoint-temp-mongod.pid
mongo $mongo_pod_IP --eval "rs.initiate({ _id: 'rs0', members: [{ _id: 0, host: '$mongo_pod_IP:27017'}]})"

echo "init done"