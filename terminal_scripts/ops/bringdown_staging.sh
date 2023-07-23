#!/bin/sh

# Include all common script dependencies --------------------------------------
source 'terminal_scripts/utils/load_script_env_vars.sh'
source 'terminal_scripts/utils/echo_and_run.sh'
# ----------------------------------------------------------------- Include End

# Deploy staging terraform
echoAndRun "terraform -chdir=$TERRAFORM_DIR destroy -var-file=$STAGING_TFVARS_FILE"
# echoAndRun "terraform -chdir=$TERRAFORM_DIR destroy -var-file=weiyuan.tfvars"

