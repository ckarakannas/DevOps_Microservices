[![ckarakannas](https://circleci.com/gh/ckarakannas/DevOps_Microservices.svg?style=svg)](https://circleci.com/gh/ckarakannas/DevOps_Microservices/?branch=project-submission)

## Project Summary

This project operationalizes a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the popular Boston dataset, which is taken from Kaggle from [this data source site](https://www.kaggle.com/c/boston-housing). 

The application is based on Python Flask, contained within the main `app.py` file that serves out predictions (inference) about housing prices through API calls.

## Setup the Environment
* Prerequisites: 
  * Modern Linux/macOS distribution. For Windows, best to use WSL2 or a Linux-like environment.
  * Python 3.7 (tested with 3.7.10)
  * Docker Desktop (latest version)
  * Kind or Minikube
* Clone the git repository and cd into the project folder
  ```
  git clone https://github.com/ckarakannas/DevOps_Microservices.git
  cd DevOps_Microservices
  ```
* Create a virtualenv in ~/.devops and activate it
  ```
  make setup
  source ~/.devops/bin/activate
  ```
* Run `make install` to install the necessary dependencies from within the virtual env
* Assuming you have Docker installed and running, run `make lint` for lint checking. Otherwise install [hadolint](https://github.com/hadolint/hadolint) manually and run
  ```
  hadolint Dockerfile
  pylint --disable=R,C,W1203 app.py
  ```
### Running `app.py`

1. Standalone:  `python3 app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Making predictions whilst app is running

1. When running locally: `./make_predictions.sh local`
2. When running on Docker: `./make_prediction.sh`
3. When running on K8S pod: `./make_prediction.sh`

### Kubernetes Steps

* Setup and Configure Docker Desktop locally
* Setup and Configure Kubernetes locally. Preferred method is via installing using [Kind](https://kind.sigs.k8s.io/)
* Once kind is installed, create a [multi-node cluster](https://kind.sigs.k8s.io/docs/user/quick-start/#multinode-clusters)
* Run `./run_kubernetes.sh` to deploy API pod
* Open another window or terminal and run `./make_prediction.sh` to make predictions. Feel free to change the date within the file

## File structure explanation

```
├── Dockerfile -- # file for building docker image
├── Makefile -- # convenience makefile
├── README.md -- # readme
├── app.py -- # main Flask app API script
├── make_prediction.sh -- # script for making predictions
├── model_data -- # boston raw data and pretrained model
│   ├── boston_housing_prediction.joblib
│   └── housing.csv
├── output_txt_files -- # output logs 
│   ├── docker_out.txt
│   └── kubernetes_out.txt
├── requirements -- # files for installing python dependencies
│   ├── common.txt
│   ├── dev.txt
│   └── prod.txt
├── requirements.txt -- # link to prod dependencies
├── run_docker.sh -- # running app in Docker container
├── run_kubernetes.sh -- # running app in K8S pod
└── upload_docker.sh -- # uploading Docker image on DockerHub
```

