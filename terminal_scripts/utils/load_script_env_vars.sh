#!/bin/sh

TMP_DIR=".tmp"
mkdir -p $TMP_DIR

GCP_PROJECT_ID_FILE=".gcpprojectid"
TERRAFORM_DIR=terraform
STAGING_TFVARS_FILE="env/terraform.stg.tfvars"
PRODUCTION_TFVARS_FILE="env/terraform.prod.tfvars"

ECHO_YELLOW_COLOR='\033[1;33m'
ECHO_RED_COLOR='\033[0;31m'
ECHO_GREEN_COLOR='\033[0;32m'
ECHO_WHITE_COLOR='\033[1;37m'
ECHO_NO_COLOR='\033[0m'
