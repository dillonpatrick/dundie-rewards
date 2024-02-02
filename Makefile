# Makefile
.PHONY: install virtualenv ipython clean

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

test:
	@pytest -vv -s

watch:
	@ptw -- -vv -s

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