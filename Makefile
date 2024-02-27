# Makefile
.PHONY: install virtualenv ipython clean pflake8 fmt lint watch docs docs-serve

install:
	@echo "Installing for dev environment"
	@python -m pip install -e '.[dev]'

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
	@pytest -vv

watch:
	@ptw -c -- -vv -s 

docs:
	@mkdocs build --clean

docs-serve:
	@mkdocs serve

build:
	@python setup.py sdist bdist_wheel clean --all

publish-test:
	@twine upload --repository testpypi dist/*

publish:
	@twine upload dist/*

#TODO: mudar para comando compativel com windows
clean:
	@rmdir /s /q build dist .pytest_cache .cache .mypy_cache htmlcov .tox
	@rmdir *.egg-info -recurse
