#!/bin/bash
set -e
kubectl apply -f ../manifests/00-namespace.yaml
kubectl apply -f ../manifests/10-pod-multicontainer.yaml
kubectl apply -f ../manifests/20-pod-a.yaml
kubectl apply -f ../manifests/21-pod-b.yaml
kubectl apply -f ../manifests/30-deploy-web.yaml
kubectl apply -f ../manifests/31-svc-web-clusterip.yaml
kubectl apply -f ../manifests/32-svc-web-nodeport.yaml
kubectl apply -f ../manifests/33-svc-web-loadbalancer.yaml

