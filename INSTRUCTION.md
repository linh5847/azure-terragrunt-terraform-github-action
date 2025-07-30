There are few tasks need to complete before the GitHub Action CI/CD can take over.

1. Whether to manually create the following.

Azure-Resource-Group
Azure-Storage-Account
Azure-App-Registration  for service principal.
Azure-KeyVault
    KeyVault-Secret for ie

    $ENV-ARM-CLIENT-ID
    $ENV-ARM-CLIENT-SECRET
    $ENV-ARM-SUBSCRIPTION-ID
    $ENV-ARM-TENANT-ID

Creatre A GitHub Repository and following the setting is required.

https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets#creating-encrypted-secrets-for-a-repository

setting->Secrets and variables->Actions->Repository secrets->New repository secret

NOTE: This demo is a multiple environment. Therefore, you need to come up with the name convention for repository secret.

DEV_ARM_CLIENT_ID
DEV_ARM_CLIENT_SECRET
DEV_ARM_SUBSCRIPTION_ID
DEV_ARM_TENANT_ID

STAGE_ARM_CLIENT_ID
STAGE_ARM_CLIENT_SECRET
STAGE_ARM_SUBSCRIPTION_ID
STAGE_ARM_TENANT_ID

If you are assuming that just having one ie ARM_CLIENT_ID and work for all, when there are multiple tenant.

Creating Environment

https://docs.github.com/en/actions/how-tos/deploy/configure-and-manage-deployments/manage-environments#creating-an-environment

setting->Environments->New environment

dev
stage
prod

NOTE: GitHub environments and Protection Rules are available on public repos, but for private repos you will need GitHub Enterprise.



Now, create a **.github/workflows** folder and place in the YAML file for CI/CD pipeline in GitHub Action.

For example.
01_dev_caller.yml           # When user click on GitHub Action. Left panel click ie 01_dev_caller
02_stage_caller.yml
03_prod_caller.yml
az_tf_plan.yml
az_tf_apply.yml

<img title="Development Environment Approval Request" alt="Alt text" src="/images/1.png">