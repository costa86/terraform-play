valid_envs := dev uat bench prod
env := $(word 1,$(valid_envs))
cmd_plan := terraform plan -var-file=$(env).tfvars
cmd_apply := terraform apply -auto-approve -var-file=$(env).tfvars
cmd_destroy := terraform destroy -auto-approve -var-file=$(env).tfvars

ifeq (,$(filter $(env),$(valid_envs)))
$(error Invalid env specified. Available envs: $(valid_envs))
endif

help:
	@echo "Usage:\nmake <command> env=<env>"
	@echo "[INFO] Each env is mapped to a terraform workspace"
	@echo "[INFO] Current env: $(env)"
	@echo "[INFO] Available envs: $(valid_envs)"
	@echo "Commands:"
	@echo "plan env=$(env): $(cmd_plan)"
	@echo "apply env=$(env): $(cmd_apply)"
	@echo "destroy env=$(env): $(cmd_destroy)"


all: help

pre:
	terraform fmt -recursive
	terraform validate

change_workspace: pre
	terraform workspace select $(env)

apply: change_workspace
	$(cmd_apply)

destroy: change_workspace
	$(cmd_destroy)

plan: change_workspace
	$(cmd_plan)