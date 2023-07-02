#!/bin/sh

# Include all common script dependencies --------------------------------------
source 'terminal_scripts/utils/load_script_env_vars.sh'
source 'terminal_scripts/utils/echo_and_run.sh'
source 'terminal_scripts/utils/prompt_user_input.sh'
# ----------------------------------------------------------------- Include End

promptGCPProjectId

# Enable all GCP APIs required to run Terraform
echoAndRun "gcloud services enable container.googleapis.com --project $gcpProjectId"
echoAndRun "gcloud services enable cloudbilling.googleapis.com --project $gcpProjectId"
echoAndRun "gcloud services enable billingbudgets.googleapis.com --project $gcpProjectId"

# Init terraform for the first time
echoAndRun "terraform -chdir=$TERRAFORM_DIR init"
