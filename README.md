TerraGrunt Orchestration Tool good for OpenToFu or Terraform and with the terragrunt.hcl acting as the mapping references from the original Terraform modules that is defining for each purpose.

The important values of TerraGrunt is a set of different environment folder with subfolder ready for mapping or defining the Terraform resources.

## Folder Structure
```
├── dev
│   ├── account.hcl
│   └── uksouth
│       ├── aks
│       │   ├── backend.tf
│       │   ├── provider.tf
│       │   ├── resource_group.tf
│       │   ├── subnet.tf
│       │   ├── terragrunt.hcl
│       │   ├── variables.tf
│       │   └── vnet.tf
│       └── region.hcl
├── global.hcl
├── modules
│   ├── aks
│   │   ├── data.tf
│   │   ├── identities.tf
│   │   ├── locals.tf
│   │   ├── main.tf
│   │   ├── node_pool_variables.tf
│   │   ├── node_pool.tf
│   │   ├── output.tf
│   │   ├── README.md
│   │   └── variables.tf
├── README.md
└── root.hcl
```

The TerraGrunt **root.hcl** will always live under the **Git Repository** root folder to control the relevant activity within the TerraGrunt execution so that the subfolder will inherit and display the output result.

## Operation:

Terragrunt CLI = https://terragrunt.gruntwork.io/docs/reference/cli-options/

cd dev
terragrunt run test --all
terragrunt run init --all
terragrant run validate --all

Alternate, simply run the script instead.

To run the script. No need to cd into each environment name i.e dev.

Run Terraform plan
./terragrunt-plan.sh

Run Terraform apply
./terragrunt-apply.sh

Run Terraform destroy
./terragrunt-destroy.sh

## Terraform Locking

For testing purposes. I deliberately comment out the following line in **root.hcl** file.

#dynamodb_table = "${local.environment}-${local.project_name}-tf-locks"

It is recommend to keep the terraform state file with lock mechanic so that it is safe when multiple engineers are operate at the same time.

## Instruction
[Link to instruction in INSTRUCTION.md](INSTRUCTION.md)