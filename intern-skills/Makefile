.PHONY: help version patch minor major release

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

version: ## Show current version
	@tr -d '[:space:]' < version.txt

patch: ## Release patch version (1.0.0 -> 1.0.1)
	@./release.sh patch

minor: ## Release minor version (1.0.0 -> 1.1.0)
	@./release.sh minor

major: ## Release major version (1.0.0 -> 2.0.0)
	@./release.sh major

release: ## Release exact version (usage: make release V=2.3.1)
	@test -n "$(V)" || (echo "Usage: make release V=x.y.z" && exit 1)
	@./release.sh $(V)
