#
#? Settings and Variables (Works for windows 11)
#? CURDIR is the directory of the Makefile, even if it is called from a subdirectory with make -C
#

# Makefile

# Load .env file if it exists
ifneq (,$(wildcard ./env/pipeline.env))
	include ./env/pipeline.env
	export
endif

PROJECT_NAME := iot
PROJECT_NAME_FLAG := --project-name $(PROJECT_NAME)
DOCKER_COMPOSE_FILE := $(CURDIR)/docker/docker-compose.yaml
ENV_FOLDER := $(CURDIR)/env
ENV_FILE := $(ENV_FOLDER)/docker.env
DOCKER_LOGIN_ENV_FILE := $(ENV_FOLDER)/docker_login.env
DOCKER_FLAG_FILE := --file $(DOCKER_COMPOSE_FILE)
DOCKER_FLAGS_ENV := --env-file $(ENV_FILE)\
					--env-file $(DOCKER_LOGIN_ENV_FILE)

DOCKER_COMPOSE_RAW := docker compose $(PROJECT_NAME_FLAG) $(DOCKER_FLAG_FILE)
# DOCKER_COMPOSE := $(DOCKER_COMPOSE_RAW) $(DOCKER_FLAGS_ENV)
DOCKER_COMPOSE := $(DOCKER_COMPOSE_RAW)
NPX_PREFIX := npx --prefix $(CURDIR)/app

.PHONY: print
print:
	@echo "CURDIR" $(CURDIR)
	@echo "@D" $(@D)
	@echo "@F" $(@F)
	@echo "@" $(@)
	@echo "%" $(%)
	@echo "%D" $(%D)

.PHONY: .ONESHELL
.ONESHELL:
#
#? Docker
#
.PHONY: up
up:
	$(DOCKER_COMPOSE) up

.PHONY: build
build:
	$(DOCKER_COMPOSE) build

.PHONY: down
down:
	$(DOCKER_COMPOSE) down

.PHONY: fresh
fresh:
	$(DOCKER_COMPOSE_RAW) down --remove-orphans --volumes
	$(DOCKER_COMPOSE) build --no-cache

.PHONY: clean
clean:
	$(DOCKER_COMPOSE_RAW) down --remove-orphans --volumes


.PHONY: clear-db
clear-db:
	@echo "Clearing data from InfluxDB bucket..."
	$(DOCKER_COMPOSE) exec influxdb influx delete --bucket mybucket \
		--org myorg \
		--token myadmintoken \
		--start 2010-01-01T00:00:00Z \
		--stop 2025-01-01T00:00:00Z