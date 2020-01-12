#!/bin/bash
echo "Starting to rename..."
# post install - rename contexts for kubectl
kubectl config rename-context gke_corporate-site-1523484418716_us-central1_www-cluster e_www-cluster
kubectl config rename-context gke_consumer-web-dev-208518_us-central1-a_consumerwebsite-cluster-dev e_cw-dev 
echo "Done renaming e_www_cluster and e_cw-dev cluster."