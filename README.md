# Figuring It Out - Kubernetes, GKE, Google Cloud Platform

## Full setup instructions

Make sure you set up the `Installation dependencies` first, before moving on to the `Deployment dependencies`.
### Installation dependencies
1. GCloud CLI    - Install CLI for Google Cloud Platform - [Instructions](https://cloud.google.com/sdk/docs/install)
2. GCloud CLI    - Authenticate your identity for developing in local environment - [Instructions](https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login)
3. Terraform CLI - Install the Terraform CLI here - [Instructions](https://learn.hashicorp.com/tutorials/terraform/install-cli)

### Deployment instructions
I've added some of the instructions in different scripts to run in the terminal environment, in order to automate some of these instructions to make it easier to execute.
Feel free to read into these scripts and modify if necessary

1. [Added in 1.0.0](https://github.com/Weiyuan-Lane/gcp-gke-tf/releases/tag/1.0.0) | (Only run for first time) Run `make first-time-setup`
2. [Added in 1.0.0](https://github.com/Weiyuan-Lane/gcp-gke-tf/releases/tag/1.0.0) | Configure the [env/terraform.*ENV_NAME*.tfvars](https://github.com/Weiyuan-Lane/gcp-gke-tf/blob/main/terraform/env) to your desired project values
3. [Added in 1.0.0](https://github.com/Weiyuan-Lane/gcp-gke-tf/releases/tag/1.0.0) | Run `make deploy-staging` to bringup the cluster


#### Explanation for above steps
1. Run `make first-time-setup`
    - This instruction executes enabling of Google Cloud APIs permissions and also runs `terraform init` with the right folder settings (so you don't have to)
2. Configure the [env/terraform.*ENV_NAME*.tfvars](https://github.com/Weiyuan-Lane/gcp-gke-tf/blob/main/terraform/env) to your desired project values
    - Note that the `prod` and `stg` files should be differently configured here
    - Want to know how it is used? Check out variables documentation [here](https://github.com/Weiyuan-Lane/gcp-gke-tf/blob/main/terraform/variables.tf)


### Bringdown instructions
1. [Added in 1.0.0](https://github.com/Weiyuan-Lane/gcp-gke-tf/releases/tag/1.0.0) | Run `make bringdown-staging` to bringdown the cluster


<br><br><br><br>

---
---
---
### FROM THIS POINT ONWARD, THESE ARE REFERENCES TO MY [MEDIUM SERIES](https://gist.github.com/Weiyuan-Lane/3215a110418195da4b28348be6783d0e). IGNORE THIS IF YOU JUST WANTED TO SETUP USING THE INSTRUCTIONS ABOVE.

---
---
---
<br><br><br>

## #1 - Getting Started - [Link](https://medium.com/@weiyuan-liu/figuring-it-out-its-google-s-cool-bernetes-time-1-getting-started-again-c5f150109253)

This first episode in the series covers the basic concepts of Terraform and using it in GKE.

I also covered base design choices and concepts for the "gke_cluster" module, balancing between flexibility and ease of use.

---

