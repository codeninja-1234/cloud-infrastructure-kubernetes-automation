# Cloud Infrastructure & Kubernetes Automation Platform

A portfolio project demonstrating containerization, Kubernetes orchestration,
Infrastructure as Code, Linux automation, and CI/CD around a small Flask service.

## Stack

- Python / Flask
- Docker
- Kubernetes
- Terraform
- Ansible
- GitHub Actions
- Linux

## Architecture

GitHub -> GitHub Actions -> Docker image -> Kubernetes Deployment -> Service

Terraform provides reproducible cloud infrastructure definitions, while Ansible
demonstrates Linux host configuration automation.

## Local application

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r app/requirements.txt
python app/app.py
```

Open http://localhost:5000/health.

## Tests

```bash
pytest app/test_app.py -q
```

## Docker

```bash
docker build -t cloud-k8s-demo:local .
docker run --rm -p 5000:5000 cloud-k8s-demo:local
```

## Kubernetes

A local cluster such as Minikube or kind can be used.

```bash
docker build -t cloud-k8s-demo:local .
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl -n cloud-demo get pods,svc
```

For kind/Minikube, load the locally built image into the cluster as required
by that platform.

## Terraform

The Terraform configuration is intentionally cost-conscious. It demonstrates
provider configuration, variables, outputs, tagging, and an S3 artifact bucket.
Review AWS pricing and IAM permissions before running `terraform apply`.

```bash
cd terraform
terraform init
terraform validate
terraform plan
```

Do not run `terraform apply` unless you understand the AWS resources and costs.

## Ansible

```bash
ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --check
```

## CI/CD

GitHub Actions runs Python tests and builds the Docker image on pushes and pull
requests.

## Important

This repository is a complete starter implementation, but cloud/Kubernetes
deployment must be tested in the user's own environment before claiming
successful deployment metrics or production readiness.
