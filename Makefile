.DEFAULT_GOAL:=help
DOCKERFILE:=./Dockerfile
ROOT_DIR:=.

################################################################################
# TASKS
################################################################################

.PHONY: help ## display this help message
help:
	@echo "Makefile as a task runner"
	@echo ""
	@echo "Targets:"
	@grep -E '^\.PHONY: [a-zA-Z_-]+ ##' $(MAKEFILE_LIST) |\
		sed -r "s/\.PHONY: //" |\
		awk 'BEGIN {FS = " ## "}; {printf "  %-18s %s\n", $$1, $$2}'

.PHONY: up ## docker compose up
up:
	docker compose up -d

.PHONY: down ## docker compose down
down:
	docker compose down

.PHONY: nginx_bash ## run bash in nginx container
bash:
	docker compose exec -it nginx bash
