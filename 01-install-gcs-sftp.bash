#!/bin/bash

export KUBECONFIG=$(pwd)/kubeconfig.yaml
NS=sftp
SSH_KEY=ssh_host_rsa_key

ssh-keygen -t rsa -f ${SSH_KEY} -q -P ""

kubectl create ns ${NS}
kubectl create secret -n ${NS} generic sftp-gcloud-key --from-file=gcloud-key.json
kubectl create secret -n ${NS} generic ssh-secret-key --from-file=${SSH_KEY}

cd "01-gcs-sftp"

helm dependency update
helm upgrade -i init . -n ${NS} --create-namespace
