#!/bin/bash

ROOT=$1
echo "------------------------------------------"
echo "       Pangeo Forge - GCE bakery"
echo "       ----  LOKI INSTALLER ----"
echo "------------------------------------------"
echo "- Running kubernetes connector script"
$ROOT/scripts/k8s-connect.sh

echo "- Adding helm repos"
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

echo "- Deploying the loki stack"
helm install loki-stack grafana/loki-stack \
                                --create-namespace \
                                --namespace loki-stack \
                                --set promtail.enabled=true,loki.persistence.enabled=true,loki.persistence.size=100Gi,grafana.enabled=true
