# Figuring It Out - Kubernetes, GKE, Google Cloud Platform

## Full setup instructions

Make sure you set up the `Installation dependencies` first, before moving on to the `Deployment dependencies`.
### Installation dependencies
1. GCloud CLI          - Install CLI for Google Cloud Platform - [Instructions](https://cloud.google.com/sdk/docs/install)
2. GCloud CLI          - Authenticate your identity for developing in local environment - [Instructions](https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login)
3. Terraform CLI       - Install the Terraform CLI here - [Instructions](https://learn.hashicorp.com/tutorials/terraform/install-cli)
4. Kubectl CLI         - Install the Kubectl CLI here - [Instructions](https://kubernetes.io/docs/tasks/tools/#kubectl)
5. Kubectl Auth Plugin - Install using the following command - [Learn more](https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke)
```
gcloud components install gke-gcloud-auth-plugin
```
6. K9s                 - Install the K9s CLI here - [Instructions](https://k9scli.io/topics/install/)

<br><br>

### Deployment instructions
I've added some of the instructions in different scripts to run in the terminal environment, in order to automate some of these instructions to make it easier to execute.
Feel free to read into these scripts and modify if necessary

1. [Added in 1.0.0](https://github.com/Weiyuan-Lane/gcp-gke-tf/releases/tag/1.0.0) | (Only run for first time) Run `make first-time-setup`
2. [Added in 1.0.0](https://github.com/Weiyuan-Lane/gcp-gke-tf/releases/tag/1.0.0) | Configure the [env/terraform.*ENV_NAME*.tfvars](https://github.com/Weiyuan-Lane/gcp-gke-tf/blob/main/terraform/env) to your desired project values
3. [Added in 1.0.0](https://github.com/Weiyuan-Lane/gcp-gke-tf/releases/tag/1.0.0) | Run `make deploy-staging` to bringup the cluster
4. [Added in 2.0.0](https://github.com/Weiyuan-Lane/gcp-gke-tf/releases/tag/2.0.0) | Run the following command (replacing the template values) to setup your cluster access locally for `kubectl` and `k9s`
```bash
gcloud container clusters get-credentials %CLUSTER_NAME% \
  --region=%CLUSTER_REGION% \
  --project=%CLUSTER_PROJECT%
```

#### Explanation for above "Deployment instructions" steps
1. Run `make first-time-setup`
    - This instruction executes enabling of Google Cloud APIs permissions and also runs `terraform init` with the right folder settings (so you don't have to)
2. Configure the [env/terraform.*ENV_NAME*.tfvars](https://github.com/Weiyuan-Lane/gcp-gke-tf/blob/main/terraform/env) to your desired project values
    - Note that the `prod` and `stg` files should be differently configured here
    - Want to know how it is used? Check out variables documentation [here](https://github.com/Weiyuan-Lane/gcp-gke-tf/blob/main/terraform/variables.tf)


<br><br>

### Bringdown instructions
1. [Added in 1.0.0](https://github.com/Weiyuan-Lane/gcp-gke-tf/releases/tag/1.0.0) | Run `make bringdown-staging` to bringdown the cluster

<br><br><br><br>

---
---
---
## Other optional tools
---
---
---

### For managing your GKE cluster

#### Using Kubectl
See common uses from their [cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

Learn more on it's comparison from similar tools in [episode 2](https://weiyuan-liu.medium.com/figuring-it-out-its-google-s-cool-bernetes-time-2-best-ways-to-manage-your-gke-cluster-dfa396c9a14e)

#### Using K9s
See tutorials [here](https://k9scli.io/topics/video/)

Learn more on it's comparison from similar tools in [episode 2](https://weiyuan-liu.medium.com/figuring-it-out-its-google-s-cool-bernetes-time-2-best-ways-to-manage-your-gke-cluster-dfa396c9a14e)

#### Using Kubernetes Dashboard
If you have ran the deployment instructions above, no other setup required here!

To start using the dashboard:
1. Run `kubectl proxy - port=8001` to start a proxy stream
2. Visit this link - http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:443/proxy/#/login for the dashboard
3. When prompted to enter a token, run the following command
```bash
gcloud auth print-access-token | pbcopy # pbcopy copies to your clipboard directly
```

Learn more on it's comparison from similar tools in [episode 2](https://weiyuan-liu.medium.com/figuring-it-out-its-google-s-cool-bernetes-time-2-best-ways-to-manage-your-gke-cluster-dfa396c9a14e)



<br><br><br><br>

---
---
---
### FROM THIS POINT ONWARD, THESE ARE REFERENCES TO MY [MEDIUM SERIES](https://gist.github.com/Weiyuan-Lane/3215a110418195da4b28348be6783d0e). IGNORE THIS IF YOU JUST WANTED TO SETUP USING THE INSTRUCTIONS ABOVE.

---
---
---
<br>

## #1 - Getting Started - [Link](https://weiyuan-liu.medium.com/figuring-it-out-its-google-s-cool-bernetes-time-1-getting-started-again-c5f150109253?sk=f3785eddc278546b5df996c37b4facfc)

This first episode in the series covers the basic concepts of Terraform and using it in GKE.

I also covered base design choices and concepts for the "gke_cluster" module, balancing between flexibility and ease of use.

---

## #1.0.1 - Budgeting woes - [Link](https://weiyuan-liu.medium.com/figuring-it-out-its-google-s-cool-bernetes-time-1-0-1-budgeting-woes-7c4e583a929a?sk=8c63499b26ced6e2d5cb5187f0123054)

Extension to the first episode in this series, where I cover more on creating budget alerts, and common mistakes to avoid when setting it up in Terraform!

---

## #2 - Best ways to manage your GKE Cluster! - [Link](https://weiyuan-liu.medium.com/figuring-it-out-its-google-s-cool-bernetes-time-2-best-ways-to-manage-your-gke-cluster-dfa396c9a14e)

Google Cloud Console, Kubectl, Kubernetes Dashboard, and K9s - which is the best for managing your Kubernetes cluster in Google Cloud? We discuss more here!

See the [TL;DR](https://gist.github.com/Weiyuan-Lane/f7d7ffb4330d037b51093481ff02806e#file-gke_comparing_management_tools-md) for this post for a quick overview

---
