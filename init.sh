#!/bin/bash

echo "---- Adding KubePrometheusStack Repo"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "---- Deploying KubePrometheusStack with specific values's file"
helm install kps prometheus-community/kube-prometheus-stack --create-namespace monitoring