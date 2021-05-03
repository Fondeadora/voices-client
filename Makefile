# Analyze the given Python modules and compute Cyclomatic Complexity
cc_json = "$(shell radon cc --min C voices --json)"
# Analyze the given Python modules and compute the Maintainability Index
mi_json = "$(shell radon mi --min C voices --json)"

files = `find ./voices ./tests -name "*.py"`

help: ## Display this help screen.
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

fmt: ## Format all project files
	@add-trailing-comma $(files)
	@pyformat -i $(files)
	@isort voices tests

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

htmlcov:
	coverage html --include 'voices/*'

xmlcov:
	coverage xml --include 'voices/*'

commit_check:
	cz check --rev-range origin/master..HEAD
