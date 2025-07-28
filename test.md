Clone the git repository

1. Run plan
./terragrunt-plan.sh
dev

2. Run apply
./terragrunt-apply.sh
dev

3. Run plan
./terragrunt-plan.sh
stage

and prod

4. Add another module to dev and repeat the plan and apply

5. Run apply
./terragrunt-apply.sh
stage

6. Add another module to stage and repeat with the plan and apply

7. Delete dev environment one module only

cd dev/eu-west-2/public_route

terragrunt state list
terragrunt destroy -target aws_route.route

Answer y

or 

terragrunt destroy -target aws_route_table.route_table -auto-approve

8. Run apply
./terragrunt-apply.sh
dev

Check the aws console that all resources are good and not issued with remote-state even destroy a target module and rebuild.

9. Run destroy all
./terragrunt-destroy.sh
prod

dev

and

stage