#!/bin/bash

export KUBECONFIG=$(pwd)/kubeconfig.yaml
NS=sftp

kubectl create ns ${NS}
kubectl create secret -n ${NS} generic sftp-gcloud-key --from-file=gcloud-key.json
kubectl create secret -n ${NS} generic ssh-secret-key --from-file=ssh_host_rsa_key

cd "01-gcs-sftp"

helm dependency update
helm upgrade -i init . -n ${NS} --create-namespace
