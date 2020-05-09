.DEFAULT_GOAL := help

.PHONY: help
help:  ## Shows this help message.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target> <arg=value>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m  %s\033[0m\n\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ 🚀 Getting started

.PHONY: build
build: ## Build docker image including base dependencies.
	docker-compose build

.PHONY: up
up: ## Boot up Jupyter Notebook (see token in log).
	docker-compose up -d
	docker-compose logs

.PHONY: down
down: ## Stop notebook
	docker-compose down
