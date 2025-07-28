#!/usr/bin/env bash

echo -e "\n Searching through all directories for a .terragrunt-cache directory and .terraform.lock.hcl file ready to delete."
echo "The .terragrunt-cache and .terraform.lock.hcl can be removed and it will regenerate as part of terragrunt run --all init."
echo "As long as the terraform remote state has been configured and stored i.e in AWS S3 Bucket..."
find . -name .terragrunt-cache -prune -type d -exec rm -rf {} \; 
find . -name .terraform.lock.hcl -prune -type f -exec rm -rf {} \;

echo -e "\nEnter an environment name dev,stage,prod: "
read env

if [[ $env == "dev" ]]; then 
  cd dev
  if [[ -f uksouth/aks/backend.tf && uksouth/aks/provider.tf ]]; then
    rm -rf uksouth/aks/backend.tf uksouth/aks/provider.tf uksouth/aks/.terraform*
    sleep 2
  fi
  source ~/.azure/credentials
  terragrunt run plan --all
elif [[ $env == "stage" ]]; then
  cd stage
  if [[ -f uksouth/aks/backend.tf && uksouth/aks/provider.tf ]]; then
    rm -rf uksouth/aks/backend.tf uksouth/aks/provider.tf uksouth/aks/.terraform*
    sleep 2
  fi
  source ~/.azure/credentials
  terragrunt run plan --all
elif [[ $env == "prod" ]]; then
  cd prod
    if [[ -f uksouth/aks/backend.tf && uksouth/aks/provider.tf ]]; then
      rm -rf uksouth/aks/backend.tf uksouth/aks/provider.tf uksouth/aks/.terraform*
      sleep 2
    fi
  source ~/.azure/credentials
  terragrunt run plan --all
else
  echo -e "\nSystem Error. Please enter a correct environment name and tries again!"
  exit 1
fi