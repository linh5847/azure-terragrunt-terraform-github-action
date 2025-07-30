There are few tasks need to complete before the GitHub Action CI/CD can take over.

## Azure Portal

Whether to manually create the following.

Azure-Resource-Group
Azure-Storage-Account
Azure-App-Registration  for service principal.
Azure-KeyVault
    KeyVault-Secret for ie

    $ENV-ARM-CLIENT-ID
    $ENV-ARM-CLIENT-SECRET
    $ENV-ARM-SUBSCRIPTION-ID
    $ENV-ARM-TENANT-ID

## GitHub

Creatre A GitHub Repository and following the setting is required.

https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets#creating-encrypted-secrets-for-a-repository

setting->Secrets and variables->Actions->Repository secrets->New repository secret

<img title="GitHub Secrets" alt="Alt text" src="/images/github-repository-secret.png">

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

<img title="Environment" alt="Alt text" src="/images/env.png">

NOTE: GitHub environments and Protection Rules are available on public repos, but for private repos you will need GitHub Enterprise.

<img title="Environment Reviewer" alt="Alt text" src="/images/env_reviewer.png">

For example.
```
01_dev_caller.yml           # When user click on GitHub Action. Left panel click ie 01_dev_caller
02_stage_caller.yml
03_prod_caller.yml
az_tf_plan.yml
az_tf_apply.yml
```
In each caller YAML file above must define a workflow_dispatch and push->branches similar to below.
```
name: "01_dev_caller"
on:
  workflow_dispatch:
  push:
    branches:
      - development

jobs:
  Plan_Dev:
    permissions: #Permission is required if enabling TFSEC == true
      actions: read
      contents: read
      security-events: write
    uses: linh5847/azure-terragrunt-terraform-github-action/.github/workflows/az_tf_plan.yml@development # @development means github branch
    with:
      path: dev ## Path to terraform root module (Required)
      enable_TFSEC: true ## (Optional)  Enable TFSEC IaC scans (Private repo requires GitHub enterprise)
    secrets:
      arm_client_id: ${{ secrets.DEV_ARM_CLIENT_ID }} ## ARM Client ID
      arm_client_secret: ${{ secrets.DEV_ARM_CLIENT_SECRET }} ## ARM Client Secret
      arm_subscription_id: ${{ secrets.DEV_ARM_SUBSCRIPTION_ID }} ## ARM Subscription ID
      arm_tenant_id: ${{ secrets.DEV_ARM_TENANT_ID }} ## ARM Tenant ID
```

The keyword **uses** route to the ie **az_tf_plan.yml@development** means in the GitHub. We must already have or create a branch name **development** ready to push code to this branch for **GitHub Action CI/CD** to execute on this ie **01_dev_caller** name

Creating Git Branch

Select the git repository that you are intend to configure GitHub Action CI/CD. Click the branch button

<img title="Git Branch" alt="Alt text" src="/images/git_branch.png">

branch->new branch

<img title="Git New Branch" alt="Alt text" src="/images/git_branch_creation.png">

```
development
staging

Leave the main as default branch for production environment
```

GitHub Action

Create **.github/workflows** folder under the root and insert the necessary YAML files for CI/CD pipeline in GitHub Action. It is suggesting that it should have a caller and executor. This means that ie each caller represent each environment and executor is just one and build out base on the caller of that particular environment name.

Callers
```
01_dev_caller
02_stage_caller
03_prod_caller
```

Executors
```
az_tf_plan
az_tf_apply
```

In my case. When the callers executor. It will run the Terraform Plan via Terragrunt and requests for approval.

<img title="Approval Request" alt="Alt text" src="/images/review.png">

Need to click on the **Review deployments**

<img title="Approve Options" alt="Alt text" src="/images/approve_option.png">

Select **Reject** or **Approve and deploy** options.
<img title="Approval" alt="Alt text" src="/images/approval.png">