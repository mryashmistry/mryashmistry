#!/bin/bash
set -e
echo "=== Container ↔ Container ==="
kubectl -n netlab exec -it sidecar-demo -c helper -- curl -s localhost:8080

echo "=== Pod A ↔ Pod B ==="
B_IP=$(kubectl -n netlab get pod testpod-b -o jsonpath='{.status.podIP}')
kubectl -n netlab exec -it testpod-a -- curl -s http://$B_IP:8080

echo "=== Pod ↔ Service (ClusterIP) ==="
for i in $(seq 1 3); do
  kubectl -n netlab exec -it testpod-a -- curl -s http://web.netlab.svc.cluster.local/
  sleep 1
done

echo "=== External ↔ Service (LoadBalancer) ==="
kubectl -n netlab get svc web-public -w

