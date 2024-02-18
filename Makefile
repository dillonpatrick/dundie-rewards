# Makefile
.PHONY: install virtualenv ipython clean pflake8

install-dev:
	@echo "Installing for dev environment"
	@pip install -e '.[dev]'

install-test:
	@echo "Installing for test environment"
	@pip install -e '.[test]'

virtualenv:
	@python -m venv .venv


ipython:
	@ipython

lint:
	@flake8 --exclude .venv,build

fmt:
	@isort dundie tests integration
	@black dundie tests integration

test:
	@pytest -vv -s

watch:
	@ptw -c -- -vv -s 

#TODO: mudar para comando compativel com windows
clean:            ## Clean unused files.
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -exec rm -rf {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	@rm -rf .cache
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf *.egg-info
	@rm -rf htmlcov
	@rm -rf .tox/
	@rm -rf docs/_build
