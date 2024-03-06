### Generic Variables
SHELL := /bin/zsh

.PHONY: help
help: ## Display help message (*: main entry points / []: part of an entry point)
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

################################################################################
# AVD Demo Fabric
################################################################################

.PHONY: fabric-build
fabric-build: ## Run ansible playbook to build EVPN Fabric configuration with DC1 and CV
	ansible-playbook playbooks/fabric-build.yml -i inventory/inventory.yml --diff

.PHONY: fabric-cvp-provision
fabric-cvp-provision: ## Run ansible playbook to deploy EVPN Fabric.
	ansible-playbook playbooks/cvp-fabric-deploy.yml -i inventory/inventory.yml --diff

.PHONY: fabric-deploy
fabric-deploy: ## Run ansible playbook to deploy EVPN Fabric.
	ansible-playbook playbooks/cvp-fabric-deploy.yml --extra-vars "execute_tasks=true" --tags "build,provision,apply" -i inventory/inventory.yml --diff

.PHONY: fabric-validate
fabric-validate: ## Run ansible playbook to validate EVPN Fabric.
	ansible-playbook playbooks/fabric-validate-state.yml -i inventory/inventory.yml --diff 
