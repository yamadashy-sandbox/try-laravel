help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

# ==================================================
# Code Analysis
# ==================================================
.PHONY: phpstan
phpstan: ## PhpStan
	./vendor/bin/phpstan analyse -c phpstan.neon --memory-limit=2G
