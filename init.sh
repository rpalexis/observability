#!/bin/bash

echo "---- Adding KubePrometheusStack Repo"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "---- Deploying KubePrometheusStack with specific values's file"
helm upgrade --install kps prometheus-community/kube-prometheus-stack --create-namespace  -n monitoring -f ./values-kps.yaml

echo "---- Deploying Loki"
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm upgrade --install kps-loki grafana/loki-stack --create-namespace  -n monitoring -f ./values-kps-loki.yaml
