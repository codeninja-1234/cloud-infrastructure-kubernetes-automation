test:
	python3 -m pytest app/test_app.py -q

docker-build:
	docker build -t cloud-k8s-demo:local .

k8s-apply:
	kubectl apply -f k8s/namespace.yaml -f k8s/configmap.yaml -f k8s/deployment.yaml -f k8s/service.yaml

k8s-status:
	kubectl -n cloud-demo get pods,svc

ansible-check:
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --check
