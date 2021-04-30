# Analyze the given Python modules and compute Cyclomatic Complexity
cc_json = "$(shell radon cc --min C src --json)"
# Analyze the given Python modules and compute the Maintainability Index
mi_json = "$(shell radon mi --min C src --json)"

files = `find ./src ./tests -name "*.py"`

help: ## Display this help screen.
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

fmt: ## Format all project files
	@add-trailing-comma $(files)
	@pyformat -i $(files)
	@isort src tests

lint: ## Run flake8 checks on the project.
	@pylint $(files)

test: ## Run unit testings.
	@coverage run -m pytest

test-nocache: ## Run unit testing with out any cache
	@find . -name .pytest_cache -prune -exec rm -rf {} \;
	@pytest -v

install: ## Install project dependencies.
	@pipenv install

npmi: ## Install npm dependencies
	@npm install

venv: ## Create new virtual environment. Run `source venv/bin/activate` after this command to enable it.
	@pipenv shell

run: ## Execute local server
	@./node_modules/.bin/sls offline start

complexity: ## Run radon complexity checks for maintainability status.
	@echo "Complexity check..."

ifneq ($(cc_json), "{}")
	@echo
	@echo "Complexity issues"
	@echo "-----------------"
	@echo $(cc_json)
endif

ifneq ($(mi_json), "{}")
	@echo
	@echo "Maintainability issues"
	@echo "----------------------"
	@echo $(mi_json)
endif

ifneq ($(cc_json), "{}")
	@echo
	exit 1
else
ifneq ($(mi_json), "{}")
	@echo
	exit 1
endif
endif

	@echo "OK"
.PHONY: complexity

htmlcov:
	coverage html --include 'src/*'

xmlcov:
	coverage xml --include 'src/*'

commit_check:
	cz check --rev-range origin/master..HEAD
