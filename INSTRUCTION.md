There are few tasks need to complete before the GitHub Action CI/CD can take over.

1. Whether to manually create the foolowing.

Azure-Resource-Group
Azure-Storage-Account
Azure-KeyVault
    KeyVault-Secret for ie

    $ENV-ARM-CLIENT-ID
    $ENV-ARM-CLIENT-SECRET
    $ENV-ARM-SUBSCRIPTION-ID
    $ENV-ARM-TENANT-ID

Creatre A GitHub Repository and following the setting is required.

https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets#creating-encrypted-secrets-for-a-repository

setting->Secrets and variables->Actions->Repository secrets->New repository secret

If it is one off or one environment only. Performing this step.

Creating Environment

https://docs.github.com/en/actions/how-tos/deploy/configure-and-manage-deployments/manage-environments#creating-an-environment

setting->Environments->New environment

dev
stage
prod

NOTE: GitHub environments and Protection Rules are available on public repos, but for private repos you will need GitHub Enterprise.

Add Secret. Under the **Environment secrets**. Click **Add environment secret**

DEV_ARM_CLIENT_ID, etc. Same way as adding secret above.

Now, create a **.github/workflows** folder and place in the YAML file for CI/CD pipeline in GitHub Action.

For example.
plan.yml
apply.yml
destroy.yml