#!/bin/sh

# Include all common script dependencies --------------------------------------
source 'terminal_scripts/utils/load_script_env_vars.sh'
source 'terminal_scripts/utils/echo_and_run.sh'
# ----------------------------------------------------------------- Include End

# Bringdown command
echoAndRun "terraform -chdir=$TERRAFORM_DIR destroy -var-file=$1"

