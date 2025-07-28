#!/usr/bin/env bash

echo -e "\nEnter an environment name dev,stage,prod: "
read env

if [[ $env == "dev" ]]; then
  cd dev
  source ~/.azure/credentials
  terragrunt run init --all
  terragrunt run refresh --all
  terragrunt run --all destroy --non-interactive
elif [[ $env == "stage" ]]; then
  cd stage
  source ~/.azure/credentials
  terragrunt run init --all
  terragrunt run refresh --all
  terragrunt run --all destroy --non-interactive
elif [[ $env == "prod" ]]; then
  cd prod
  source ~/.azure/credentials
  terragrunt run init --all
  terragrunt run refresh --all
  terragrunt run --all destroy --non-interactive
else
  echo -e "\nSystem Error. Please enter a correct environment name and tries again!"
  exit 1
fi