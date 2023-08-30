#!/bin/bash

sudo docker-compose up -d
sleep 10

sudo chown ${USER} kubeconfig.yaml
sudo chmod 600 kubeconfig.yaml
