MAKEFLAGS += --silent
.PHONY: 

STAGING_TFVARS_FILE=env/terraform.stg.tfvars
PRODUCTION_TFVARS_FILE=env/terraform.prod.tfvars
WEIYUAN_TFVARS_FILE=weiyuan.tfvars

first-time-setup:
	@./terminal_scripts/ops/first_time_setup.sh

deploy-staging:
	./terminal_scripts/ops/deploy.sh "$(STAGING_TFVARS_FILE)"

deploy-production:
	./terminal_scripts/ops/deploy.sh "$(PRODUCTION_TFVARS_FILE)"

bringdown-staging:
	./terminal_scripts/ops/bringdown.sh "$(STAGING_TFVARS_FILE)"

bringdown-production:
	./terminal_scripts/ops/bringdown.sh "$(PRODUCTION_TFVARS_FILE)"

plan-staging:
	./terminal_scripts/ops/plan.sh "$(STAGING_TFVARS_FILE)"

plan-production:
	./terminal_scripts/ops/plan.sh "$(PRODUCTION_TFVARS_FILE)"







deploy-dev: 
	./terminal_scripts/ops/deploy.sh "$(WEIYUAN_TFVARS_FILE)"

bringdown-dev:
	./terminal_scripts/ops/bringdown.sh "$(WEIYUAN_TFVARS_FILE)"

plan-dev:
	./terminal_scripts/ops/plan.sh "$(WEIYUAN_TFVARS_FILE)"

