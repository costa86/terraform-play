.DEFAULT_GOAL := help
.ONESHELL:
valid_envs := dev uat bench prod
env := $(word 1,$(valid_envs))
cmd_plan := terraform plan -var-file=$(env).tfvars
cmd_apply := terraform apply -auto-approve -var-file=$(env).tfvars
cmd_destroy := terraform destroy -auto-approve -var-file=$(env).tfvars
compliance_config_file := tfsec.yaml
compliance_report_file := tfsec-report
cmd_compliance := tfsec --config-file $(compliance_config_file)
documentation_file := documentation.md
valid_log_levels := ERROR WARN INFO DEBUG TRACE    
level := $(word 1,$(valid_log_levels))
log_file := /home/costa/coding/misc/tf_one/tf-log.log
cmd_documentation := terraform-docs markdown table . --output-file $(documentation_file)
save := 0

ifeq (,$(filter $(env),$(valid_envs)))
$(error Invalid env specified. Available envs: $(valid_envs))
endif

ifeq (,$(filter $(level),$(valid_log_levels)))
$(error Invalid level specified. Available levels: $(valid_log_levels))
endif

define target_info
    @echo "$(1)"
    @echo "Description: $(2)"
    @echo "Run: $(3)"
    @echo "-----------------------"
endef

help:
	@echo "USAGE:\nmake <target> <parameter>=<value>"
	@echo "PARAMETER VALUES CHOICES (space-separated):"
	@echo env: $(valid_envs)
	@echo level: $(valid_log_levels)
	@echo "TARGETS:"
	$(call target_info,plan env=$(env) level=$(level),Plan execution and save log to $(log_file)\
	using $(level) level,$(cmd_plan))
	$(call target_info,apply env=$(env),Create infrastructure,$(cmd_apply))
	$(call target_info,destroy env=$(env),Destroy infrastructure,$(cmd_destroy))
	$(call target_info,doc,Generate documentation,$(cmd_documentation))
	$(call target_info,compliance save=$(save),Check compliance with tfsec. \
	The configuration is in $(compliance_config_file).\
	\nIf save=1 then save the report to $(compliance_report_file).md \
	and $(compliance_report_file).json,$(cmd_compliance))	

pre:
	@terraform fmt -recursive
	@terraform validate

change_workspace: pre 
	@terraform workspace select $(env)

apply: change_workspace
	$(cmd_apply)

destroy: change_workspace
	$(cmd_destroy)

plan: change_workspace
	@export TF_LOG=$(level)
	@export TF_LOG_PATH=$(log_file)
	$(cmd_plan)

compliance:
	@if [ "$(save)" = "1" ]; then \
		$(cmd_compliance) --format markdown > $(compliance_report_file).md;\
		$(cmd_compliance) --format json > $(compliance_report_file).json;\
	else \
		$(cmd_compliance);\
    fi

doc:
	$(cmd_documentation)