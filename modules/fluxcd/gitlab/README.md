FluxCD is an open-source GitOps operator for Kubernetes, using declarative to define a desired-state to monitor and update the resources to kubernetes cluster current state.

The module ready to run the terraform command is under development/gitlab and can be re-structured into more applicable in future.

I'm choosing **GitLab, Terraform, Kind k8s cluster** for this purposed.

After running terraform to create a kind k8s cluster and destroy. The name still existed. Do as follows

kind get clusters
kind delete cluster --name flux-e2e

In my case the kind k8s cluster name is **flux-e2e**

We must remember that FluxCD main drive is checking the location of the k8s YAML file that's defined by human on a desire state and applying to k8s current state so that the desire state in sync with k8s for the latest updated.

Folder structure
```
├── gitlab_file
│   ├── apps
│   │   ├── base
│   │   └── maven
│   │       └── springboot
│   │           ├── development
│   │           │   ├── kustomization.yaml
│   │           │   ├── kustomizeconfig.yaml
│   │           │   ├── namespace.yaml
│   │           │   ├── release.yaml
│   │           │   ├── repository.yaml
│   │           │   └── values.yaml
│   │           └── staging
│   ├── main.tf
│   ├── output.tf
│   ├── providers.tf
│   └── variables.tf
```
FluxCD GitOps tool that automates the deployment of the application into kubernetes, while kustomization is a configuration management tool allows users to customize their Kubernetes deployments. The Kustomization API defines a pipeline for fetching, decrypting, building, validating and applying Kustomize overlays or plain Kubernetes manifests.

In my case the **kustomization.yaml** provides a configuration management for resources from **k8s namespace, GitRepository, HelmRelease** with a **configMap define on values.yaml file**. FluxCD will pick these up and deploy the application YAML file to k8s ready for service. 

NOTE: If we attempt or deliberate delete out say **apps** and update that into **fluxcd** gitlab repository. The application in current k8s will automatically deleted or destroyed.

Attension:

I use local to process the yaml file in a form of looping each iteration with the gitlab_project_file to process and deploy into **fluxcd** gitlab location which we desired it is to monitor and update. You can see why there are two seperate folders, as it is making more sense when we have more than one application and our folder structure become large.

An exampe. Assuming we have **maven-jave-springboot, gradle-java-springboot, .NET, nodejs, etc**. ours folder structure arguably complex and it may live under parent folder called **apps**, but each one will be monitored and update separately, as they are different behaviour and it is not good to mix all of them into one folder that will cause mayhem in the future expansion.