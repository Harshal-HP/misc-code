infra:
	git pull
	terraform init
	terraform plan
	terraform apply -auto-approve

infra-destroy:
	git pull
	terraform init
	terraform destroy -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_name)-int.harshaldevops.online, -e ansible_user=harshal  -e ansible_password=harshal@12345 tool_setup.yml -e tool_name=$(tool_name)

github-runner:
	git pull
	ansible-playbook -i github-runner-int.harshaldevops.online, -e ansible_user=harshal  -e ansible_password=harshal@12345 tool_setup.yml -e tool_name=github-runner -e token=$(token)
