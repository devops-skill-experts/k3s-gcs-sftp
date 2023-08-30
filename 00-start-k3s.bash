#!/bin/bash

sudo docker-compose up -d
sleep 10
sudo chmod 600 kubeconfig.yaml
