#!/bin/bash

CLUSTER_NAME=$(kind get clusters | tail -n 1)

if [[ `terraform state list | tail -n 1 | awk -F "." {'print $4'}` != "kind_k8s" ]]; then
  echo "System Error!"
  exit 1
else
  echo -n "Clean up kind k8s cluster"
  terraform destroy -auto-approve
  sleep 5
  kind delete cluster --name $CLUSTER_NAME
fi