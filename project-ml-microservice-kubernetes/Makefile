setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.devops
	# source ~/.devops/bin/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements/dev.txt

lint:
	# Hadolint for Dockerfiles
	docker run --rm -i hadolint/hadolint < Dockerfile
	# Pylint for python app
	pylint --disable=R,C,W1203 app.py

all: install lint
