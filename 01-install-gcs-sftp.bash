#!/bin/bash

NS=sftp
cd "01-gcs-sftp"

kubectl create secret -n ${NS} generic sftp-gcloud-key --from-file=gcloud-key.json
kubectl create secret -n ${NS} generic ssh-secret-key --from-file=ssh_host_rsa_key

helm dependency update
helm upgrade -i init . -n ${NS} --create-namespace
