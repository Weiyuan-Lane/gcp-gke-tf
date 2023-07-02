.PHONY: first_time_setup bringdown_staging

first-time-setup:
	@./terminal_scripts/ops/first_time_setup.sh

deploy-staging:
	@./terminal_scripts/ops/deploy_staging.sh

bringdown-staging:
	@./terminal_scripts/ops/bringdown_staging.sh