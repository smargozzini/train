PROJECT ?= expenses

SHELL := /bin/bash

BOLD ?= $(shell tput bold)
NORMAL ?= $(shell tput sgr0)

services-port:
	@set -o pipefail; \
	docker-compose port ${SERVICE} ${PORT} 2> /dev/null | cut -d':' -f2 || echo ${PORT}
