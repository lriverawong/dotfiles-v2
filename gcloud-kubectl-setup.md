# Kubectl and Gcloud Ecobee - Quick Setup

## Initial Login
```
gcloud auth login
```

## CW-Prod
```
gcloud config configurations create cw-prod
gcloud init
gcloud container clusters get-credentials www-cluster --region us-central1
kubectl config rename-context gke_corporate-site-1523484418716_us-central1_www-cluster cw-prod_www-cluster
```

# CW-Dev
```
gcloud config configurations create cw-dev
gcloud init
gcloud container clusters get-credentials consumerwebsite-cluster-dev --region us-central1-a
kubectl config rename-context gke_consumer-web-dev-208518_us-central1-a_consumerwebsite-cluster-dev cw-dev_consumerwebsite-cluster-dev 
```
# Shared-Staging
```
gcloud config configurations create shared-staging
gcloud init
# us-central1 = option 8
gcloud container clusters get-credentials shared-stage-cluster --region us-central1
```
