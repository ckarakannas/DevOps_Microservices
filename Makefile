setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.devops
	# source ~/.devops/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements/dev.txt

install-prod:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	# Hadolint for Dockerfiles
	docker run --rm -i hadolint/hadolint < Dockerfile
	# Pylint for python app
	pylint --disable=R,C,W1203 app.py

lint-no-docker:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py

all: install lint
